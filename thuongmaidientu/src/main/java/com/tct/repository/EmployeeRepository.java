package com.tct.repository;

import java.util.List;
import java.util.Map;

public interface EmployeeRepository {
    List<Object[]> getFullIn4Shop(Map<String, String> params, int page);

    int countShopActive();
}
