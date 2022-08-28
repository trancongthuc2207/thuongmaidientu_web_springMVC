package com.tct.service.impl;

import com.tct.pojo.OrderDetails;
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
    public List<OrderDetails> getOrderDetailsByID_Order(Map<String, String> params, int page, long idOrder) {
        return this.orderDetailsRepository.getOrderDetailsByID_Order(params,page,idOrder);
    }

    @Override
    public boolean addOrUpdateProdToOrderDetails_WAITTING(Map<String, String> params, long idOrd, int idPro, String idCUs) {
        return this.orderDetailsRepository.addOrUpdateProdToOrderDetails_WAITTING(params,idOrd,idPro,idCUs);
    }

    @Override
    public boolean updateAmout_Pro(long idDetail, int idProd, int amount) {
        return this.orderDetailsRepository.updateAmout_Pro(idDetail,idProd,amount);
    }

    @Override
    public boolean deletePro(long idDetail, int idProd) {
        return this.orderDetailsRepository.deletePro(idDetail,idProd);
    }

    @Override
    public int countOrderDetails(long idOr) {
        return this.orderDetailsRepository.countOrderDetailsById_Order(idOr);
    }

    @Override
    public long totalOfOrderWatting(long idOr) {
        return this.orderDetailsRepository.totalOfOrderWatting(idOr);
    }

    @Override
    public List<OrderDetails> getOrderDetailsForShopByID_Shop(Map<String, String> params, int page, String idShop) {
        return this.orderDetailsRepository.getOrderDetailsForShopByID_Shop(params,page,idShop);
    }

    @Override
    public int countOrderDetailsForShopById_Order(String idShop) {
        return this.orderDetailsRepository.countOrderDetailsForShopById_Order(idShop);
    }

    @Override
    public List<OrderDetails> getOrderDetailsForShopByID_ShopKW(Map<String, String> params, int page, String idShop) {
        return this.orderDetailsRepository.getOrderDetailsForShopByID_ShopKW(params,page,idShop);
    }

    @Override
    public int countOrderDetailsForShopById_OrderToday(String idShop) {
        return 0;
    }
}
