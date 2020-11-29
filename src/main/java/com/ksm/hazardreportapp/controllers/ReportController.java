/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.controllers;

import com.ksm.hazardreportapp.entities.ImageAttachments;
import com.ksm.hazardreportapp.entities.Reports;
import com.ksm.hazardreportapp.services.ImageAttachmentsService;
import com.ksm.hazardreportapp.services.ImageStorageService;
import com.ksm.hazardreportapp.services.PriorityService;
import com.ksm.hazardreportapp.services.ReportsService;
import com.ksm.hazardreportapp.services.RoomsService;
import com.ksm.hazardreportapp.services.StatusesService;
import com.ksm.hazardreportapp.services.UsersService;
import java.util.Arrays;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author kelvi
 */
@Controller
public class ReportController {

    @Autowired
    ReportsService reportsService;

    @Autowired
    UsersService usersService;

    @Autowired
    RoomsService roomsService;

    @Autowired
    PriorityService priorityService;

    @Autowired
    StatusesService statusesService;

    @Autowired
    ImageAttachmentsService imageAttachmentsService;

    @Autowired
    ImageStorageService imageStorageService;

    String id = "USER-00101";

    @GetMapping("/admin/manage_report")
    public String manageReport(Model model) {
        model.addAttribute("reports", reportsService.getAll());
        return "manageReport";
    }

    @GetMapping("/admin/manage_report/create_report")
    public String newReport(Model model) {
        model.addAttribute("originator", usersService.getById(id));
        model.addAttribute("rooms", roomsService.getAll());
        return "addReport";
    }

    @GetMapping("/admin/manage_report/update_report")
    public String updateReport() {
        return "updateReport";
    }

    @GetMapping("/admin/manage_report/details/{id}")
    public String viewReportDetail(@PathVariable("id") int id, Model model) {
        model.addAttribute("report", reportsService.getById(id));
        model.addAttribute("originator", usersService.getById(this.id));
        model.addAttribute("rooms", roomsService.getAll());
        model.addAttribute("priority", priorityService.getAll());
        return "viewReport";
    }

    @PostMapping("admin/manage_report/perform_add")
    public String performAdd(@RequestParam("files") MultipartFile[] files, Reports reports) {

        reportsService.save(reports);
        System.out.println("report id = " + reports.getId());

        Arrays.asList(files).stream().forEach(file -> {
            ImageAttachments imageAttachments = new ImageAttachments();
            imageAttachments.setImagePath(file.getOriginalFilename());
            imageAttachments.setReport(reports);

            imageStorageService.save(file);
            imageAttachmentsService.save(imageAttachments);
        });

        return "redirect:/admin/manage_report";
    }

    @GetMapping("admin/history/{id}")
    public String reportHistory(@PathVariable("id") int id, Model model) {
        model.addAttribute("report", reportsService.getById(id));
        return "reportHistory";
    }
}
