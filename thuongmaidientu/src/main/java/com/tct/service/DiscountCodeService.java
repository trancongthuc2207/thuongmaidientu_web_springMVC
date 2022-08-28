package com.tct.service;

import com.tct.pojo.DiscountCode;

import java.util.List;

public interface DiscountCodeService {
    List<DiscountCode> getDiscountByID_Shop(String idShop, int status);
}
