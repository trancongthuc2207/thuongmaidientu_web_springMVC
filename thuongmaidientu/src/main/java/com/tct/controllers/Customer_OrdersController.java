package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.Customers;
import com.tct.pojo.OrderDetails;
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

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

@Controller
@ControllerAdvice
public class Customer_OrdersController {
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

    @RequestMapping("/user/customer-orders")
    public String cus_bag(Model model, @RequestParam Map<String, String> params, Authentication authentication) {
        if (authentication != null) {
            model.addAttribute("currentUser", this.accountService.getByUsername(authentication.getName()));
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
            long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());
            List<OrderDetails> orderWaitting = this.orderDetailsService.getOrderDetailsByID_Order(idOrderWaitting);

            long sumOrder = 0;
            for(OrderDetails c : orderWaitting)
                sumOrder += (c.getAmount() * c.getUnitPrice());
            model.addAttribute("orderWaitting",orderWaitting);
            model.addAttribute("sumOrder",sumOrder);
        }
        return "user/customer-orders";
    }

    @GetMapping(value = "/user/customer-orders/update_prod_amount/{idPro}/{amount}")
    public String update_product_amount(@PathVariable("idPro") Integer productID,@PathVariable("amount") Integer amount, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication){
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
            long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());
            int id_pro = productID;
            int amo = amount;
            this.orderDetailsService.updateAmout_Pro(idOrderWaitting,id_pro,amo);
        }
        return "redirect:/user/customer-orders";
    }

    @GetMapping("/user/customer-orders/payment")
    public String payment(@RequestParam Map<String, String> params, HttpSession session, Authentication authentication){
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
            long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());
            this.ordersService.saveOrderWaitting(idOrderWaitting,customers.getIdCustomer());
        }
        return "redirect:/user/customer-orders";
    }

}
