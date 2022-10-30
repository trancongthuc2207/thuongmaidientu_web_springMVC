package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.Product;
import com.tct.pojo.ShopProducts;
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
public class Shop_EditProductController {
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

    @RequestMapping("/shop-manager/edit")
    public String index(Model model, @RequestParam Map<String, String> params,Authentication authentication) {
        int id = Integer.parseInt(params.getOrDefault("ID_Product", "1"));
        model.addAttribute("productByID", this.productService.getProductByID(params,id));

        model.addAttribute("product", new Product());

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

            ShopProducts shopProducts = this.shopProductService.getShopProductByPK(shopStore.getIdShopStore(),id).get(0);
            model.addAttribute("shop_product_detail",this.shopProductService.getShopProductByPK(shopStore.getIdShopStore(),id));
            model.addAttribute("shopAcc", this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()));
            model.addAttribute("type_products", this.type_ProductService.getTypeProducts());
            model.addAttribute("lst_discount",this.discountCodeService.getDiscountByID_Shop(shopStore.getIdShopStore(),1));
            model.addAttribute("idPro",id);
        }
        return "shop-manager/edit";
    }
    @GetMapping("/shop-manager/edit/back")
    public String back( @RequestParam Map<String, String> params, HttpSession session, Authentication authentication){

        return "redirect:/user/customer-orders";
    }

    @PostMapping("/shop-manager/edit/update")
    public String upload(@RequestParam Map<String, String> params,@ModelAttribute("product") Product pro,Model model,Authentication authentication) {
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
        if(pro != null)
        {
            if(this.productService.updateProductByID_Product(pro,shopStore.getIdShopStore()) == true){
                model.addAttribute("errMsg","Thành công!!!");

                if(accCur.getIdPos().getIdPosition() == 4 || accCur.getIdPos().getIdPosition() == 1){
                    return "redirect:/shop-manager?idShop_FrEpl=" + params.getOrDefault("idShop_FrEpl","");
                }

                return "redirect:/shop-manager";
            }
        }
        return "shop-manager";
    }

}
