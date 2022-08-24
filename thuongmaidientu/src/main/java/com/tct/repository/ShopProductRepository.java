package com.tct.repository;

import com.tct.pojo.ShopProducts;

import java.util.Date;
import java.util.List;

public interface ShopProductRepository {

    boolean updateAmountPro_booked(String idShop, int idProduct, int sl);

    boolean checkAmount_book(String idShop, int idProduct, int slDat);

    List<ShopProducts> getShopProductByPK(String idShop, int idProduct);

}
