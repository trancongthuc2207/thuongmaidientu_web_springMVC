package com.tct.controllers;

import com.cloudinary.Cloudinary;
import com.tct.pojo.Account;
import com.tct.pojo.DiscountCode;
import com.tct.pojo.Product;
import com.tct.pojo.ShopStore;
import com.tct.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@ControllerAdvice
public class Shop_AddProductController {
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
    private Cloudinary cloudinary;

    @RequestMapping("/shop-manager/add-product")
    public String index(Model model, @RequestParam Map<String, String> params, Authentication authentication) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Account accCur = this.userDetailsService.getByUsername(authentication.getName());
        ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);

        model.addAttribute("active", accCur.getStt());

        model.addAttribute("product", new Product());
        model.addAttribute("discount", new DiscountCode());

        model.addAttribute("idShop_Store", shopStore);
        model.addAttribute("type_products", this.type_ProductService.getTypeProducts());

        model.addAttribute("listProductWaitting",this.productService.getProductsWaittingByID_Shop(shopStore.getIdShopStore()));
        model.addAttribute("listProductDeleted",this.productService.getProductsDeletedByID_Shop(shopStore.getIdShopStore()));

        model.addAttribute("listDiscount", this.discountCodeService.getDiscountByID_Shop(shopStore.getIdShopStore(),1));
        model.addAttribute("listDiscount_Remove", this.discountCodeService.getDiscountByID_Shop(shopStore.getIdShopStore(),0));
        return "shop-manager/add-product";
    }

    @PostMapping("/shop-manager/add-product")
    public String upload(@ModelAttribute("product") Product pro,Model model,Authentication authentication) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Account accCur = this.userDetailsService.getByUsername(authentication.getName());
        ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
        if(pro != null)
        {
            if(this.productService.addNewProduct(pro,shopStore.getIdShopStore()) == true){
                model.addAttribute("errMsg","Thành công!!!");
                return "redirect:/shop-manager/add-product";
            }
        }
        return "shop-manager/add-product";
    }

    @PostMapping("/shop-manager/add-discount")
    public String upload_discount(@ModelAttribute("discount") DiscountCode dis, Model model, Authentication authentication) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Account accCur = this.userDetailsService.getByUsername(authentication.getName());
        ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
        if(dis != null)
        {
            if(dis.getPercentDiscount() == 0){
                dis.setPercentDiscount(null);
            }
            if(dis.getValueDiscount() == 0){
                dis.setValueDiscount(null);
            }
            if(this.discountCodeService.addNewDiscount(dis,shopStore.getIdShopStore()) == true){
                model.addAttribute("errMsg","Thành công!!!");
                return "redirect:/shop-manager/add-product";
            }
        }
        return "shop-manager/add-product";
    }


//    @GetMapping("/shop-manager/edit/back")
//    public String back(@RequestParam Map<String, String> params, HttpSession session, Authentication authentication){
//
//        return "redirect:/user/customer-orders";
//    }
}
