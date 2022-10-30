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
    public int countOrderDetailsForShopById_Order(String idShop,String stt) {
        return this.orderDetailsRepository.countOrderDetailsForShopById_Order(idShop,stt);
    }

    @Override
    public List<OrderDetails> getOrderDetailsForShopByID_ShopKW(Map<String, String> params, int page, String idShop) {
        return this.orderDetailsRepository.getOrderDetailsForShopByID_ShopKW(params,page,idShop);
    }

    @Override
    public int countOrderDetailsForShopById_OrderToday(String idShop) {
        return 0;
    }

    @Override
    public boolean updateSTTAccept_OrderDetailsShopByID_Ord_ID_Pro(long idDetail, int idPro) {
        return this.orderDetailsRepository.updateSTTAccept_OrderDetailsShopByID_Ord_ID_Pro(idDetail,idPro);
    }

    @Override
    public List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW(Map<String, String> params, int page, String idShop) {
        return this.orderDetailsRepository.getIs_Accepted_OrderDetailsForShopByID_ShopKW(params,page,idShop);
    }

    @Override
    public List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW_Today(Map<String, String> params, int page, String idShop) {
        return this.orderDetailsRepository.getIs_Accepted_OrderDetailsForShopByID_ShopKW_Today(params,page,idShop);
    }

    @Override
    public List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW_Yesterday(Map<String, String> params, int page, String idShop) {
        return this.orderDetailsRepository.getIs_Accepted_OrderDetailsForShopByID_ShopKW_Yesterday(params,page,idShop);
    }

    @Override
    public List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW_MoreDay(Map<String, String> params, int page, String idShop) {
        return this.orderDetailsRepository.getIs_Accepted_OrderDetailsForShopByID_ShopKW_MoreDay(params,page,idShop);
    }

    @Override
    public List<OrderDetails> getIs_Accepted_OrderDetailsForShopByID_ShopKW_All(Map<String, String> params, int page, String idShop) {
        return this.orderDetailsRepository.getIs_Accepted_OrderDetailsForShopByID_ShopKW_All(params,page,idShop);
    }

    @Override
    public List<OrderDetails> getOrderDetails(Map<String, String> params, int page) {
        return this.orderDetailsRepository.getOrderDetails(params,page);
    }

    @Override
    public List<OrderDetails> getOrderDetailsForShopByID_ShopKW_Today(Map<String, String> params, int page, String idShop) {
        return this.orderDetailsRepository.getOrderDetailsForShopByID_ShopKW_Today(params,page,idShop);
    }

    @Override
    public List<OrderDetails> getOrderDetailsForShopByID_ShopKW_Yesterday(Map<String, String> params, int page, String idShop) {
        return this.orderDetailsRepository.getOrderDetailsForShopByID_ShopKW_Yesterday(params,page,idShop);
    }

    @Override
    public List<OrderDetails> getOrderDetailsForShopByID_ShopKW_MoreDay(Map<String, String> params, int page, String idShop) {
        return this.orderDetailsRepository.getOrderDetailsForShopByID_ShopKW_MoreDay(params,page,idShop);
    }

    @Override
    public List<OrderDetails> getOrderDetailsForShopByID_ShopKW_All(Map<String, String> params, int page, String idShop) {
        return this.orderDetailsRepository.getOrderDetailsForShopByID_ShopKW_All(params,page,idShop);
    }

    @Override
    public int countNotConfirmOrderDetailsForShopById_Order(String idShop) {
        return this.orderDetailsRepository.countNotConfirmOrderDetailsForShopById_Order(idShop);
    }

    @Override
    public int countProductInOrderWaitting(long idDetail) {
        return this.orderDetailsRepository.countProductInOrderWaitting(idDetail);
    }

    @Override
    public boolean updateOrderIdPaying(long idWait, String idSh, long idOrdN) {
        return this.orderDetailsRepository.updateOrderIdPaying(idWait,idSh,idOrdN);
    }

    @Override
    public long totalOfOrderPerShop(long idOr, String idS) {
        return this.orderDetailsRepository.totalOfOrderPerShop(idOr,idS);
    }

    @Override
    public List<String> listIDOrderToStringByIdShop(String idS, String stt, String kw_time, int page) {
        return this.orderDetailsRepository.listIDOrderToStringByIdShop(idS,stt,kw_time,page);
    }

    @Override
    public boolean updateSTTAccept_OrderDetailsShopByID_Ord(long idDetail) {
        return this.orderDetailsRepository.updateSTTAccept_OrderDetailsShopByID_Ord(idDetail);
    }

    @Override
    public List<OrderDetails> getOrderDetailsByIDCustomer_SttOrder(String idCus, String stt) {
        return this.orderDetailsRepository.getOrderDetailsByIDCustomer_SttOrder(idCus, stt);
    }

    @Override
    public boolean updateSTTCancle_OrderDetailsShopByID_Ord(long idDetail, String reason, String from) {
        return this.orderDetailsRepository.updateSTTCancle_OrderDetailsShopByID_Ord(idDetail, reason, from);
    }
}
