package com.ksm.hazardreportapp.services;

import com.ksm.hazardreportapp.entities.Notifications;
import com.ksm.hazardreportapp.repositories.NotificationRepository;
import com.ksm.hazardreportapp.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;

import java.util.List;

@Controller
public class NotificationService {

    @Autowired
    NotificationRepository notificationRepository;

    @Autowired
    UserRepository userRepository;

    public List<Notifications> getByUser(String userId){
        return userRepository.findById(userId).get().getNotificationsList();
    }

    public List<Notifications> getByUserId(String userId){
        return notificationRepository.findByUserId(userId);
    }
}
