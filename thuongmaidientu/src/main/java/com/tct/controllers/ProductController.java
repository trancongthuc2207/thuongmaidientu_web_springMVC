/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.controllers;

import com.tct.service.ProductService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author ADMIN
 */
@Controller
@ControllerAdvice
public class ProductController {
    
    @Autowired
    private ProductService productService;
    
    @RequestMapping("/products")
    public String index(Model model, @RequestParam Map<String, String> params) {
        int id = Integer.parseInt(params.getOrDefault("ID_Product", "1"));
        model.addAttribute("productByID", this.productService.getProductByID(params,id));
        return "products";
    }
}
