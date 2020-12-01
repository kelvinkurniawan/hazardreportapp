/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.services;

import com.ksm.hazardreportapp.entities.Rooms;
import com.ksm.hazardreportapp.repositories.FloorRepository;
import com.ksm.hazardreportapp.repositories.RoomRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Boona
 */
@Service
public class RoomService {

    @Autowired
    RoomRepository repository;

    @Autowired
    FloorRepository floorRepository;

    public List<Rooms> getAll() {
        return repository.findAll();
    }

    public List<Rooms> getAllByFloor(int floor) {
        return floorRepository.findById(floor).get().getRoomsList();
    }

    public Rooms getById(int id) {
        return repository.findById(id).get();
    }

    public Rooms save(Rooms rooms) {
        return repository.save(rooms);
    }

    public void delete(int id) {
        repository.delete(new Rooms(id));
    }
}
