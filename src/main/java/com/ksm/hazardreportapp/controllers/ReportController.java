/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.controllers;

import com.ksm.hazardreportapp.entities.ImageAttachments;
import com.ksm.hazardreportapp.entities.Reports;
import com.ksm.hazardreportapp.entities.Users;
import com.ksm.hazardreportapp.providers.CustomUser;
import com.ksm.hazardreportapp.services.*;
import com.pusher.rest.Pusher;
import java.util.Arrays;
import java.util.Collections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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

    // Routes for admin as HSE
    @GetMapping("/admin/report")
    public String manageReport(Model model) {
        CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String id = user.getId();
        if (user.getAuthorities().stream().anyMatch(role -> role.getAuthority().equals("FW"))) {
            model.addAttribute("reports", reportService.getAllByUser(id));
        } else if (user.getAuthorities().stream().anyMatch(role -> role.getAuthority().equals("HSE"))) {
            model.addAttribute("reports", reportService.getAllByCurrentStatus());
        } else if (user.getAuthorities().stream().anyMatch(role -> role.getAuthority().equals("EMPLOYEE"))) {
            Users localUser = userService.getById(id);
            model.addAttribute("reports", reportService.getAllByOriginator(localUser));
        }
        model.addAttribute("title", "Manage Report");

        return "manageReport";
    }

    @GetMapping("/admin/recap")
    public String recapReport(Model model) {
        model.addAttribute("reports", reportService.getAll());
        model.addAttribute("title", "Recap Report");
        return "recapReport";
    }

    @GetMapping("/admin/report/new")
    public String newReport(Model model) {
        CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String id = user.getId();
        model.addAttribute("originator", userService.getById(id));
        model.addAttribute("rooms", roomService.getAll());
        model.addAttribute("title", "Create Report");
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
    public String setPriority(@PathVariable("id") int id, Reports reports) {
        Pusher pusher = new Pusher("1121252", "75b839e2c030a656a41c", "f17af836b1f4bcfeeffe");
        pusher.setCluster("ap1");
        pusher.setEncrypted(true);
        pusher.trigger("my-channel", "updateNotif", Collections.singletonMap("message", "success"));
        reportService.setPriority(id, reports.getPriority().getId());
        reportService.updateStatus(2, id);
        return "redirect:/admin/report/details/" + id + "?res=priority-setup";
    }

    @GetMapping("/admin/report/details/{id}")
    public String viewReportDetail(@PathVariable("id") int id, Model model) {
        CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String userId = user.getId();
        model.addAttribute("report", reportService.getById(id));
        model.addAttribute("reportId", id);
        model.addAttribute("originator", userService.getById(userId));
        model.addAttribute("rooms", roomService.getAll());
        model.addAttribute("priority", priorityService.getAll());
        model.addAttribute("title", "Report Detail");
        return "viewReport";
    }

    @GetMapping("admin/report/history/{id}")
    public String reportHistory(@PathVariable("id") int id, Model model) {
        model.addAttribute("report", reportService.getById(id));
        model.addAttribute("title", "Report Progress History");
        return "reportHistory";
    }
}
