/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.service.impl;

import com.tct.pojo.Product;
import com.tct.repository.ProductRepository;
import com.tct.service.ProductService;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author admin
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Override
    public List<Product> getProducts(Map<String, String> params, int page) {
        return this.productRepository.getProducts(params, page);
    }

    @Override
    public List<Product> getProductsByType(Map<String, String> map, int i, int i1) {
        return this.productRepository.getProductsByType(map, i,i1);
    }

    @Override
    public int countProduct() {
        return this.productRepository.countProduct();
    }

    @Override
    public List<Product> getProductByID(Map<String, String> map, int i) {
        return this.productRepository.getProductByID(map, i);
    }

    @Override
    public boolean updateProductByID_Product(int idPro, String name, Long unitPrice, String decrip, int typePro, String manufac, String image) {
        return this.productRepository.updateProductByID_Product(idPro,name,unitPrice,decrip,typePro,manufac,image);
    }

    @Override
    public boolean updateStatusDelete_ProductByID_Product(int idPro) {
        return this.productRepository.updateStatusDelete_ProductByID_Product(idPro);
    }
}
