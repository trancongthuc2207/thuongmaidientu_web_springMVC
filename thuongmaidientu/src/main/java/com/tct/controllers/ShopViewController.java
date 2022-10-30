package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.Customers;
import com.tct.pojo.Product;
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
        String kw = params.getOrDefault("kw","");
        String incre_des = params.getOrDefault("fil","NO");
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        String isDis = params.getOrDefault("isDis","NO");

        model.addAttribute("shop_product",this.shopProductService.getShopProductsByIDShop(idS));
        model.addAttribute("shopAcc", this.shopStoreService.getShopstoreByID_Shop(idS));
        model.addAttribute("linkCur", "id_Shop=" + idS);

        int countPro = this.productService.GetProductByIDShop_Kw_Stt_posData_haveDiscount_AmountFull_increDes(idS,kw,1,page,isDis,"FULL",incre_des).size();
        model.addAttribute("countPro", countPro);
        List<Product> lstPro = new ArrayList<>();
        lstPro = this.productService.GetProductByIDShop_Kw_Stt_posData_haveDiscount_AmountFull_increDes(idS,kw,1,page,isDis,"NO",incre_des);
        model.addAttribute("prods_Shop", lstPro);

        model.addAttribute("shopID",idS);
        model.addAttribute("page",page);
        model.addAttribute("isDis",isDis);
        model.addAttribute("fil",incre_des);
        model.addAttribute("kw",kw);
        if(authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            if(accCur.getIdPos().getIdPosition() == 2){
                Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
                long idOrderWaitting = this.ordersService.getID_OrdersByID_WAITTING(params, customers.getIdCustomer());

                model.addAttribute("idOr",idOrderWaitting);
                model.addAttribute("idCust", customers.getIdCustomer());
            }
        }
        return "shop-view";
    }
}
