/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.services;

import com.ksm.hazardreportapp.entities.Actions;
import com.ksm.hazardreportapp.repositories.ActionsRepository;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author YOGA
 */
@Service
public class ActionsService {

    ActionsRepository repository;

    public List<Actions> getAll() {
        return repository.findAll();
    }

    public Actions getById(Integer id) {
        return repository.findById(id).get();
    }

    public boolean save(Actions actions) {
        try {
            repository.save(actions);
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

    public boolean update(Actions actions) {
        try {
            repository.save(actions);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
