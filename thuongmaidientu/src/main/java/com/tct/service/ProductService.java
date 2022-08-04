/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package com.tct.service;

import com.tct.pojo.Product;
import java.util.List;
import java.util.Map;

/**
 *
 * @author admin
 */
public interface ProductService {
    List<Product> getProducts(Map<String, String> params, int page);
    List<Product> getProductsByType(Map<String, String> params, int page, int type);
    int countProduct();
    List<Product> getProductByID(Map<String, String> params, int id);
}
