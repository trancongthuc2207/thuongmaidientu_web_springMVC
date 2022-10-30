package com.tct.service.impl;

import com.tct.repository.EmployeeRepository;
import com.tct.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    private EmployeeRepository employeeRepository;

    @Override
    public List<Object[]> getFullIn4Shop(Map<String, String> params, int page) {
        return this.employeeRepository.getFullIn4Shop(params,page);
    }

    @Override
    public int countShopActive() {
        return this.employeeRepository.countShopActive();
    }
}
