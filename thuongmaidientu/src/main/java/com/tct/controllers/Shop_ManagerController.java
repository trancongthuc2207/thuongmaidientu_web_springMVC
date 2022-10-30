package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.Orders;
import com.tct.pojo.Product;
import com.tct.pojo.ShopStore;
import com.tct.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
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

    @Autowired
    private ReportService reportService;

    @ModelAttribute
    public void addAttributes(Model model, Authentication authentication) {
        if (authentication != null) {
            model.addAttribute("currentUser", this.accountService.getByUsername(authentication.getName()));
        }
    }

    @GetMapping("/shop-manager")
    public String customer_prodAttr(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) throws ParseException {
        model.addAttribute("type_products", this.type_ProductService.getTypeProducts());
        model.addAttribute("account", new Account());
        int page = Integer.parseInt(params.getOrDefault("page", "1"));

        //ORDER WAITING
        int pageOrdWaitting = Integer.parseInt(params.getOrDefault("pageOr_W", "1"));
        String inc_desW = params.getOrDefault("filDate","des");
        String kwOr_w = params.getOrDefault("kwOrd_kw","");
        //ORDER ACCEPT
        int pageOrdAccepted = Integer.parseInt(params.getOrDefault("pageOrAc_W", "1"));
        String inc_desAc = params.getOrDefault("filDateAc","des");
        String kwOrAc_w = params.getOrDefault("kwOrdAc_kw","");
        //ORDER CANCLE
        int pageOrdCancle = Integer.parseInt(params.getOrDefault("pageOrCa_W", "1"));
        String inc_desCa = params.getOrDefault("filDateCa","des");
        String kwOrCa_w = params.getOrDefault("kwOrdCa_kw","");
        //
        model.addAttribute("shopstore", new ShopStore());
        model.addAttribute("type_products", this.type_ProductService.getTypeProducts());


        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            model.addAttribute("idAcc", accCur.getIdAccount());
            ShopStore shopStore = new ShopStore();


            if(accCur.getIdPos().getIdPosition() == 3){
                shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            }
            if(accCur.getIdPos().getIdPosition() == 4 || accCur.getIdPos().getIdPosition() == 1){
                String idShopFromParams = params.getOrDefault("idShop_FrEpl","");
                shopStore = this.shopStoreService.getShopstoreByID_Shop(idShopFromParams).get(0);
                model.addAttribute("idS_FrEmpl",idShopFromParams);
                model.addAttribute("accEmpl", accCur.getIdAccount());
                model.addAttribute("idAcc", params.get("idAcc"));
            }

            String ìdShop = shopStore.getIdShopStore();
            int slPro = this.shopProductService.countProduct_ShopByID_Shop(ìdShop);
            model.addAttribute("amountReport", this.reportService.countReportShop(ìdShop));
            model.addAttribute("amountOrder", this.orderDetailsService.countNotConfirmOrderDetailsForShopById_Order(ìdShop));

            //DASHBOARD
            String dateM_sale = params.getOrDefault("monthSelect_Hot","");
            SimpleDateFormat frmt = new SimpleDateFormat("yyyy-MM-dd");
            Date monthSelectHotSale = new Date();
            List<Object[]> lstProHotSale = new ArrayList<>();
            if(dateM_sale == ""){
                monthSelectHotSale = null;
                lstProHotSale = this.productService.GetProductHotSaleByIdShop(ìdShop,monthSelectHotSale);
                model.addAttribute("lstProHotSale", lstProHotSale);
            }
            if(dateM_sale != ""){
                dateM_sale += "-01";
                monthSelectHotSale = frmt.parse(dateM_sale);
                lstProHotSale = this.productService.GetProductHotSaleByIdShop(ìdShop,monthSelectHotSale);
                model.addAttribute("lstProHotSale", lstProHotSale);
            }

            List<Object[]> lstOrderAction = new ArrayList<>();
            lstOrderAction = this.ordersService.getOrderByTimeActionByIdShop(ìdShop);
            model.addAttribute("lstOrdAction", lstOrderAction);
            /////
            model.addAttribute("active", accCur.getStt());
            model.addAttribute("shopAcc", this.shopStoreService.getShopstoreByIdAcc(shopStore.getIdAcc().getIdAccount()));
            model.addAttribute("countPro", slPro);
            model.addAttribute("listProduct", this.shopProductService.getShopProductByID_Shop(params, page, ìdShop));
            model.addAttribute("lst_discount", this.discountCodeService.getDiscountByID_Shop(ìdShop, 1));
            //ORDER WAITING
            List<Orders> lst_order_wait = new ArrayList<>();
            lst_order_wait = this.ordersService.getOrderByIDShop_Kw_Stt_Page_IncreDes(ìdShop,kwOr_w,"1",pageOrdWaitting,inc_desW);
            int size_lst_wait = lst_order_wait.size();
            model.addAttribute("shopID", shopStore.getIdShopStore());
            session.setAttribute("list_OrderWaitting", this.ordersService.getOrderByIDShop_Kw_Stt_Page_IncreDes(ìdShop,kwOr_w,"1",pageOrdWaitting,inc_desW));
            model.addAttribute("sizeOrdWaiting",this.ordersService.getOrderByIDShop_Kw_Stt_Page_IncreDes(ìdShop,kwOr_w,"1",pageOrdWaitting,"FULL").size());
            model.addAttribute("pageOr_W",pageOrdWaitting);
            model.addAttribute("kwOr_w",kwOr_w);
            model.addAttribute("inc_desW",inc_desW);
            //
            //ORDER ACCEPT
            List<Orders> lst_order_accept = new ArrayList<>();
            lst_order_accept = this.ordersService.getOrderByIDShop_Kw_Stt_Page_IncreDes(ìdShop,kwOrAc_w,"2",pageOrdAccepted,inc_desAc);
            int size_lst_accept = lst_order_accept.size();
            model.addAttribute("shopID", shopStore.getIdShopStore());
            session.setAttribute("list_OrderAccept", this.ordersService.getOrderByIDShop_Kw_Stt_Page_IncreDes(ìdShop,kwOrAc_w,"2",pageOrdAccepted,inc_desAc));
            model.addAttribute("sizeOrdAccept",this.ordersService.getOrderByIDShop_Kw_Stt_Page_IncreDes(ìdShop,kwOrAc_w,"2",pageOrdAccepted,"FULL").size());
            model.addAttribute("pageOrAc_W",pageOrdAccepted);
            model.addAttribute("kwOrdAc_kw",kwOrAc_w);
            model.addAttribute("inc_desAc",inc_desAc);
            //
            //ORDER CANCLE
            List<Orders> lst_order_cancle = new ArrayList<>();
            lst_order_cancle = this.ordersService.getOrderByIDShop_Kw_Stt_Page_IncreDes(ìdShop,kwOrCa_w,"CANCLE",pageOrdCancle,inc_desCa);
            int size_lst_cancle = lst_order_cancle.size();
            model.addAttribute("shopID", shopStore.getIdShopStore());
            session.setAttribute("list_OrderCancle", this.ordersService.getOrderByIDShop_Kw_Stt_Page_IncreDes(ìdShop,kwOrCa_w,"CANCLE",pageOrdCancle,inc_desCa));
            model.addAttribute("sizeOrdCancle",this.ordersService.getOrderByIDShop_Kw_Stt_Page_IncreDes(ìdShop,kwOrCa_w,"CANCLE",pageOrdCancle,"FULL").size());
            model.addAttribute("pageOrCa_W",pageOrdCancle);
            model.addAttribute("kwOrdCa_kw",kwOrCa_w);
            model.addAttribute("inc_desCa",inc_desCa);

            model.addAttribute("shop_product",this.shopProductService.getShopProductsByIDShop(ìdShop));
        }
        return "shop-manager";
    }

    @GetMapping("/shop-manager/amount/{idProduct}/{sl}")
    public String save_amount(Model model, @PathVariable("idProduct") Integer idPro, @PathVariable("sl") Integer sl, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());

            ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
            this.shopProductService.updateAmountPro_Shop(shopStore.getIdShopStore(), idPro, sl);
        }
        return "redirect:/shop-manager";
    }

    @PostMapping("/shop-manager/update-shopstore")
    public String updateShopStore(@ModelAttribute("shopstore") ShopStore store, Model model, Authentication authentication) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Account accCur = this.userDetailsService.getByUsername(authentication.getName());
        ShopStore shopStore = this.shopStoreService.getShopstoreByIdAcc(accCur.getIdAccount()).get(0);
        store.setIdShopStore(shopStore.getIdShopStore());
        if (this.shopStoreService.updateIn4ShopStore(store) == true) {
            model.addAttribute("errMsg", "Thành công!!!");
            return "redirect:/shop-manager";
        }
        return "shop-manager";
    }

    @GetMapping(path = "/shop-manager/get-list-order-waitting" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<List<Orders>> getListOrder_WaittingShop(@RequestBody Map<String,String> params, HttpSession session){
        String idS = params.get("idS");
        int pageOrdWaitting = Integer.parseInt(params.getOrDefault("pageOr_W", "0"));
        String kw = params.get("kw_wait");
        String inc_desW = params.getOrDefault("filDate","incre");

        List<Orders> lst = this.ordersService.getOrderByIDShop_Kw_Stt_Page_IncreDes(idS,kw,"1",pageOrdWaitting,inc_desW);
        session.setAttribute("list_OrderWaitting", lst);
        return new ResponseEntity<>(lst, HttpStatus.OK);
    }

    @PostMapping("/shop-manager/update-account")
    public String updateShopStoreAccount(@ModelAttribute("account") Account acc, Model model, Authentication authentication) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        Account accCur = this.userDetailsService.getByUsername(authentication.getName());
        if (acc != null) {
            if (acc.getPasswordC().equals(acc.getConfirmPassword())) {
                if (this.userDetailsService.updateUser(acc) == true) {
                    model.addAttribute("errMsgPass", "Thành công!!!");
                    return "redirect:/shop-manager";
                }
            } else {
                model.addAttribute("errMsgPass", "Thất Bại, Mật khẩu khác nhau!!!");
                return "redirect:/shop-manager";
            }
        }
        return "redirect:/shop-manager";
    }
}
