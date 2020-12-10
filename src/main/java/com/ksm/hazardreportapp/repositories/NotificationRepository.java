package com.ksm.hazardreportapp.repositories;

import com.ksm.hazardreportapp.entities.NotificationJson;
import com.ksm.hazardreportapp.entities.Notifications;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NotificationRepository extends JpaRepository<Notifications, Integer> {
    List<Notifications> findByUserId(String userId);
}