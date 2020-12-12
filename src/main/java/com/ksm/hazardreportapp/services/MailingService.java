/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ksm.hazardreportapp.services;

import java.io.UnsupportedEncodingException;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

/**
 *
 * @author Boona
 */
@Service
public class MailingService {

    @Autowired
    private JavaMailSender javaMailSender;

    public void sendEmail(String to, String body, String topic) throws MessagingException, UnsupportedEncodingException {
        System.out.println("Sending");
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper mimeMessageHelper = new MimeMessageHelper(mimeMessage);
        
        mimeMessageHelper.setFrom("nanatamvan.nt@gmail.com", "Kapita Metrodata");
        mimeMessageHelper.setTo(to);
        mimeMessageHelper.setSubject(topic);
        mimeMessageHelper.setText(body,true);
        javaMailSender.send(mimeMessage);
        System.out.println("Sent");
    }
}
