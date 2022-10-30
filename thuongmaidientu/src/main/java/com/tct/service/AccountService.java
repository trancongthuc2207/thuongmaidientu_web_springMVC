package com.tct.service;

import com.tct.pojo.Account;

import java.util.List;

public interface AccountService {
    List<Account> getAccountByEmployee();

    boolean updateSTT_Account(int idAcc_role, int idAccUpdate, String stt);
}
