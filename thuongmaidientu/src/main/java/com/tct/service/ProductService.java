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

    boolean updateProductByID_Product(int idPro, String name, Long unitPrice, String decrip,int typePro,String manufac, String image);

    boolean updateStatusDelete_ProductByID_Product(int idPro);

    boolean addNewProduct(String name, Long unitPrice, String decrip,int typePro,String manufac, String image, String idShop);

    List<Product> getProductsWaittingByID_Shop(String idShop);

    List<Product> getProductsDeletedByID_Shop(String idShop);

    boolean updateStatusRestore_ProductByID_Product(int idPro);

    boolean addNewProduct(Product pro,String idShop);

    boolean updateProductByID_Product(Product proD,String idShop);

    List<Product> getProductsWaittingComfirm();

    boolean addProduct2Shop(int idPro);

    List<Product> getProductFavoriteOfCustomers(String idCus);

}
