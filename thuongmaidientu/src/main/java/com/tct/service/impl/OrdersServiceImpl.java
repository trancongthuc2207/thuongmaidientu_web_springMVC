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
    public List<Orders> getOrders(Map<String, String> params, int page) {
        return null;
    }

    @Override
    public int countOrdersByID_Cus(String idCus) {
        return this.ordersRepository.countOrdersByID_Cus(idCus);
    }

    @Override
    public List<Object[]> getOrdersByID_Cus_Status(Map<String, String> params, int page, String idCus, String status) {
        return this.ordersRepository.getOrdersByID_Cus_Status(params,page,idCus,status);
    }

    @Override
    public List<Orders> getProductByID_Shop(Map<String, String> params, int id) {
        return null;
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
    public long getID_max() {
        return this.ordersRepository.getID_max();
    }
}
