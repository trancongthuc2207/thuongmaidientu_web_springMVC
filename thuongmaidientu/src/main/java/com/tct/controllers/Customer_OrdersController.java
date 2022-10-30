package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.Customers;
import com.tct.pojo.OrderDetails;
import com.tct.pojo.Orders;
import com.tct.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
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

    @Autowired
    private ShopProductService shopProductService;

    @Autowired
    private JavaMailSender mailSender;

    @RequestMapping("/user/customer-orders")
    public String cus_bag(Model model, @RequestParam Map<String, String> params, Authentication authentication) {
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
            long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());
            int page = Integer.parseInt(params.getOrDefault("page", "1"));
            int countOrderDetails_pro = orderDetailsService.countOrderDetails(idOrderWaitting);

            List<OrderDetails> orderWaitting = this.orderDetailsService.getOrderDetailsByID_Order(params,page,idOrderWaitting);
            long sumOrder = this.orderDetailsService.totalOfOrderWatting(idOrderWaitting);
            List<String> nameShop = new ArrayList<>();
            String temp = "";
            for(OrderDetails o : orderWaitting)
            {
                if(!temp.contains(o.getProduct().getIdShop().getIdShopStore())) {
                    nameShop.add(o.getProduct().getIdShop().getIdShopStore());
                    temp += o.getProduct().getIdShop().getIdShopStore() + " ";
                }
            }
            List<Long> totalPerOrderShop = new ArrayList<>();
            for(String name : nameShop){
                totalPerOrderShop.add(this.orderDetailsService.totalOfOrderPerShop(idOrderWaitting,name));
            }
            model.addAttribute("active",accCur.getStt());
            boolean checkCusCanOrder = this.customerService.checkInfor2Order(customers);
            model.addAttribute("checkCus",checkCusCanOrder);
            model.addAttribute("sizeShop", nameShop);
            model.addAttribute("totalPerShop", totalPerOrderShop);

            model.addAttribute("orderWaitting",orderWaitting);
            model.addAttribute("sumOrder",sumOrder);
            model.addAttribute("countPro_Order", countOrderDetails_pro);
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

    @GetMapping("/user/customer-orders/payment/{idS}/{totalMoney}")
    public String payment(@PathVariable("idS") String idShop,@PathVariable("totalMoney") long totalMo,@RequestParam Map<String, String> params, HttpSession session, Authentication authentication){
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
            long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());
            long total = totalMo;

            Orders shop = this.ordersService.getOrders(idOrderWaitting).get(0);
            Orders ord = new Orders();
            ord.setCustomer(shop.getCustomer());
            ord.setTimeBooked(shop.getTimeBooked());
            ord.setIdOrders(this.ordersService.getID_max()+1);

            long totalPerOrder = this.orderDetailsService.totalOfOrderPerShop(idOrderWaitting,idShop);

            if(this.ordersService.saveOrderShop(ord,idOrderWaitting,idShop,totalPerOrder)) {
                this.orderDetailsService.updateOrderIdPaying(idOrderWaitting, idShop, ord.getIdOrders());
                sendEmail("tct.vvh.k19@gmail.com",customers.getEmail(),"Xác nhận đơn hàng","Đơn hàng của bạn đã soạn thành công!!\nMã đơn hàng: "+ ord.getIdOrders() + "\n Từ Mã Shop: " + idShop + "\n Tên khách hàng: " + ord.getCustomer().getNameC() + "\n Tổng đơn hàng: " + String.valueOf(totalPerOrder) + "\nTheo dõi đơn hàng tại quản lý đơn hàng");
                session.setAttribute("amountPro",this.orderDetailsService.countProductInOrderWaitting(idOrderWaitting));
            }
        }
        return "redirect:/user/customer-orders";
    }

    @GetMapping("/user/customer-orders/delete/{idPro}")
    public String deletePro(@PathVariable("idPro") Integer productID,@RequestParam Map<String, String> params, HttpSession session, Authentication authentication){
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
            long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());
            int idPr = productID;
            this.orderDetailsService.deletePro(idOrderWaitting,idPr);
        }
        return "redirect:/user/customer-orders";
    }

    public void sendEmail(String from, String to, String subject,String content){
        SimpleMailMessage mailMessage = new SimpleMailMessage();
        mailMessage.setFrom(from);
        mailMessage.setTo(to);
        mailMessage.setSubject(subject);
        mailMessage.setText(content);

        this.mailSender.send(mailMessage);
    }
}
