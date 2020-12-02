package com.ksm.hazardreportapp.controllers;

import com.ksm.hazardreportapp.entities.Actions;
import com.ksm.hazardreportapp.entities.Reports;
import com.ksm.hazardreportapp.services.ActionService;
import com.ksm.hazardreportapp.services.ReportService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author kelvi
 */
@Controller
public class ActionController {

    @Autowired
    ActionService actionService;

    @Autowired
    ReportService reportService;

    @GetMapping("/admin/report/{id}/action/new")
    public String addNewAction(@PathVariable("id") int id, Model model) {
        int priority = reportService.getById(id).getPriority().getId();

        if(priority == 3){
            model.addAttribute("actionType", 1);
        }else{
            model.addAttribute("actionType", 2);
        }

        model.addAttribute("reportId", id);
        model.addAttribute("newAction", new Actions());
        return "createAction";
    }

    @GetMapping("/admin/report/{id}/action/view/{actionId}")
    public String viewAction(@PathVariable("actionId") int actionId, Model model){
        model.addAttribute("action", actionService.getById(actionId));
        return "viewAction";
    }

    @PostMapping("/admin/report/{id}/action/new")
    public String performAddNewAction(@PathVariable("id") int id, Actions actions) {
        Reports reports = reportService.getById(id);

        int priority = reports.getPriority().getId();

        if(priority == 3){
            actions.setReportProgress(reportService.updateStatus(3, id));
            actions.setReportProgress(reportService.updateStatus(4, id));
        }else{
            actions.setReportProgress(reportService.updateStatus(3, id));
            actions.setReportProgress(reportService.updateStatus(6, id));
        }

        actionService.save(actions);
        return "redirect:/admin/report/{id}/action";
    }

}
