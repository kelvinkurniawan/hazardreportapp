/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.services;

import com.ksm.hazardreportapp.entities.Roles;
import com.ksm.hazardreportapp.repositories.RoleRepository;
import java.util.List;
import org.springframework.stereotype.Service;

/**
 *
 * @author Boona
 */
@Service
public class RoleService {

    RoleRepository repository;

    public List<Roles> getAll() {
        return repository.findAll();
    }

    public Roles getById(int id) {
        return repository.findById(id).get();
    }

    public Roles save(Roles roles) {
        return repository.save(roles);
    }

    public void delete(int id) {
        repository.delete(new Roles(id));
    }
}
