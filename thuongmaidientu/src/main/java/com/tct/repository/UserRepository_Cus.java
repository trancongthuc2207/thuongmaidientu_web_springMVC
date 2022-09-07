/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.repository;

import com.tct.pojo.Account;

import java.util.List;


/**
 * @author ADMIN
 */
public interface UserRepository_Cus {
    boolean addUser(Account user);

    Account getById(int id);

    Account getByUsername(String username);

    List<Account> getUsers(String username);

    int getID_max();

    boolean updateUser(Account user);
}
