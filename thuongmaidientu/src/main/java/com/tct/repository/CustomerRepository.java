package com.tct.repository;


import com.tct.pojo.Customers;

public interface CustomerRepository {
    Customers getCustomersByID_acc(int id);
}
