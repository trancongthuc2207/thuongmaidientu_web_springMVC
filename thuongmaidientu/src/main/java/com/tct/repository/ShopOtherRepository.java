package com.tct.repository;

import java.util.Date;
import java.util.List;

public interface ShopOtherRepository {
    List<Object[]> getTotalMoneyOrderDetailsByDate_ID_Shop(Date day, String idShop);

    List<Object[]> getTotalMoneyOrderDetailsByMonth_ID_Shop(Date day, String idShop);

    List<Object[]> getTotalAmountProductByMonth_ID_Shop(Date day, String idShop);

    List<Object[]> getTotalAmountProductByDate_ID_Shop(Date day, String idShop);

    List<Object[]> getTotalAmountProductByYear_ID_Shop(Date day, String idShop);
}
