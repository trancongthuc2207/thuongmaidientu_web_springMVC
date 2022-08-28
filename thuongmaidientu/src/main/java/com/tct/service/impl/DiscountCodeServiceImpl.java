package com.tct.service.impl;

import com.tct.pojo.DiscountCode;
import com.tct.repository.DiscountCodeRepository;
import com.tct.service.DiscountCodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DiscountCodeServiceImpl implements DiscountCodeService {
    @Autowired
    private DiscountCodeRepository discountCodeRepository;

    @Override
    public List<DiscountCode> getDiscountByID_Shop(String idShop, int status) {
        return this.discountCodeRepository.getDiscountByID_Shop(idShop,status);
    }
}
