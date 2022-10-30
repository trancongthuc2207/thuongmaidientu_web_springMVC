package com.tct.repository;


import com.tct.pojo.Customers;

import java.util.List;

public interface CustomerRepository {
    Customers getCustomersByID_acc(int id);

    boolean updateCustomer(Customers cus);

    boolean checkInfor2Order(Customers cus);

    Customers getCustomerByIDCus(String idCus);

    boolean checkCanComment(String idCus, int idPro);

    List<Customers> getCustomersByEmployee(String kw,int page);

    int countCustomerByEmployee(String kw);
}
