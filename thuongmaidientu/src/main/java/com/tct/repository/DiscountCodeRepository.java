package com.tct.repository;

import com.tct.pojo.DiscountCode;
import com.tct.pojo.Product;

import java.util.List;

public interface DiscountCodeRepository {

    List<DiscountCode> getDiscountByID_Shop(String idShop, int status);

    boolean addNewDiscount(DiscountCode dis, String idShop);

    boolean updateSttDiscount(String idDis, String stt);

    List<DiscountCode> getDiscountByEmployee(int page, int stt);

    int countDiscountCode(int stt);
}
