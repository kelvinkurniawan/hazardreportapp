/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.controllers;

import com.ksm.hazardreportapp.entities.Rooms;
import com.ksm.hazardreportapp.services.FloorsService;
import com.ksm.hazardreportapp.services.RoomsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author kelvi
 */
@Controller
public class RoomController {

    @Autowired
    RoomsService roomsService;

    @Autowired
    FloorsService floorsService;

    String id = "USER-00101";
    int floor = 1;

    @GetMapping("/admin/manage_room")
    public String manageRoom(Model model) {
        model.addAttribute("rooms", roomsService.getAllByFloor(floor));
        model.addAttribute("newRoom", new Rooms());
        model.addAttribute("floor", floor);
        return "manageRoom";
    }

    @PostMapping("/admin/manage_room")
    public String performAddRoom(Rooms rooms) {
        roomsService.save(rooms);
        return "redirect:/admin/manage_room";
    }

    @GetMapping("/admin/manage_room/update/{id}")
    public String updateRoom(Model model, @PathVariable("id") int id) {
        model.addAttribute("rooms", roomsService.getAllByFloor(floor));
        model.addAttribute("room", roomsService.getById(id));
        return "manageRoomUpdate";
    }

    @GetMapping("/admin/manage_room/perform_delete/{id}")
    public String performDeleteRoom(@PathVariable("id") int id) {
        roomsService.delete(id);
        return "redirect:/admin/manage_room";
    }

    @GetMapping("/admin/manage_floor")
    public String manageFloor() {
        return "manageFloor";
    }
}
