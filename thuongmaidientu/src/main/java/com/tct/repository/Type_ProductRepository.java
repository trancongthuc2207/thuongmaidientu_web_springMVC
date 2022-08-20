/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.repository;

import com.tct.pojo.TypeProduct;

import java.util.List;
import java.util.Map;

/**
 *
 * @author ADMIN
 */
public interface Type_ProductRepository {
    List<TypeProduct> getType_Products();
    List<TypeProduct> getTypeProductId(Map<String, String> params);
}
