package com.tct.repository;

import com.tct.pojo.Account;

import java.util.List;

public interface AccountRepository {
    List<Account> getAccountByEmployee();

    boolean updateSTT_Account(int idAcc_role, int idAccUpdate, String stt);


}
