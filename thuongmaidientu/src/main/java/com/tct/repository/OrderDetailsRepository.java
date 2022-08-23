package com.tct.repository;

import com.tct.pojo.OrderDetails;
import com.tct.pojo.OrderDetailsPK;
import com.tct.pojo.Product;

import java.util.List;
import java.util.Map;

public interface OrderDetailsRepository {
    List<OrderDetails> getOrdersDetailsByID_Order_Pro(Map<String, String> params, long idOrd);

    List<OrderDetails> getOrderDetailsByID_Order(long idOrder);
    boolean addOrUpdateProdToOrderDetails_WAITTING(Map<String, String> params, long idOrd, int idPro, String idCUs);

    List<OrderDetails> getOrderDetailByPK(long idOr, int idPro);

    boolean updateAmout_Pro(long idDetail , int idProd, int amount);

}
