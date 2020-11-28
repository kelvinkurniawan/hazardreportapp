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

    @GetMapping("/admin/action/create_action")
    public String createAction() {
        return "createAction";
    }

    @GetMapping("/admin/action/create_action_temp")
    public String createTempAction() {
        return "createActionTemp";
    }

}
