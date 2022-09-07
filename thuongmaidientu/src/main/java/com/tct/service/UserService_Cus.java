/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.service;

import java.util.List;

import com.tct.pojo.Account;
import org.springframework.security.core.userdetails.UserDetailsService;

/**
 *
 * @author ADMIN
 */
public interface UserService_Cus extends UserDetailsService {

    boolean addUser(Account user);

    Account getById(int id);
    Account getByUsername(String username);

    List<Account> getUsers(String username);

    boolean updateUser(Account user);
}
