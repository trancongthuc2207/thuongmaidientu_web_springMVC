package com.tct.service;

import java.util.List;
import java.util.Map;

public interface EmployeeService {
    List<Object[]> getFullIn4Shop(Map<String, String> params, int page);

    int countShopActive();
}
