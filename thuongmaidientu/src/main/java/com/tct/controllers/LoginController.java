/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.controllers;


//import com.tct.service.UserService_Cus;
import java.util.Map;

import com.tct.pojo.Account;
import com.tct.service.UserService_Cus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

/**
 *
 * @author ADMIN
 */
@Controller
@ControllerAdvice
public class LoginController {
    @Autowired
    private UserService_Cus userService;

    @Autowired
    private UserService_Cus userDetailsService;

    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("account", new Account());
        return "login";
    }

    @ModelAttribute
    public void addAttributes(Model model, Authentication authentication) {
        if (authentication != null)
            model.addAttribute("currentUser", this.userService.getByUsername(authentication.getName()));
    }

}
