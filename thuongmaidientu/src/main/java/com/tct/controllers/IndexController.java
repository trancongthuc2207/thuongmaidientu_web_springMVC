/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.controllers;


import com.tct.service.ProductService;
import com.tct.service.Type_ProductService;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.velocity.runtime.directive.Foreach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author admin
 */
@Controller
@ControllerAdvice
public class IndexController {
    @Autowired
    private Type_ProductService type_ProductService;
    @Autowired
    private ProductService productService;
    
    @RequestMapping("/")
    public String index(Model model, @RequestParam Map<String, String> params) {
        model.addAttribute("type_products", this.type_ProductService.getTypeProducts());
        
        
        int page = Integer.parseInt(params.getOrDefault("page", "1"));
        int type = Integer.parseInt(params.getOrDefault("type_Id","1"));
        model.addAttribute("products", this.productService.getProductsByType(params, page,type));
        model.addAttribute("productCounter", this.productService.countProduct());
        
        return "index";
    }   

}
