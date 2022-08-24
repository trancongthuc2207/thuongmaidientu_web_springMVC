package com.tct.service.impl;

import com.tct.pojo.ShopProducts;
import com.tct.repository.ShopProductRepository;
import com.tct.service.ShopProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

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
}
