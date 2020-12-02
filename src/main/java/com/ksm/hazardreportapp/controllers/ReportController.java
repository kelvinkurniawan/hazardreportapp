/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.controllers;

import com.ksm.hazardreportapp.entities.ImageAttachments;
import com.ksm.hazardreportapp.entities.Reports;
import com.ksm.hazardreportapp.services.*;

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
    ReportService reportService;

    @Autowired
    UserService userService;

    @Autowired
    RoomService roomService;

    @Autowired
    PriorityService priorityService;

    @Autowired
    ImageAttachmentService imageAttachmentService;

    @Autowired
    ImageStorageService imageStorageService;

    String id = "USER-00101";

    // Routes for admin as HSE
    @GetMapping("/admin/report")
    public String manageReport(Model model) {
        model.addAttribute("reports", reportService.getAll());
        return "manageReport";
    }

    @GetMapping("/admin/report/new")
    public String newReport(Model model) {
        model.addAttribute("originator", userService.getById(id));
        model.addAttribute("rooms", roomService.getAll());
        return "addReport";
    }

    @PostMapping("/admin/report/new")
    public String performAdd(@RequestParam("files") MultipartFile[] files, Reports reports) {

        reportService.save(reports);
        System.out.println("report id = " + reports.getId());

        Arrays.asList(files).stream().forEach(file -> {
            ImageAttachments imageAttachments = new ImageAttachments();
            imageAttachments.setImagePath(file.getOriginalFilename());
            imageAttachments.setReport(reports);

            imageStorageService.save(file);
            imageAttachmentService.save(imageAttachments);
        });

        return "redirect:/admin/report?res=added";
    }

    @GetMapping("/admin/report/modify")
    public String updateReport() {
        return "updateReport";
    }

    @PostMapping("/admin/report/modify/{id}/priority")
    public String setPriority(@PathVariable("id") int id, Reports reports){
        reportService.setPriority(id, reports.getPriority().getId());
        reportService.updateStatus(2, id);
        return "redirect:/admin/report/details/" + id;
    }

    @GetMapping("/admin/report/details/{id}")
    public String viewReportDetail(@PathVariable("id") int id, Model model) {
        model.addAttribute("report", reportService.getById(id));
        model.addAttribute("reportId", id);
        model.addAttribute("originator", userService.getById(this.id));
        model.addAttribute("rooms", roomService.getAll());
        model.addAttribute("priority", priorityService.getAll());
        return "viewReport";
    }

    @GetMapping("admin/report/history/{id}")
    public String reportHistory(@PathVariable("id") int id, Model model) {
        model.addAttribute("report", reportService.getById(id));
        return "reportHistory";
    }
}
