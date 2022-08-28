package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.ShopStore;
import com.tct.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@ControllerAdvice
public class Shop_ManagerController {
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

    @ModelAttribute
    public void addAttributes(Model model, Authentication authentication) {
        if (authentication != null) {
            model.addAttribute("currentUser", this.accountService.getByUsername(authentication.getName()));
        }
    }

    @GetMapping("/shop-manager")
    public String customer_prodAttr(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        model.addAttribute("type_products", this.type_ProductService.getTypeProducts());
        int page = Integer.parseInt(params.getOrDefault("page", "1"));

        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());

            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            int slPro = this.shopProductService.countProduct_ShopByID_Shop(shopStore.getIdShopStore());

            model.addAttribute("shopAcc", this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()));
            model.addAttribute("countPro", slPro);
            model.addAttribute("listProduct", this.shopProductService.getShopProductByID_Shop(params, page, shopStore.getIdShopStore()));
            model.addAttribute("lst_discount", this.discountCodeService.getDiscountByID_Shop(shopStore.getIdShopStore(), 1));
        }
        return "shop-manager";
    }

    @GetMapping("/shop-manager/amount/{idProduct}/{sl}")
    public String save_amount(Model model,@PathVariable("idProduct") Integer idPro ,@PathVariable("sl") Integer sl, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());

            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            this.shopProductService.updateAmountPro_Shop(shopStore.getIdShopStore(),idPro,sl);
        }
        return "redirect:/shop-manager";
    }
}
