package com.tct.service;

import com.tct.pojo.ShopStore;

import java.util.List;

public interface ShopStoreService {
    List<ShopStore> getShopstoreByIdAcc(int idAccS);

    boolean updateIn4ShopStore(ShopStore store);

    List<ShopStore> getShopstoreByID_Shop(String idShop);
}
