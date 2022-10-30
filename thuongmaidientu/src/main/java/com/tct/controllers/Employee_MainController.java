package com.tct.controllers;

import com.tct.pojo.Account;
import com.tct.pojo.Customers;
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
public class Employee_MainController {
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

    @Autowired
    private EmployeeService employeeService;

    @Autowired
    private AccountService account_Service;

    @GetMapping("/employee")
    public String employee_main(Model model, @RequestParam Map<String, String> params, HttpSession session, Authentication authentication) {
        int page = Integer.parseInt(params.getOrDefault("pageOrder","1"));

        int pageShop = Integer.parseInt(params.getOrDefault("pageShop","0"));
        String idShopOrder = params.getOrDefault("idShop_Order","0");

        if (authentication != null) {
            Authentication auth = SecurityContextHolder.getContext().getAuthentication();
            Account accCur = this.userDetailsService.getByUsername(authentication.getName());
            session.setAttribute("roleAccess",accCur.getIdPos().getDescriptions());
            model.addAttribute("active", accCur.getStt());
            model.addAttribute("accEmpl", accCur.getIdAccount());
            Customers customers = this.customerService.getCustomersByID_acc(accCur.getIdAccount());
            session.setAttribute("nameCus",customers.getNameC());
            //////////////////  ORDER
            ///1. FULL ORDER
            model.addAttribute("listOrder", this.ordersService.getOrderByEmployee(params, page));
            model.addAttribute("countOrderFull", this.ordersService.countOrderFullByEmployee());
            ///2. ORDER ACCEPTED

            int pageSales = Integer.parseInt(params.getOrDefault("pageSales","1"));
            model.addAttribute("listOrderSales", this.ordersService.getOrderByEmployee_Kw_SttOfOrder("","2",pageSales));
            model.addAttribute("countOrderSales", this.ordersService.countOrderFullByEmployee_Kw_SttOfOrder("","2"));
            ////
            model.addAttribute("listOrderDetails", this.orderDetailsService.getOrderDetails(params, page));
            session.setAttribute("idEmployee",customers.getIdCustomer());

            ///////////////// PRODUCT
            ///TYPE PRODUCT
            session.setAttribute("listTypeProduct",this.type_ProductService.getTypeProducts());
            session.setAttribute("listProduct",this.productService.getProductsWaittingComfirm());

            model.addAttribute("lst_rp_fromCus", this.reportService.getListReportOfCustomerToShopProduct("","1",0));
            //////////////   DISCOUNT
            int pageDiscount = Integer.parseInt(params.getOrDefault("pageDiscount","1"));
            model.addAttribute("listDiscount", this.discountCodeService.getDiscountByEmployee(pageDiscount,100));
            model.addAttribute("countDiscount", this.discountCodeService.countDiscountCode(100));
            //////////////   CUSTOMERS
            int pageCus = Integer.parseInt(params.getOrDefault("pageCus","1"));
            model.addAttribute("listCustomer", this.customerService.getCustomersByEmployee("",pageCus));
            model.addAttribute("countCustomer", this.customerService.countCustomerByEmployee(""));
            //////ACCOUNT
            model.addAttribute("lstAccount",this.account_Service.getAccountByEmployee());


            //////////////////////
            if(!idShopOrder.equals("0")){
                session.setAttribute("listOrder_wait", this.orderDetailsService.listIDOrderToStringByIdShop(idShopOrder, "1","",page));
            }

            model.addAttribute("idS", idShopOrder);
            model.addAttribute("list_in4Shop", this.employeeService.getFullIn4Shop(params,pageShop));
            model.addAttribute("sl_shop", this.employeeService.countShopActive());
        }
        return "employee";
    }
}
