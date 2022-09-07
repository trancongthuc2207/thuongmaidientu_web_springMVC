package com.tct.service.impl;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.tct.pojo.Customers;
import com.tct.repository.CustomerRepository;
import com.tct.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private Cloudinary cloudinary;


    @Override
    public Customers getCustomersByID_acc(int id) {
        return this.customerRepository.getCustomersByID_acc(id);
    }

    @Override
    public boolean updateCustomer(Customers cus) {
        try {
            Map r = this.cloudinary.uploader().upload(cus.getFile().getBytes(),
                    ObjectUtils.asMap("resource_type", "auto"));
            String img = (String) r.get("secure_url");
            cus.setImage(img);
            return this.customerRepository.updateCustomer(cus);
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        return false;
    }
}
