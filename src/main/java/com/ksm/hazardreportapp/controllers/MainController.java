/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.controllers;

import com.ksm.hazardreportapp.services.ImageAttachmentService;
import com.ksm.hazardreportapp.services.ImageStorageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

/**
 *
 * @author kelvi
 */
@Controller
public class MainController {

    @Autowired
    ImageAttachmentService imageAttachmentService;

    @Autowired
    ImageStorageService imageStorageService;

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
}
