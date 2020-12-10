package com.ksm.hazardreportapp.controllers;

import com.ksm.hazardreportapp.entities.Users;
import com.ksm.hazardreportapp.entities.rest.RegisterInput;
import com.ksm.hazardreportapp.services.RoleService;
import com.ksm.hazardreportapp.services.UserService;
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

    @GetMapping("admin/user")
    public String manageUser(Model model) {
        model.addAttribute("users", userService.getAll());
        return "manageUser";
    }

    @GetMapping("admin/user/{username}")
    public String viewUser(@PathVariable("username") String username, Model model) {
        model.addAttribute("user", userService.getByUsername(username));
        model.addAttribute("roles", roleService.getAll());
        return "viewUser";
    }

    @GetMapping("admin/user/add")
    public String addUser(Model model) {
        model.addAttribute("universities", userService.getUniversities());
        model.addAttribute("majors", userService.getMajors());
        return "addUser";
    }

    @PostMapping("admin/user/add")
    public String performAddUser(RegisterInput input) {
        System.out.println("Post Method Running");
        userService.register(input);
        return "redirect:/admin/user";
    }

    @PostMapping("admin/user/setrole")
    public String performSetRole(Users users) {
        System.out.println(users.getRoles().getId());
        Users oldUser = new Users();
        oldUser = userService.getByUsername(users.getUsername());
        oldUser.setRoles(roleService.getById(users.getRoles().getId()));

        userService.save(oldUser);
        return "redirect:/admin/user";
    }
}
