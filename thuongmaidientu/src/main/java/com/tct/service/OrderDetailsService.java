package com.tct.service;

import com.tct.pojo.OrderDetails;
import com.tct.pojo.Product;

import java.util.List;
import java.util.Map;

public interface OrderDetailsService {
    List<OrderDetails> getOrdersDetailsByID_Order_Pro(Map<String, String> params, long idOrd);
    List<OrderDetails> getOrderDetailsByID_Order(long idOrder);
    boolean addOrUpdateProdToOrderDetails_WAITTING(Map<String, String> params, long idOrd, int idPro, String idCUs);
    boolean updateAmout_Pro(long idDetail , int idProd, int amount);
}
