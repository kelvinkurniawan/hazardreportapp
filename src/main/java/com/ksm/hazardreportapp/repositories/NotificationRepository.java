package com.ksm.hazardreportapp.repositories;

import com.ksm.hazardreportapp.entities.Notifications;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface NotificationRepository extends JpaRepository<Notifications, Integer> {
    List<Notifications> findByUserId(String userId);
}