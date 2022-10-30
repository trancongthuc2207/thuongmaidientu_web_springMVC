package com.tct.repository;


import com.tct.pojo.Orders;

import java.util.List;
import java.util.Map;

public interface OrdersRepository {

    List<Orders> getOrders(long idOrder);

    int countOrdersByID_Cus(String idCus, String stt);

    List<Object[]> getOrdersByID_Cus_Status(Map<String, String> params, int page,String idCus, String status);

    Long getID_OrdersByID_WAITTING(Map<String, String> params,String idCus);

    boolean saveOrderWaitting(long idOr, String idCus,long totalMoney);

    boolean saveOrderShop(Orders ord, long idOrdW,String idS,long totalMoney);

    long getID_max();

    List<Orders> getOrderByEmployee(Map<String, String> params, int page);

    boolean submitOrderFull(long idOrder);

    List<Orders> getOrderByIDShop_Kw_Stt_Page_IncreDes(String idShop, String kw, String stt, int page, String Incre_Des);
    List<Orders> getOrderByIDCustomer_Kw_Stt_Page_IncreDes(String idCus, String kw, String stt, int page, String Incre_Des);

    List<String> getEveryNameInOrderWaittingByIDCus(String idCus, String stt, int page, String isFull);

    List<Object[]> getOrderByTimeActionByIdShop(String idShop);

    int countOrderFullByEmployee();

    List<Orders> getOrderByEmployee_Kw_SttOfOrder(String kw, String stt, int page);

    int countOrderFullByEmployee_Kw_SttOfOrder(String kw, String stt);
}

