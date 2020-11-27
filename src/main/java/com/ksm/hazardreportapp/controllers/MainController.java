/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author kelvi
 */
@Controller
public class MainController {

    @GetMapping("")
    public String index() {
        return "dashboard";
    }

    @GetMapping("/admin/manage_report")
    public String manageReport() {
        return "manageReport";
    }

    @GetMapping("/admin/manage_report/create_report")
    public String newReport() {
        return "addReport";
    }

    @GetMapping("/admin/manage_report/update_report")
    public String updateReport() {
        return "updateReport";
    }

    @GetMapping("/admin/action/create_action")
    public String createAction() {
        return "createAction";
    }

    @GetMapping("/admin/action/create_action_temp")
    public String createTempAction() {
        return "createActionTemp";
    }

    @GetMapping("/admin/manage_room")
    public String manageRoom() {
        return "manageRoom";
    }

    @GetMapping("/admin/manage_floor")
    public String manageFloor() {
        return "manageFloor";
    }

    @GetMapping("/auth/login")
    public String loginPage() {
        return "login";
    }

}
