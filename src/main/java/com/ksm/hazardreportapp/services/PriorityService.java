/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.services;

import com.ksm.hazardreportapp.entities.Priority;
import com.ksm.hazardreportapp.repositories.PriorityRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author YOGA
 */
@Service
public class PriorityService {
     @Autowired
    PriorityRepository repository;
    
    public List<Priority> getAll(){
        return repository.findAll();
    }
    
    public Priority getById(Integer id){
        return repository.findById(id).get();
    }
    
    public boolean save(Priority priority){
        try {
            repository.save(priority);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean delete(Integer id){
        try {
            repository.deleteById(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public boolean update(Priority priority){
        try {
            repository.save(priority);
            return true;
        } catch (Exception e) {
            return false;
        }
}    
}
