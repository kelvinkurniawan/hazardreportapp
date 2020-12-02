/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.services;

import com.ksm.hazardreportapp.entities.ReportProgresses;
import com.ksm.hazardreportapp.entities.Reports;
import com.ksm.hazardreportapp.entities.Statuses;
import com.ksm.hazardreportapp.repositories.ReportRepository;
import java.util.List;

import com.ksm.hazardreportapp.repositories.StatusRepository;
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

    public List<Reports> getAll() {
        return repository.findAll();
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

    public ReportProgresses updateStatus(int status, int id){
        Reports reports = repository.findById(id).get();
        Statuses statuses = statusRepository.findById(status).get();
        reports.setCurrentStatus(statuses);
        repository.save(reports);

        List<ReportProgresses> reportProgresses = reports.getReportProgressesList();
        return reportProgresses.get(reportProgresses.size() - 1);
    }

    public boolean setPriority(int id, int priority){
        Reports reports = repository.findById(id).get();
        reports.setPriority(priorityService.getById(priority));
        try{
            repository.save(reports);
            return true;
        }catch (Exception e){
            return false;
        }
    }
}
