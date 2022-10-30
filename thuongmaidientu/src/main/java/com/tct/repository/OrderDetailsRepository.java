package com.tct.repository;

import com.tct.pojo.OrderDetails;

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

    List<OrderDetails> getOrderDetailsForShopByID_Shop(Map<String, String> params, int page, String idShop);

    int countOrderDetailsForShopById_Order(String idShop,String stt);

    List<OrderDetails> getOrderDetailsForShopByID_ShopKW(Map<String, String> params, int page, String idShop);

    int countOrderDetailsForShopById_OrderToday(String idShop);

    boolean updateSTTAccept_OrderDetailsShopByID_Ord_ID_Pro(long idDetail, int idPro);

    List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW(Map<String, String> params, int page, String idShop);

    List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW_Today(Map<String, String> params, int page, String idShop);

    List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW_Yesterday(Map<String, String> params, int page, String idShop);

    List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW_MoreDay(Map<String, String> params, int page, String idShop);

    List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW_All(Map<String, String> params, int page, String idShop);

    List<OrderDetails> getOrderDetails(Map<String, String> params, int page);

    List<OrderDetails> getOrderDetailsForShopByID_ShopKW_Today(Map<String, String> params, int page, String idShop);

    List<OrderDetails> getOrderDetailsForShopByID_ShopKW_Yesterday(Map<String, String> params, int page, String idShop);

    List<OrderDetails> getOrderDetailsForShopByID_ShopKW_MoreDay(Map<String, String> params, int page, String idShop);

    List<OrderDetails> getOrderDetailsForShopByID_ShopKW_All(Map<String, String> params, int page, String idShop);

    int countNotConfirmOrderDetailsForShopById_Order(String idShop);

    int countProductInOrderWaitting(long idDetail);

    boolean updateOrderIdPaying(long idWait,String idSh,long idOrdN);

    long totalOfOrderPerShop(long idOr, String idS);

    List<String> listIDOrderToStringByIdShop(String idS, String stt, String kw_time, int page);

    boolean updateSTTAccept_OrderDetailsShopByID_Ord(long idDetail);

    List<OrderDetails> getOrderDetailsByIDCustomer_SttOrder(String idCus, String stt);

    boolean updateSTTCancle_OrderDetailsShopByID_Ord(long idDetail,String reason, String from);
}
