/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.service.impl;

import com.tct.pojo.TypeProduct;
import com.tct.repository.Type_ProductRepository;
import java.util.List;
import com.tct.service.Type_ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class Type_ProductServiceImpl implements Type_ProductService{
    @Autowired
    private Type_ProductRepository type_ProductRepository;
    
    @Override
    public List<TypeProduct> getTypeProducts() {
        return this.type_ProductRepository.getType_Products();
    }
    
}
