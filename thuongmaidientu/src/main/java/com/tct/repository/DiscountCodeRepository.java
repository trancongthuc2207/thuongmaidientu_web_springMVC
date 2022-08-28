package com.tct.repository;

import com.tct.pojo.DiscountCode;

import java.util.List;

public interface DiscountCodeRepository {

    List<DiscountCode> getDiscountByID_Shop(String idShop, int status);
}
