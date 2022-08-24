package com.tct.service;

import com.tct.pojo.ShopProducts;

import java.util.List;

public interface ShopProductService {
    boolean updateAmountPro_booked(String idShop, int idProduct, int sl);

    boolean checkAmount_book(String idShop, int idProduct, int slDat);

    List<ShopProducts> getShopProductByPK(String idShop, int idProduct);
}
