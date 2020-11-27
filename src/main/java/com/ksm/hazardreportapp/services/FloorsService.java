/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.services;

import com.ksm.hazardreportapp.entities.Floors;
import com.ksm.hazardreportapp.repositories.FloorsRepository;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author YOGA
 */
@Service
public class FloorsService {

    FloorsRepository repository;

    public List<Floors> getAll() {
        return repository.findAll();
    }

    public Floors getById(Integer id) {
        return repository.findById(id).get();
    }

    public boolean save(Floors floors) {
        try {
            repository.save(floors);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean delete(Integer id) {
        try {
            repository.deleteById(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean update(Floors floors) {
        try {
            repository.save(floors);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
