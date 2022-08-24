package com.tct.repository;

import com.tct.pojo.OrderDetails;
import com.tct.pojo.OrderDetailsPK;
import com.tct.pojo.Product;

import java.util.List;
import java.util.Map;

public interface OrderDetailsRepository {
    List<OrderDetails> getOrdersDetailsByID_Order_Pro(Map<String, String> params, long idOrd);

    List<OrderDetails> getOrderDetailsByID_Order(Map<String, String> params, int page, long idOrder);
    boolean addOrUpdateProdToOrderDetails_WAITTING(Map<String, String> params, long idOrd, int idPro, String idCUs);

    List<OrderDetails> getOrderDetailByPK(long idOr, int idPro);

    boolean updateAmout_Pro(long idDetail , int idProd, int amount);

    boolean deletePro(long idDetail , int idProd);

    int countOrderDetailsById_Order(long idOr);

    long totalOfOrderWatting(long idOr);
}
