package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.Customers;
import com.tct.pojo.ShopProducts;
import com.tct.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@ControllerAdvice
public class ShopViewController {
    @Autowired
    private Type_ProductService type_ProductService;
    @Autowired
    private ProductService productService;
    @Autowired
    private UserService_Cus accountService;
    @Autowired
    private ShopStoreService shopStoreService;
    @Autowired
    private ShopProductService shopProductService;

    @Autowired
    private OrdersService ordersService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private UserService_Cus userDetailsService;
    @Autowired
    private OrderDetailsService orderDetailsService;
    @Autowired
    private DiscountCodeService discountCodeService;

    @Autowired
    private ReportService reportService;

    @RequestMapping("/shop-view")
    public String shop_view(Model model, @RequestParam Map<String, String> params, Authentication authentication) {
        String idS = params.getOrDefault("id_Shop", "");
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        int slPro = this.shopProductService.countProduct_ShopByID_Shop(idS);

        List<ShopProducts> lstP = new ArrayList<>();
        for (ShopProducts s : this.shopProductService.getShopProductByID_Shop(params, page, idS)){
            if(s.getProduct().getStatus() == 1 && s.getAmount() > 1)
                lstP.add(s);
        }

        model.addAttribute("shopAcc", this.shopStoreService.getShopstoreByID_Shop(idS));
        model.addAttribute("listProduct", lstP);
        model.addAttribute("countP", slPro);
        model.addAttribute("linkCur", "id_Shop=" + idS);

        if(authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
            long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());

            model.addAttribute("idOr",idOrderWaitting);
            model.addAttribute("idCust", customers.getIdCustomer());
        }
        return "shop-view";
    }
}
