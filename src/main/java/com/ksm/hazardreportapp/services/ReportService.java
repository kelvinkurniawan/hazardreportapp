/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.services;

import com.ksm.hazardreportapp.entities.Floors;
import com.ksm.hazardreportapp.entities.ReportProgresses;
import com.ksm.hazardreportapp.entities.Reports;
import com.ksm.hazardreportapp.entities.Rooms;
import com.ksm.hazardreportapp.entities.Statuses;
import com.ksm.hazardreportapp.entities.Users;
import com.ksm.hazardreportapp.repositories.ReportRepository;
import com.ksm.hazardreportapp.repositories.StatusRepository;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Boona
 */
@Service
public class ReportService {

    @Autowired
    ReportRepository repository;

    @Autowired
    StatusRepository statusRepository;

    @Autowired
    PriorityService priorityService;

    @Autowired
    UserService userService;

    @Autowired
    FloorService floorService;

    public List<Reports> getAll() {
        return repository.findAll();
    }

    public List<Reports> getAllByUser(String id) {
        Users user = userService.getById(id);
        List<Floors> floors = user.getFloorsList();
        List<Rooms> finalRooms = new ArrayList<>();

        floors.forEach((floor) -> {
            List<Rooms> rooms = floor.getRoomsList();
            rooms.forEach((room) -> {
                finalRooms.add(room);
            });
        });
        System.out.println(finalRooms);
        return repository.findByRoomIn(finalRooms);

    }

    public List<Reports> getAllByOriginator(Users user) {
        return repository.findByOriginator(user);
    }

    public Reports getById(int id) {
        return repository.findById(id).get();
    }

    public Reports save(Reports reports) {
        return repository.save(reports);
    }

    public void delete(int id) {
        repository.delete(new Reports(id));
    }

    public ReportProgresses updateStatus(int status, int id) {
        Reports reports = repository.findById(id).get();
        Statuses statuses = statusRepository.findById(status).get();
        reports.setCurrentStatus(statuses);
        repository.save(reports);

        List<ReportProgresses> reportProgresses = reports.getReportProgressesList();
        return reportProgresses.get(reportProgresses.size() - 1);
    }

    public boolean setPriority(int id, int priority) {
        Reports reports = repository.findById(id).get();
        reports.setPriority(priorityService.getById(priority));
        try {
            repository.save(reports);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
