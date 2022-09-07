/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tct.service.impl;

import com.tct.pojo.Account;
import com.tct.repository.UserRepository_Cus;
import org.springframework.stereotype.Service;
import com.tct.service.UserService_Cus;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author ADMIN
 */
@Service("userDetailsService")
public class UserService_CusImpl implements UserService_Cus {
    @Autowired
    private UserRepository_Cus userRepository;
//    @Autowired
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    @Transactional
    public boolean addUser(Account user) {
        user.setIdAccount(this.userRepository.getID_max()+1);
        String pass = user.getPasswordC();
        user.setPasswordC(this.bCryptPasswordEncoder.encode(pass));
        return this.userRepository.addUser(user);
    }

    @Override
    public Account getById(int id) {
        return this.userRepository.getById(id);
    }

    @Override
    public Account getByUsername(String username) {
        return this.userRepository.getByUsername(username);
    }

    @Override
    public List<Account> getUsers(String username) {
        return this.userRepository.getUsers(username);
    }

    @Override
    public boolean updateUser(Account user) {
        String pass = user.getPasswordC();
        user.setPasswordC(this.bCryptPasswordEncoder.encode(pass));
        return this.userRepository.updateUser(user);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<Account> accounts = this.userRepository.getUsers(username);
        if (accounts.isEmpty())
            throw new UsernameNotFoundException("User does not exist!!!");

        Account account = accounts.get(0);

        List<SimpleGrantedAuthority> auth = Arrays.asList(new SimpleGrantedAuthority(account.getIdPos().getNamePosition()));

        UserDetails user = new User(account.getUsernameC(), account.getPasswordC(), auth);
        return user;
    }


}
