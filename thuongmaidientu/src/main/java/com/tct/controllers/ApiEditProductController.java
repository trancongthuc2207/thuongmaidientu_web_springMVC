package com.tct.controllers;

import com.cloudinary.Cloudinary;
import com.tct.pojo.Product;
import com.tct.service.ProductService;
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
}
