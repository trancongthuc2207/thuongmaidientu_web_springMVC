package com.tct.service.impl;

import com.tct.pojo.ShopStore;
import com.tct.repository.ShopStoreRepository;
import com.tct.service.ShopStoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ShopStoreServiceImpl implements ShopStoreService {
    @Autowired
    private ShopStoreRepository shopStoreRepository;

    @Override
    public List<ShopStore> getShopstoreByIdAcc(int idAccS) {
        return this.shopStoreRepository.getShopstoreByIdAcc(idAccS);
    }
}
