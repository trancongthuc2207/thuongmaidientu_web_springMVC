package com.tct.controllers;


import com.tct.pojo.*;
import com.tct.service.CustomerService;
import com.tct.service.OrderDetailsService;
import com.tct.service.OrdersService;
import com.tct.service.UserService_Cus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@ControllerAdvice
public class Customer_InformationController {
    @Autowired
    private UserService_Cus accountService;
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService_Cus userDetailsService;
    @Autowired
    private OrderDetailsService orderDetailsService;

    @RequestMapping("/user/infor-customer")
    public String cus_bag(Model model, @RequestParam Map<String, String> params, Authentication authentication) {
        model.addAttribute("customers", new Customers());
        model.addAttribute("account", new Account());
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());

            String idCus = "";

            if(accCur.getIdPos().getIdPosition() == 2){
                idCus = customers.getIdCustomer();
            }
            if(accCur.getIdPos().getIdPosition() == 4 || accCur.getIdPos().getIdPosition() == 1){
                String idCusFromParams = params.getOrDefault("idCus","");
                idCus = idCusFromParams;
                boolean checkAcc = false;
                if(idCus == ""){
                    checkAcc = true;
                }
                if(idCus != ""){
                    customers = this.customerService.getCustomerByIDCus(idCus);
                    model.addAttribute("cusID", idCus);
                }
                model.addAttribute("accessEmp", checkAcc);
            }


            List<Customers> lst = new ArrayList<>();
            lst.add(customers);
            model.addAttribute("cusCur", lst);
            model.addAttribute("idAcc", accCur.getIdAccount());
        }
        return "user/infor-customer";
    }

    @PostMapping("/user/infor-customer/update")
    public String upload(@ModelAttribute("customers") Customers customers, Model model, Authentication authentication) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Account accCur = this.userDetailsService.getByUsername(authentication.getName());
        if (customers != null) {
            if (this.customerService.updateCustomer(customers) == true) {
                model.addAttribute("errMsg", "Thành công!!!");
                return "redirect:/user/infor-customer";
            }
        }
        return "redirect:/user/infor-customer";
    }

    @PostMapping("/user/infor-customer/update-account")
    public String updatePass(@ModelAttribute("account") Account acc, Model model, Authentication authentication) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Account accCur = this.userDetailsService.getByUsername(authentication.getName());
        if (acc != null) {
            if (acc.getPasswordC().equals(acc.getConfirmPassword())) {
                if (this.userDetailsService.updateUser(acc) == true) {
                    model.addAttribute("errMsgPass", "Thành công!!!");
                    return "redirect:/user/infor-customer";
                }
            } else {
                model.addAttribute("errMsgPass", "Thất Bại, Mật khẩu khác nhau!!!");
                return "redirect:/user/infor-customer";
            }
        }
        return "redirect:/user/infor-customer";
    }
}
