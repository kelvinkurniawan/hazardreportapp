package com.ksm.hazardreportapp.controllers;

import com.ksm.hazardreportapp.entities.Users;
import com.ksm.hazardreportapp.entities.rest.RegisterInput;
import com.ksm.hazardreportapp.services.MailingService;
import com.ksm.hazardreportapp.services.RoleService;
import com.ksm.hazardreportapp.services.UserService;
import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    @Autowired
    RoleService roleService;
    
    @Autowired
    MailingService mailingService;

    @GetMapping("admin/user")
    public String manageUser(Model model) {
        model.addAttribute("users", userService.getAll());
        model.addAttribute("title", "Manage User");
        return "manageUser";
    }

    @GetMapping("admin/user/{username}")
    public String viewUser(@PathVariable("username") String username, Model model) {
        model.addAttribute("user", userService.getByUsername(username));
        model.addAttribute("roles", roleService.getAll());
        model.addAttribute("title", "User Detail");
        return "viewUser";
    }

    @GetMapping("admin/user/add")
    public String addUser(Model model) {
        model.addAttribute("universities", userService.getUniversities());
        model.addAttribute("majors", userService.getMajors());
        model.addAttribute("title", "Create User");
        return "addUser";
    }

    @PostMapping("admin/user/add")
    public String performAddUser(RegisterInput input) {
        System.out.println("Post Method Running");
        userService.register(input);
                
        try {
            mailingService.sendEmail(
                    "adnangofar.ag@gmail.com"
                    ,"<html>"+
                            "<body>"+
                            "<h3>Hello "+",</h3>"+
                            "<h2>Report is added with Description :</h2>"+
                            
                            "</body>"+
                     "<html>"
                    ,"this Topic"
                    
            );
        } catch (MessagingException | UnsupportedEncodingException ex) {
            Logger.getLogger(ReportController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return "redirect:/admin/user?res=added";
    }

    @PostMapping("admin/user/setrole")
    public String performSetRole(Users users) {
        System.out.println(users.getRoles().getId());
        Users oldUser = new Users();
        oldUser = userService.getByUsername(users.getUsername());
        oldUser.setRoles(roleService.getById(users.getRoles().getId()));

        userService.save(oldUser);
        return "redirect:/admin/user?res=addup";
    }
}
