package com.tct.service.impl;

import com.tct.pojo.Customers;
import com.tct.repository.CustomerRepository;
import com.tct.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public Customers getCustomersByID_acc(int id) {
        return this.customerRepository.getCustomersByID_acc(id);
    }
}
