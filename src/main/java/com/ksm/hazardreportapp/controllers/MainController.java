/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.controllers;

import com.ksm.hazardreportapp.entities.NotificationJson;
import com.ksm.hazardreportapp.entities.Notifications;
import com.ksm.hazardreportapp.repositories.NotificationRepository;
import com.ksm.hazardreportapp.services.ImageAttachmentService;
import com.ksm.hazardreportapp.services.ImageStorageService;
import com.ksm.hazardreportapp.services.NotificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

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

    String id = "USER-00101";

    // Rouotes for admin as HSE
    @GetMapping("/admin")
    public String index() {
        return "dashboard";
    }

    // Other routes
    @GetMapping("/files/{filename:.+}")
    public ResponseEntity<Resource> getFile(@PathVariable String filename) {
        Resource file = imageStorageService.load(filename);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + file.getFilename() + "\"").body(file);
    }

    @ResponseBody
    @GetMapping("api/get/notification")
    public void getNotification(){
        notificationService.getByUserId(id);
    }
}
