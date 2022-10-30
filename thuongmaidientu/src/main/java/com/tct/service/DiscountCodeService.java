package com.tct.service;

import com.tct.pojo.DiscountCode;

import java.util.List;

public interface DiscountCodeService {
    List<DiscountCode> getDiscountByID_Shop(String idShop, int status);

    boolean addNewDiscount(DiscountCode dis, String idShop);

    boolean updateSttDiscount(String idDis, String stt);

    List<DiscountCode> getDiscountByEmployee(int page, int stt);

    int countDiscountCode(int stt);
}
