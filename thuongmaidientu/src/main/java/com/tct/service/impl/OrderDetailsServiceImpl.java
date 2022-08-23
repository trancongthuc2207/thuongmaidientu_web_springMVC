package com.tct.service.impl;

import com.tct.pojo.OrderDetails;
import com.tct.pojo.Product;
import com.tct.repository.OrderDetailsRepository;
import com.tct.service.OrderDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrderDetailsServiceImpl implements OrderDetailsService {
    @Autowired
    private OrderDetailsRepository orderDetailsRepository;

    @Override
    public List<OrderDetails> getOrdersDetailsByID_Order_Pro(Map<String, String> params, long idOrd) {
        return this.orderDetailsRepository.getOrdersDetailsByID_Order_Pro(params,idOrd);
    }

    @Override
    public List<OrderDetails> getOrderDetailsByID_Order(long idOrder) {
        return this.orderDetailsRepository.getOrderDetailsByID_Order(idOrder);
    }

    @Override
    public boolean addOrUpdateProdToOrderDetails_WAITTING(Map<String, String> params, long idOrd, int idPro, String idCUs) {
        return this.orderDetailsRepository.addOrUpdateProdToOrderDetails_WAITTING(params,idOrd,idPro,idCUs);
    }

    @Override
    public boolean updateAmout_Pro(long idDetail, int idProd, int amount) {
        return this.orderDetailsRepository.updateAmout_Pro(idDetail,idProd,amount);
    }
}
