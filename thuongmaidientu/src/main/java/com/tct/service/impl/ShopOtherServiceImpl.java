package com.tct.service.impl;

import com.tct.repository.ShopOtherRepository;
import com.tct.service.ShopOtherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ShopOtherServiceImpl implements ShopOtherService {
    @Autowired
    private ShopOtherRepository shopOtherRepository;

    @Override
    public List<Object[]> getTotalMoneyOrderDetailsByDate_ID_Shop(Date day, String idShop) {
        return this.shopOtherRepository.getTotalMoneyOrderDetailsByDate_ID_Shop(day,idShop);
    }

    @Override
    public List<Object[]> getTotalMoneyOrderDetailsByMonth_ID_Shop(Date day, String idShop) {
        return this.shopOtherRepository.getTotalMoneyOrderDetailsByMonth_ID_Shop(day,idShop);
    }

    @Override
    public List<Object[]> getTotalAmountProductByMonth_ID_Shop(Date day, String idShop) {
        return this.shopOtherRepository.getTotalAmountProductByMonth_ID_Shop(day, idShop);
    }

    @Override
    public List<Object[]> getTotalAmountProductByDate_ID_Shop(Date day, String idShop) {
        return this.shopOtherRepository.getTotalAmountProductByDate_ID_Shop(day, idShop);
    }

    @Override
    public List<Object[]> getTotalAmountProductByYear_ID_Shop(Date day, String idShop) {
        return this.shopOtherRepository.getTotalAmountProductByYear_ID_Shop(day, idShop);
    }
}
