package com.tct.service.impl;

import com.tct.pojo.Account;
import com.tct.repository.AccountRepository;
import com.tct.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {
    @Autowired
    private AccountRepository accountRepository;

    @Override
    public List<Account> getAccountByEmployee() {
        return this.accountRepository.getAccountByEmployee();
    }

    @Override
    public boolean updateSTT_Account(int idAcc_role, int idAccUpdate, String stt) {
        return this.accountRepository.updateSTT_Account(idAcc_role, idAccUpdate, stt);
    }
}
