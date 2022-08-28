package com.tct.service;

import com.tct.pojo.ShopProducts;

import java.util.List;
import java.util.Map;

public interface ShopProductService {
    boolean updateAmountPro_booked(String idShop, int idProduct, int sl);

    boolean checkAmount_book(String idShop, int idProduct, int slDat);

    List<ShopProducts> getShopProductByPK(String idShop, int idProduct);

    List<ShopProducts> getShopProductByID_Shop(Map<String, String> params, int page, String idShop);

    int countProduct_ShopByID_Shop(String idShop);

    boolean updateAmountPro_Shop(String idShop, int idProduct, int sl);
}
