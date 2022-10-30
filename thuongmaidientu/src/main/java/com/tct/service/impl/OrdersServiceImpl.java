package com.tct.service.impl;

import com.tct.pojo.Orders;
import com.tct.repository.OrdersRepository;
import com.tct.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrdersServiceImpl implements OrdersService {
    @Autowired
    private OrdersRepository ordersRepository;

    @Override
    public List<Orders> getOrders(long idOrder) {
        return this.ordersRepository.getOrders(idOrder);
    }

    @Override
    public int countOrdersByID_Cus(String idCus, String stt) {
        return this.ordersRepository.countOrdersByID_Cus(idCus,stt);
    }

    @Override
    public List<Object[]> getOrdersByID_Cus_Status(Map<String, String> params, int page, String idCus, String status) {
        return this.ordersRepository.getOrdersByID_Cus_Status(params,page,idCus,status);
    }

    @Override
    public Long getID_OrdersByID_WAITTING(Map<String, String> params, String idCus) {
        return this.ordersRepository.getID_OrdersByID_WAITTING(params,idCus);
    }

    @Override
    public boolean saveOrderWaitting(long idOr, String idCus,long totalMoney) {
        return this.ordersRepository.saveOrderWaitting(idOr,idCus,totalMoney);
    }

    @Override
    public boolean saveOrderShop(Orders ord, long idOrdW, String idS, long totalMoney) {
        return this.ordersRepository.saveOrderShop(ord,idOrdW,idS,totalMoney);
    }

    @Override
    public long getID_max() {
        return this.ordersRepository.getID_max();
    }

    @Override
    public List<Orders> getOrderByEmployee(Map<String, String> params, int page) {
        return this.ordersRepository.getOrderByEmployee(params,page);
    }

    @Override
    public boolean submitOrderFull(long idOrder) {
        return this.ordersRepository.submitOrderFull(idOrder);
    }

    @Override
    public List<Orders> getOrderByIDShop_Kw_Stt_Page_IncreDes(String idShop, String kw, String stt, int page, String Incre_Des) {
        return this.ordersRepository.getOrderByIDShop_Kw_Stt_Page_IncreDes(idShop, kw, stt, page, Incre_Des);
    }

    @Override
    public List<Orders> getOrderByIDCustomer_Kw_Stt_Page_IncreDes(String idCus, String kw, String stt, int page, String Incre_Des) {
        return this.ordersRepository.getOrderByIDCustomer_Kw_Stt_Page_IncreDes(idCus, kw, stt, page, Incre_Des);
    }

    @Override
    public List<String> getEveryNameInOrderWaittingByIDCus(String idCus, String stt, int page, String isFull) {
        return this.ordersRepository.getEveryNameInOrderWaittingByIDCus(idCus, stt, page, isFull);
    }

    @Override
    public List<Object[]> getOrderByTimeActionByIdShop(String idShop) {
        return this.ordersRepository.getOrderByTimeActionByIdShop(idShop);
    }

    @Override
    public int countOrderFullByEmployee() {
        return this.ordersRepository.countOrderFullByEmployee();
    }

    @Override
    public List<Orders> getOrderByEmployee_Kw_SttOfOrder(String kw, String stt, int page) {
        return this.ordersRepository.getOrderByEmployee_Kw_SttOfOrder(kw, stt, page);
    }

    @Override
    public int countOrderFullByEmployee_Kw_SttOfOrder(String kw, String stt) {
        return this.ordersRepository.countOrderFullByEmployee_Kw_SttOfOrder(kw, stt);
    }
}
