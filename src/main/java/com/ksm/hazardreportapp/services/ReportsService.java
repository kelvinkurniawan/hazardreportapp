/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.services;

import com.ksm.hazardreportapp.entities.Reports;
import com.ksm.hazardreportapp.repositories.ReportsRepository;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Boona
 */
@Service
public class ReportsService {

    ReportsRepository repository;

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
}
