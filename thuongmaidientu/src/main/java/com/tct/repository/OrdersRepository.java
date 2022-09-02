package com.tct.repository;


import com.tct.pojo.Orders;

import java.util.List;
import java.util.Map;

public interface OrdersRepository {

    List<Orders> getOrders(Map<String, String> params, int page);

    int countOrdersByID_Cus(String idCus);

    List<Object[]> getOrdersByID_Cus_Status(Map<String, String> params, int page,String idCus, String status);

    Long getID_OrdersByID_WAITTING(Map<String, String> params,String idCus);

    boolean saveOrderWaitting(long idOr, String idCus,long totalMoney);

    long getID_max();

    List<Orders> getOrderByEmployee(Map<String, String> params, int page);

    boolean submitOrderFull(long idOrder);

}

