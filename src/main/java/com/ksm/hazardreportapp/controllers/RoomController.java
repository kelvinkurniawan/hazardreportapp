/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.controllers;

import com.ksm.hazardreportapp.entities.Rooms;
import com.ksm.hazardreportapp.services.FloorService;
import com.ksm.hazardreportapp.services.RoomService;
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
    RoomService roomService;

    @Autowired
    FloorService floorService;

    String id = "USER-00101";
    int floor = 1;

    // Routes for admin as HSE
    @GetMapping("/admin/floor")
    public String manageFloor() {
        return "manageFloor";
    }

    // Routes for admin as FLadmin
    @GetMapping("/fladmin/room")
    public String manageRoom(Model model) {
        model.addAttribute("rooms", roomService.getAllByFloor(floor));
        model.addAttribute("newRoom", new Rooms());
        model.addAttribute("floor", floor);
        return "manageRoom";
    }

    @PostMapping("/fladmin/room")
    public String performAddRoom(Rooms rooms) {
        roomService.save(rooms);
        return "redirect:/fladmin/room?res=added";
    }

    @GetMapping("/fladmin/room/update/{id}")
    public String updateRoom(Model model, @PathVariable("id") int id) {
        model.addAttribute("rooms", roomService.getAllByFloor(floor));
        model.addAttribute("room", roomService.getById(id));
        return "manageRoomUpdate";
    }

    @GetMapping("/fladmin/room/perform_delete/{id}")
    public String performDeleteRoom(@PathVariable("id") int id) {
        roomService.delete(id);
        return "redirect:/fladmin/room?res=deleted";
    }

}
