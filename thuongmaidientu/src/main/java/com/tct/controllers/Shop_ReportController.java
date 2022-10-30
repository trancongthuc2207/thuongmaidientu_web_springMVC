package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.ShopStore;
import com.tct.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@ControllerAdvice
public class Shop_ReportController {
    @Autowired
    private ShopStoreService shopStoreService;
    @Autowired
    private UserService_Cus userDetailsService;
    @Autowired
    private ReportService reportService;

    @GetMapping("/shop-manager/reports")
    public String reports(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
//        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());

            ShopStore shopStore = new ShopStore();

            if(accCur.getIdPos().getIdPosition() == 3){
                shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            }

            if(accCur.getIdPos().getIdPosition() == 4 || accCur.getIdPos().getIdPosition() == 1){
                String idShopFromParams = params.getOrDefault("idShop_FrEpl","");
                shopStore = this.shopStoreService.getShopstoreByID_Shop(idShopFromParams).get(0);
                model.addAttribute("idS_FrEmpl",idShopFromParams);
            }

            model.addAttribute("listReportApp",this.reportService.getReportByID_Shop(params,shopStore.getIdShopStore(),"app"));
            model.addAttribute("listReportCus",this.reportService.getReportByID_Shop(params,shopStore.getIdShopStore(),"customer"));
        }
        return "shop-manager/reports";
    }
}
