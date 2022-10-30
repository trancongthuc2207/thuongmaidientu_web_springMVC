package com.tct.controllers;


import com.tct.pojo.Account;
import com.tct.pojo.Customers;
import com.tct.pojo.Orders;
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
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@ControllerAdvice
public class Customer_Orders_ManagerController {
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

    @ModelAttribute
    public void addAttributes(Model model, Authentication authentication) {
        if (authentication != null) {
            model.addAttribute("currentUser", this.accountService.getByUsername(authentication.getName()));
        }
    }

    @GetMapping("/user/cus-orders-manager")
    public String Cus_Orders_Manager(Model model, @RequestParam Map<String, String> params, Authentication authentication) {
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
                if(customers.getIdCustomer().equals(idCusFromParams)){
                    checkAcc = true;
                }
                model.addAttribute("accessEmp", checkAcc);
                model.addAttribute("idCus",idCusFromParams);
            }

            //ORDER WAITTING
            int page = Integer.parseInt(params.getOrDefault("pageOrder", "1"));
            model.addAttribute("orders_count", this.ordersService.countOrdersByID_Cus(idCus,"1"));
            model.addAttribute("orders_cus", this.ordersService.getOrdersByID_Cus_Status(params, page, idCus, "1"));
            model.addAttribute("listOrder", this.orderDetailsService.getOrderDetailsByIDCustomer_SttOrder(idCus,"1"));
            //ORDER SUCCESS
            int pageS = Integer.parseInt(params.getOrDefault("pageOrderSuccess", "1"));
            model.addAttribute("orders_countS", this.ordersService.countOrdersByID_Cus(idCus,"2"));
            model.addAttribute("orders_cusS", this.ordersService.getOrdersByID_Cus_Status(params, pageS, idCus, "2"));
            model.addAttribute("listOrderS", this.orderDetailsService.getOrderDetailsByIDCustomer_SttOrder(idCus,"2"));
            //ORDER CANCLE
            int pageC = Integer.parseInt(params.getOrDefault("pageOrderCancel", "1"));
            model.addAttribute("orders_countC", this.ordersService.countOrdersByID_Cus(idCus,"CANCLE"));
            model.addAttribute("orders_cusC", this.ordersService.getOrdersByID_Cus_Status(params, pageS, idCus, "CANCLE"));
            model.addAttribute("listOrderC", this.orderDetailsService.getOrderDetailsByIDCustomer_SttOrder(idCus,"CANCLE"));

            //ORDER WAITING
            int pageOrdWaitting = Integer.parseInt(params.getOrDefault("pageOr_W", "1"));
            String inc_desW = params.getOrDefault("filDate","des");
            String kwOr_w = params.getOrDefault("kwOrd_kw","");

            List<Orders> lst_order_wait = new ArrayList<>();
            lst_order_wait = this.ordersService.getOrderByIDCustomer_Kw_Stt_Page_IncreDes(idCus,kwOr_w,"1",pageOrdWaitting,inc_desW);
            int size_lst_wait = lst_order_wait.size();
            model.addAttribute("cusID", idCus);
            model.addAttribute("list_OrderWaitting", this.ordersService.getOrderByIDCustomer_Kw_Stt_Page_IncreDes(idCus,kwOr_w,"1",pageOrdWaitting,inc_desW));
            model.addAttribute("sizeOrdWaiting",this.ordersService.getOrderByIDCustomer_Kw_Stt_Page_IncreDes(idCus,kwOr_w,"1",pageOrdWaitting,"FULL").size());
            model.addAttribute("pageOr_W",pageOrdWaitting);
            model.addAttribute("kwOr_w",kwOr_w);
            model.addAttribute("inc_desW",inc_desW);


            //ORDER ACCEPT
            int pageOrdAccepted = Integer.parseInt(params.getOrDefault("pageOrAc_W", "1"));
            String inc_desAc = params.getOrDefault("filDateAc","des");
            String kwOrAc_w = params.getOrDefault("kwOrdAc_kw","");

            List<Orders> lst_order_accept = new ArrayList<>();
            lst_order_accept = this.ordersService.getOrderByIDShop_Kw_Stt_Page_IncreDes(idCus,kwOrAc_w,"2",pageOrdAccepted,inc_desAc);
            int size_lst_accept = lst_order_accept.size();
            model.addAttribute("cusID", idCus);
            model.addAttribute("list_OrderAccept", this.ordersService.getOrderByIDCustomer_Kw_Stt_Page_IncreDes(idCus,kwOrAc_w,"2",pageOrdAccepted,inc_desAc));
            model.addAttribute("sizeOrdAccept",this.ordersService.getOrderByIDCustomer_Kw_Stt_Page_IncreDes(idCus,kwOrAc_w,"2",pageOrdAccepted,"FULL").size());
            model.addAttribute("pageOrAc_W",pageOrdAccepted);
            model.addAttribute("kwOrdAc_kw",kwOrAc_w);
            model.addAttribute("inc_desAc",inc_desAc);
            //

            //ORDER CANCLE
            int pageOrdCancle = Integer.parseInt(params.getOrDefault("pageOrCa_W", "1"));
            String inc_desCa = params.getOrDefault("filDateCa","des");
            String kwOrCa_w = params.getOrDefault("kwOrdCa_kw","");

            List<Orders> lst_order_cancle = new ArrayList<>();
            lst_order_cancle = this.ordersService.getOrderByIDShop_Kw_Stt_Page_IncreDes(idCus,kwOrAc_w,"CANCLE",pageOrdAccepted,inc_desAc);
            int size_lst_cancle = lst_order_cancle.size();
            model.addAttribute("cusID", idCus);
            model.addAttribute("list_OrderCancle", this.ordersService.getOrderByIDCustomer_Kw_Stt_Page_IncreDes(idCus,kwOrCa_w,"CANCLE",pageOrdCancle,inc_desCa));
            model.addAttribute("sizeOrdCancle",this.ordersService.getOrderByIDCustomer_Kw_Stt_Page_IncreDes(idCus,kwOrCa_w,"CANCLE",pageOrdCancle,"FULL").size());
            model.addAttribute("pageOrCa_W",pageOrdCancle);
            model.addAttribute("kwOrdCa_kw",kwOrCa_w);
            model.addAttribute("inc_desCa",inc_desCa);
            //
        }
        return "user/cus-orders-manager";
    }

//    @GetMapping("/user/cus-orders-manager/wait")
//    public String Cus_Orders_Wait_Manager(Model model, @RequestParam Map<String, String> params, Authentication authentication) {
//        if (authentication != null) {
//            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
//            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
//            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
//            int page = Integer.parseInt(params.getOrDefault("pageOrder", "1"));
//            model.addAttribute("orders_count", this.ordersService.countOrdersByID_Cus(customers.getIdCustomer(),"2"));
//            model.addAttribute("orders_cus", this.ordersService.getOrdersByID_Cus_Status(params, page, customers.getIdCustomer(), "2"));
//
//            model.addAttribute("listOrder", this.orderDetailsService.getOrderDetailsByIDCustomer_SttOrder(customers.getIdCustomer(),"2"));
//        }
//        return "user/cus-orders-manager";
//    }
}
