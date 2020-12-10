/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.controllers;

import com.ksm.hazardreportapp.entities.Notifications;
import com.ksm.hazardreportapp.providers.CustomUser;
import com.ksm.hazardreportapp.repositories.NotificationRepository;
import com.ksm.hazardreportapp.services.ImageStorageService;
import com.ksm.hazardreportapp.services.NotificationService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 *
 * @author kelvi
 */
@Controller
public class MainController {

    @Autowired
    NotificationService notificationService;

    @Autowired
    ImageStorageService imageStorageService;

    @Autowired
    NotificationRepository notificationRepository;

    // Rouotes for admin as HSE
    @GetMapping("/admin")
    public String index() {
        CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        String id = user.getId();
        System.out.println("USER ID : " + id + "");
        System.out.println("ROLES : " + user.getAuthorities());
        return "dashboard";
    }

    // Other routes
    @GetMapping("/files/{filename:.+}")
    public ResponseEntity<Resource> getFile(@PathVariable String filename) {
        Resource file = imageStorageService.load(filename);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"").body(file);
    }

    @GetMapping("/open/{id}")
    public String openNotification(@PathVariable int id, @RequestParam String url) {
        notificationService.readNotification(id);
        return "redirect:" + url;
    }

    @ResponseBody
    @GetMapping("api/get/notification")
    public List<Notifications> getNotification() {
        CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String id = user.getId();
        return notificationService.getByUserId(id);
    }
}
