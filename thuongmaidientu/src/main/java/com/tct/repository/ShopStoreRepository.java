package com.tct.repository;

import com.tct.pojo.ShopStore;

import java.util.List;

public interface ShopStoreRepository {

    List<ShopStore> getShopstoreByIdAcc(int idAccS);
}
