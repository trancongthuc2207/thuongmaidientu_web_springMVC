package com.tct.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.tct.pojo.ShopStore;
import com.tct.repository.ShopStoreRepository;
import com.tct.service.ShopStoreService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

@Service
public class ShopStoreServiceImpl implements ShopStoreService {
    @Autowired
    private ShopStoreRepository shopStoreRepository;

    @Autowired
    private Cloudinary cloudinary;

    @Override
    public List<ShopStore> getShopstoreByIdAcc(int idAccS) {
        return this.shopStoreRepository.getShopstoreByIdAcc(idAccS);
    }

    @Override
    public boolean updateIn4ShopStore(ShopStore store) {
        try {
            if(store.getFile() != null){
                Map r = this.cloudinary.uploader().upload(store.getFile().getBytes(),
                        ObjectUtils.asMap("resource_type", "auto"));
                String img = (String) r.get("secure_url");
                store.setImageS(img);
            }
            return this.shopStoreRepository.updateIn4ShopStore(store);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }

    @Override
    public List<ShopStore> getShopstoreByID_Shop(String idShop) {
        return this.shopStoreRepository.getShopstoreByID_Shop(idShop);
    }
}
