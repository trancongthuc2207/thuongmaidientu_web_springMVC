/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.tct.pojo.Product;
import com.tct.repository.ProductRepository;
import com.tct.service.ProductService;

import java.io.IOException;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author admin
 */
@Service
public class ProductServiceImpl implements ProductService {
    @Autowired
    private ProductRepository productRepository;

    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<Product> getProducts(Map<String, String> params, int page) {
        return this.productRepository.getProducts(params, page);
    }

    @Override
    public List<Product> getProductsByType(Map<String, String> map, int i, int i1) {
        return this.productRepository.getProductsByType(map, i, i1);
    }

    @Override
    public int countProduct(String full, int type) {
        return this.productRepository.countProduct(full,type);
    }

    @Override
    public List<Product> getProductByID(Map<String, String> map, int i) {
        return this.productRepository.getProductByID(map, i);
    }

    @Override
    public boolean updateProductByID_Product(int idPro, String name, Long unitPrice, String decrip, int typePro, String manufac, String image) {
        return this.productRepository.updateProductByID_Product(idPro, name, unitPrice, decrip, typePro, manufac, image);
    }

    @Override
    public boolean updateStatusDelete_ProductByID_Product(int idPro) {
        return this.productRepository.updateStatusDelete_ProductByID_Product(idPro);
    }

    @Override
    public boolean addNewProduct(String name, Long unitPrice, String decrip, int typePro, String manufac, String image, String idShop) {
        return this.productRepository.addNewProduct(name, unitPrice, decrip, typePro, manufac, image, idShop);
    }

    @Override
    public List<Product> getProductsWaittingByID_Shop(String idShop) {
        return this.productRepository.getProductsWaittingByID_Shop(idShop);
    }

    @Override
    public List<Product> getProductsDeletedByID_Shop(String idShop) {
        return this.productRepository.getProductsDeletedByID_Shop(idShop);
    }

    @Override
    public boolean updateStatusRestore_ProductByID_Product(int idPro) {
        return this.productRepository.updateStatusRestore_ProductByID_Product(idPro);
    }

    @Override
    public boolean addNewProduct(Product pro, String idShop) {
        try {
            Map r = this.cloudinary.uploader().upload(pro.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            String img = (String) r.get("secure_url");
            pro.setImage(img);
            return this.productRepository.addNewProduct(pro, idShop);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public boolean updateProductByID_Product(Product proD, String idShop) {
        try {
            if(proD.getFile() != null){
                Map r = this.cloudinary.uploader().upload(proD.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                String img = (String) r.get("secure_url");
                proD.setImage(img);
            }
            return this.productRepository.updateProductByID_Product(proD, idShop);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public List<Product> getProductsWaittingComfirm() {
        return this.productRepository.getProductsWaittingComfirm();
    }

    @Override
    public boolean addProduct2Shop(int idPro) {
        return this.productRepository.addProduct2Shop(idPro);
    }

    @Override
    public List<Product> getProductFavoriteOfCustomers(String idCus) {
        return this.productRepository.getProductFavoriteOfCustomers(idCus);
    }

    @Override
    public List<Product> GetProductByIDShop_Kw_Stt_posData_haveDiscount_AmountFull_increDes(String idShop, String kw, int stt, int page, String isDiscount, String isFull, String incre_des) {
        return this.productRepository.GetProductByIDShop_Kw_Stt_posData_haveDiscount_AmountFull_increDes(idShop,kw,stt,page,isDiscount,isFull,incre_des);
    }

    @Override
    public List<Product> GetProductIndex_All_Kw(String kw, String disCount, String incre_des, int stt, int page, String isFull) {
        return this.productRepository.GetProductIndex_All_Kw(kw, disCount, incre_des, stt, page, isFull);
    }

    @Override
    public List<Object[]> GetProductHotSaleByIdShop(String idShop, Date dateMonth) {
        return this.productRepository.GetProductHotSaleByIdShop(idShop,dateMonth);
    }
}
