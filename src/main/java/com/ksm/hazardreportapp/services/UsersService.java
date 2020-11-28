/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.services;

import com.ksm.hazardreportapp.entities.Users;
import com.ksm.hazardreportapp.repositories.UsersRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Boona
 */
@Service
public class UsersService {

    @Autowired
    UsersRepository repository;

    public List<Users> getAll() {
        return repository.findAll();
    }

    public Users getById(String id) {
        return repository.findById(id).get();
    }

    public Users save(Users users) {
        return repository.save(users);
    }

    public void delete(String id) {
        repository.delete(new Users(id));
    }
}
