package com.tct.repository;

import com.tct.pojo.OrderDetails;
import com.tct.pojo.Product;

import java.util.List;
import java.util.Map;

public interface OrderDetailsRepository {
    List<OrderDetails> getOrdersDetailsByID_Order_Pro(Map<String, String> params, long idOrd);

    OrderDetails getOrderDetailsByID_Order(long idOrder);
    boolean addOrUpdateProdToOrderDetails_WAITTING(Map<String, String> params, long idOrd, Product pro, String idCUs);

}
