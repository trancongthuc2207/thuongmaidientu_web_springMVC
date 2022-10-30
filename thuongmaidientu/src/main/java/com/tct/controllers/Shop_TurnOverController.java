package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.ShopStore;
import com.tct.service.ReportService;
import com.tct.service.ShopOtherService;
import com.tct.service.ShopStoreService;
import com.tct.service.UserService_Cus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;
import java.util.Map;

@Controller
@ControllerAdvice
public class Shop_TurnOverController {
    @Autowired
    private ShopStoreService shopStoreService;
    @Autowired
    private UserService_Cus userDetailsService;

    @Autowired
    private ShopOtherService shopOtherService;

    @GetMapping("/shop-manager/turnover-shop")
    public String turnover(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        String idShop = params.getOrDefault("idS", "0");

        String day = params.getOrDefault("daySelect", "");
        long sumTotal = 0;
        if (authentication != null && idShop.equals("0")) {
            model.addAttribute("idS",idShop);
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            model.addAttribute("idS",shopStore.getIdShopStore());
            Date d = new Date();
            if (day == "") {
                SimpleDateFormat frmt = new SimpleDateFormat("yyyy-MM-dd");
                String dd = frmt.format(d);
                model.addAttribute("dateS", dd);
                model.addAttribute("listTurnOver", this.shopOtherService.getTotalMoneyOrderDetailsByDate_ID_Shop(d, shopStore.getIdShopStore()));

                for(Object[] c : this.shopOtherService.getTotalMoneyOrderDetailsByDate_ID_Shop(d, shopStore.getIdShopStore())){
                    sumTotal += Long.parseLong(c[1].toString());
                }
                model.addAttribute("sumDateEnd", sumTotal);
                model.addAttribute("productChDate",this.shopOtherService.getTotalAmountProductByDate_ID_Shop(d,shopStore.getIdShopStore()));
            } else if (day != "") {
                SimpleDateFormat frmt = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    Date dStr = frmt.parse(day);
                    model.addAttribute("dateS", day);
                    model.addAttribute("listTurnOver", this.shopOtherService.getTotalMoneyOrderDetailsByDate_ID_Shop(dStr, shopStore.getIdShopStore()));

                    for(Object[] c : this.shopOtherService.getTotalMoneyOrderDetailsByDate_ID_Shop(dStr, shopStore.getIdShopStore())){
                        sumTotal += Long.parseLong(c[1].toString());
                    }
                    model.addAttribute("sumDateEnd", sumTotal);
                    model.addAttribute("productChDate",this.shopOtherService.getTotalAmountProductByDate_ID_Shop(dStr,shopStore.getIdShopStore()));
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        else if (authentication != null && !idShop.equals("0"))
        {
            model.addAttribute("idS",idShop);
            model.addAttribute("day",day);
            Date d = new Date();
            if (day == "") {
                SimpleDateFormat frmt = new SimpleDateFormat("yyyy-MM-dd");
                String dd = frmt.format(d);
                model.addAttribute("dateS", dd);
                model.addAttribute("listTurnOver", this.shopOtherService.getTotalMoneyOrderDetailsByDate_ID_Shop(d, idShop));

                for(Object[] c : this.shopOtherService.getTotalMoneyOrderDetailsByDate_ID_Shop(d, idShop)){
                    sumTotal += Long.parseLong(c[1].toString());
                }
                model.addAttribute("sumDateEnd", sumTotal);
                model.addAttribute("productChDate",this.shopOtherService.getTotalAmountProductByDate_ID_Shop(d,idShop));
            } else if (day != "") {
                SimpleDateFormat frmt = new SimpleDateFormat("yyyy-MM-dd");
                try {
                    Date dStr = frmt.parse(day);
                    model.addAttribute("dateS", day);
                    model.addAttribute("listTurnOver", this.shopOtherService.getTotalMoneyOrderDetailsByDate_ID_Shop(dStr, idShop));

                    for(Object[] c : this.shopOtherService.getTotalMoneyOrderDetailsByDate_ID_Shop(dStr, idShop)){
                        sumTotal += Long.parseLong(c[1].toString());
                    }
                    model.addAttribute("sumDateEnd", sumTotal);
                    model.addAttribute("productChDate",this.shopOtherService.getTotalAmountProductByDate_ID_Shop(dStr,idShop));
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        return "shop-manager/turnover-shop";
    }

    @GetMapping("/shop-manager/turnover-shop/month")
    public String turnOver_Day(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        String idShop = params.getOrDefault("idS", "0");

        String day = params.getOrDefault("monthSelect", "");
        long sumTotal = 0;
        if (authentication != null && idShop.equals("0")) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            model.addAttribute("idS",shopStore.getIdShopStore());
            Date d = new Date();
            if (day == "") {
                SimpleDateFormat frmt = new SimpleDateFormat("yyyy-MM-dd");
                String dd = frmt.format(d);
                model.addAttribute("monthS", dd.substring(0,dd.lastIndexOf("-")));
                model.addAttribute("listTurnOverMonth", this.shopOtherService.getTotalMoneyOrderDetailsByMonth_ID_Shop(d, shopStore.getIdShopStore()));

                for(Object[] c : this.shopOtherService.getTotalMoneyOrderDetailsByMonth_ID_Shop(d, shopStore.getIdShopStore())){
                    sumTotal += Long.parseLong(c[1].toString());
                }
                model.addAttribute("sumEnd", sumTotal);

                model.addAttribute("productCh",this.shopOtherService.getTotalAmountProductByMonth_ID_Shop(d,shopStore.getIdShopStore()));
            } else if (day != "") {
                SimpleDateFormat frmt = new SimpleDateFormat("yyyy-MM-dd");
                day = day + "-01";
                try {
                    Date dStr = frmt.parse(day);
                    model.addAttribute("monthS", day.substring(0,day.lastIndexOf("-")));
                    model.addAttribute("listTurnOverMonth", this.shopOtherService.getTotalMoneyOrderDetailsByMonth_ID_Shop(dStr, shopStore.getIdShopStore()));

                    for(Object[] c : this.shopOtherService.getTotalMoneyOrderDetailsByMonth_ID_Shop(dStr, shopStore.getIdShopStore())){
                        sumTotal += Long.parseLong(c[1].toString());
                    }
                    model.addAttribute("sumEnd", sumTotal);

                    model.addAttribute("productCh",this.shopOtherService.getTotalAmountProductByMonth_ID_Shop(dStr,shopStore.getIdShopStore()));
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        else if (authentication != null && !idShop.equals("0"))
        {
            model.addAttribute("idS",idShop);
            model.addAttribute("day",day);
            Date d = new Date();
            if (day == "") {
                SimpleDateFormat frmt = new SimpleDateFormat("yyyy-MM-dd");
                String dd = frmt.format(d);
                model.addAttribute("monthS", dd.substring(0,dd.lastIndexOf("-")));
                model.addAttribute("listTurnOverMonth", this.shopOtherService.getTotalMoneyOrderDetailsByMonth_ID_Shop(d, idShop));

                for(Object[] c : this.shopOtherService.getTotalMoneyOrderDetailsByMonth_ID_Shop(d, idShop)){
                    sumTotal += Long.parseLong(c[1].toString());
                }
                model.addAttribute("sumEnd", sumTotal);

                model.addAttribute("productCh",this.shopOtherService.getTotalAmountProductByMonth_ID_Shop(d,idShop));
            } else if (day != "") {
                SimpleDateFormat frmt = new SimpleDateFormat("yyyy-MM-dd");
                day = day + "-01";
                try {
                    Date dStr = frmt.parse(day);
                    model.addAttribute("monthS", day.substring(0,day.lastIndexOf("-")));
                    model.addAttribute("listTurnOverMonth", this.shopOtherService.getTotalMoneyOrderDetailsByMonth_ID_Shop(dStr, idShop));

                    for(Object[] c : this.shopOtherService.getTotalMoneyOrderDetailsByMonth_ID_Shop(dStr, idShop)){
                        sumTotal += Long.parseLong(c[1].toString());
                    }
                    model.addAttribute("sumEnd", sumTotal);

                    model.addAttribute("productCh",this.shopOtherService.getTotalAmountProductByMonth_ID_Shop(dStr,idShop));
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        return "shop-manager/turnover-shop";
    }

    @GetMapping("/shop-manager/turnover-shop/year")
    public String turnOver_year(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        String idShop = params.getOrDefault("idS", "0");

        String day = params.getOrDefault("yearSelect", "");
        long sumTotal = 0;
        if (authentication != null && idShop.equals("0")) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            model.addAttribute("idS",shopStore.getIdShopStore());
            Date d = new Date();
            if (day == "") {
                SimpleDateFormat frmt = new SimpleDateFormat("yyyy-MM-dd");
                String dd = frmt.format(d);
                model.addAttribute("yearS", dd.substring(0,dd.indexOf("-")));

                for(Object[] c : this.shopOtherService.getTotalAmountProductByYear_ID_Shop(d, shopStore.getIdShopStore())){
                    sumTotal += Long.parseLong(c[3].toString());
                }
                model.addAttribute("sumEnd", sumTotal);
                model.addAttribute("productChY",this.shopOtherService.getTotalAmountProductByYear_ID_Shop(d,shopStore.getIdShopStore()));
            } else if (day != "") {
                SimpleDateFormat frmt = new SimpleDateFormat("yyyy-MM-dd");
                day = day + "-01-01";
                try {
                    Date dStr = frmt.parse(day);
                    model.addAttribute("yearS", day.substring(0,day.indexOf("-")));

                    for(Object[] c : this.shopOtherService.getTotalAmountProductByYear_ID_Shop(dStr, shopStore.getIdShopStore())){
                        sumTotal += Long.parseLong(c[3].toString());
                    }
                    model.addAttribute("sumEnd", sumTotal);
                    model.addAttribute("productChY",this.shopOtherService.getTotalAmountProductByYear_ID_Shop(dStr,shopStore.getIdShopStore()));
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        else if (authentication != null && !idShop.equals("0"))
        {
            model.addAttribute("idS",idShop);
            model.addAttribute("day",day);
            Date d = new Date();
            if (day == "") {
                SimpleDateFormat frmt = new SimpleDateFormat("yyyy-MM-dd");
                String dd = frmt.format(d);
                model.addAttribute("yearS", dd.substring(0,dd.indexOf("-")));

                for(Object[] c : this.shopOtherService.getTotalAmountProductByYear_ID_Shop(d, idShop)){
                    sumTotal += Long.parseLong(c[3].toString());
                }
                model.addAttribute("sumEnd", sumTotal);
                model.addAttribute("productChY",this.shopOtherService.getTotalAmountProductByYear_ID_Shop(d,idShop));
            } else if (day != "") {
                SimpleDateFormat frmt = new SimpleDateFormat("yyyy-MM-dd");
                day = day + "-01-01";
                try {
                    Date dStr = frmt.parse(day);
                    model.addAttribute("yearS", day.substring(0,day.indexOf("-")));

                    for(Object[] c : this.shopOtherService.getTotalAmountProductByYear_ID_Shop(dStr, idShop)){
                        sumTotal += Long.parseLong(c[3].toString());
                    }
                    model.addAttribute("sumEnd", sumTotal);
                    model.addAttribute("productChY",this.shopOtherService.getTotalAmountProductByYear_ID_Shop(dStr,idShop));
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
            }
        }
        return "shop-manager/turnover-shop";
    }
}
