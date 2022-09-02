/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tct.handlers;
//
//import com.tct.service.UserService_Cus;
import com.tct.pojo.Account;
import com.tct.service.UserService_Cus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collection;


/**
 * @author
 */
@Component
public class LoginHandler implements AuthenticationSuccessHandler {
    @Autowired
    private UserService_Cus userDetailsService;

    private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response, Authentication a) throws IOException, ServletException {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Account user = this.userDetailsService.getByUsername(authentication.getName());
        request.getSession().setAttribute("currentUser", user);
        ////
        boolean hasUserRole = false;
        boolean hasAdminRole = false;
        boolean hasShopRole = false;
        boolean hasEmpployeeRole = false;
        Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
        for (GrantedAuthority grantedAuthority : authorities) {
            if (grantedAuthority.getAuthority().equals("ROLE_USER")) {
                hasUserRole = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
                hasAdminRole = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_SHOP")) {
                hasShopRole = true;
                break;
            } else if (grantedAuthority.getAuthority().equals("ROLE_EMPLOYEE")) {
                hasEmpployeeRole = true;
                break;
            }
        }

        if (hasUserRole) {
            redirectStrategy.sendRedirect(request, response, "/");
        } else if (hasAdminRole) {
            redirectStrategy.sendRedirect(request, response, "/");
        } else if (hasShopRole) {
            redirectStrategy.sendRedirect(request, response, "/shop-manager");
        } else if (hasEmpployeeRole) {
            redirectStrategy.sendRedirect(request, response, "/employee");
        } else {
            throw new IllegalStateException();
        }
    }

}
