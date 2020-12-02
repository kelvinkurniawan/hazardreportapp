package com.ksm.hazardreportapp.services;

import com.ksm.hazardreportapp.entities.Notifications;
import com.ksm.hazardreportapp.repositories.NotificationRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public class NotificationService {

    @Autowired
    NotificationRepository notificationRepository;

    public List<Notifications> getByUserId(String userId){
        return notificationRepository.findByUserId(userId);
    }
}
