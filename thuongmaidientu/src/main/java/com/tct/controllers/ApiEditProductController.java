package com.tct.controllers;

import com.cloudinary.Cloudinary;
import com.tct.pojo.Product;
import com.tct.service.DiscountCodeService;
import com.tct.service.OrderDetailsService;
import com.tct.service.ProductService;
import com.tct.service.ShopProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpSession;
import javax.swing.text.html.parser.Entity;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ApiEditProductController {
    @Autowired
    private ProductService productService;

    @Autowired
    private OrderDetailsService orderDetailsService;

    @Autowired
    private ShopProductService shopProductService;

    @Autowired
    private DiscountCodeService discountCodeService;

    @PostMapping(path = "/update-pro" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Product> updatePro(@RequestBody Map<String,String> params){
        String nameProduct = params.get("name_pro");
        Long unitPrice = Long.parseLong(params.get("price"));
        String productDescription = params.get("descr");
        String manufacturer = params.get("manufa");
        int type_pro = Integer.parseInt(params.get("type"));
        String image = params.get("img");

        int idPro = Integer.parseInt(params.get("idPro"));
        if(this.productService.updateProductByID_Product(idPro,nameProduct,unitPrice,productDescription,type_pro,manufacturer,image))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/update-delete-pro" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Product> updateDeletePro(@RequestBody Map<String,String> params){
        int idPro = Integer.parseInt(params.get("idPro"));
        if(this.productService.updateStatusDelete_ProductByID_Product(idPro))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/add-pro" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Product> addPro(@RequestBody Map<String,String> params, HttpSession session){
        String nameProduct = params.get("name_pro");
        Long unitPrice = Long.parseLong(params.get("price"));
        String productDescription = params.get("descr");
        String manufacturer = params.get("manufa");
        int type_pro = Integer.parseInt(params.get("type"));
        String image = (String) session.getAttribute("linkImg");

        String idShop = params.get("idShop");
        if(this.productService.addNewProduct(nameProduct,unitPrice,productDescription,type_pro,manufacturer,image,idShop))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/update-restore-pro" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Product> updateRestorePro(@RequestBody Map<String,String> params){
        int idPro = Integer.parseInt(params.get("idPro"));
        if(this.productService.updateStatusRestore_ProductByID_Product(idPro))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/add-shop-product" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Product> addShopProduct(@RequestBody Map<String,String> params){
        int idPro = Integer.parseInt(params.get("idPro"));
        if(this.productService.addProduct2Shop(idPro))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }


    @PostMapping(path = "/add-product2cart" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Product> addProduct2cart(@RequestBody Map<String,String> params,HttpSession session){
        int idPro = Integer.parseInt(params.get("idPro"));
        String idCus = params.get("idCus");
        long idOrderWaitting = Long.parseLong(params.get("idOrd"));

        if(this.orderDetailsService.addOrUpdateProdToOrderDetails_WAITTING(params,idOrderWaitting,idPro,idCus)){
            session.setAttribute("amountPro",this.orderDetailsService.countProductInOrderWaitting(idOrderWaitting));
            return new ResponseEntity<>(HttpStatus.OK);
        }
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/add-discount-product" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Product> addDiscountProduct(@RequestBody Map<String,String> params){
        int idPro = Integer.parseInt(params.get("idPro"));
        String idDis = params.get("idDis");
        if(this.shopProductService.updateDiscount_ProductByID_Product(idPro,idDis))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/update-amount-product" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Product> updateAmountProduct(@RequestBody Map<String,String> params){
        String idShop = params.get("idShop");
        int idPro = Integer.parseInt(params.get("idPro"));
        int amount = Integer.parseInt(params.get("amount"));

        if(this.shopProductService.updateAmountPro_Shop(idShop, idPro, amount))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    @PostMapping(path = "/update-stt-discount" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Product> updateSttDiscount(@RequestBody Map<String,String> params){
        String idDis = params.get("idDis");
        String stt = params.get("sttDis");

        if(this.discountCodeService.updateSttDiscount(idDis,stt))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
