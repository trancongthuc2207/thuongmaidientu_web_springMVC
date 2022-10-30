package com.tct.service.impl;

import com.tct.pojo.ShopProducts;
import com.tct.repository.ShopProductRepository;
import com.tct.service.ShopProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ShopProductServiceImpl implements ShopProductService {
    @Autowired
    private ShopProductRepository shopProductRepository;

    @Override
    public boolean updateAmountPro_booked(String idShop, int idProduct, int sl) {
        return this.shopProductRepository.updateAmountPro_booked(idShop,idProduct,sl);
    }

    @Override
    public boolean checkAmount_book(String idShop, int idProduct, int slDat) {
        return this.shopProductRepository.checkAmount_book(idShop,idProduct,slDat);
    }

    @Override
    public List<ShopProducts> getShopProductByPK(String idShop, int idProduct) {
        return this.shopProductRepository.getShopProductByPK(idShop,idProduct);
    }

    @Override
    public List<ShopProducts> getShopProductByID_Shop(Map<String, String> params, int page, String idShop) {
        return this.shopProductRepository.getShopProductByID_Shop(params,page,idShop);
    }

    @Override
    public int countProduct_ShopByID_Shop(String idShop) {
        return this.shopProductRepository.countProduct_ShopByID_Shop(idShop);
    }

    @Override
    public boolean updateAmountPro_Shop(String idShop, int idProduct, int sl) {
        return this.shopProductRepository.updateAmountPro_Shop(idShop,idProduct,sl);
    }

    @Override
    public boolean updateDiscount_ProductByID_Product(int idPro, String idDis) {
        return this.shopProductRepository.updateDiscount_ProductByID_Product(idPro,idDis);
    }

    @Override
    public List<ShopProducts> getShopProducts() {
        return this.shopProductRepository.getShopProducts();
    }

    @Override
    public List<ShopProducts> getShopProductsByIDShop(String idShop) {
        return this.shopProductRepository.getShopProductsByIDShop(idShop);
    }
}
