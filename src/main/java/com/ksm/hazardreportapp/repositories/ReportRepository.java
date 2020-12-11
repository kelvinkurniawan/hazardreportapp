/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.repositories;

import com.ksm.hazardreportapp.entities.Reports;
import com.ksm.hazardreportapp.entities.Rooms;
import com.ksm.hazardreportapp.entities.Statuses;
import com.ksm.hazardreportapp.entities.Users;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

/**
 *
 * @author YOGA
 */
@Repository
public interface ReportRepository extends JpaRepository<Reports, Integer> {

    @Query("Select r from Reports r where r.room IN (:room)")
    public List<Reports> findByRoomIn(@Param("room") List<Rooms> room);

    public List<Reports> findByOriginator(@Param("originator") Users originator);

    public List<Reports> findByCurrentStatusIn(List<Statuses> currentStatus);
}
