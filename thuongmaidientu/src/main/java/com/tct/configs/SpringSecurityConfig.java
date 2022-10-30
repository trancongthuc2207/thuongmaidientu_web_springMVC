package com.tct.configs;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;


import com.tct.handlers.LoginHandler;
import com.tct.handlers.LogoutHandler;
import com.tct.handlers.MyAccessDenied;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import java.util.Properties;

@Configuration
@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {
        "com.tct.service",
        "com.tct.repository",
        "com.tct.controllers",
        "com.tct.handlers"
})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private LoginHandler loginHandler;
    @Autowired
    private LogoutHandler logoutHandler;
    @Autowired
    private MyAccessDenied accessDenied;

    @Bean
    public Cloudinary cloudinary() {
        Cloudinary cloudinary
                = new Cloudinary(ObjectUtils.asMap(
                "cloud_name", "thuongmaidientu-tct-vvh",
                "api_key", "136659559425222",
                "api_secret", "-x-xMyh3C8Oaejw8elmQEimSPsY",
                "secure", true));
        return cloudinary;
    }
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    public SpringSecurityConfig() {
        super();
    }

    @Override
    protected void configure(final AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(final HttpSecurity http) throws Exception {
        http.formLogin().usernameParameter("username").passwordParameter("password");

        http.formLogin().successHandler(this.loginHandler);

        http.logout().logoutSuccessHandler(this.logoutHandler);
//
        http.exceptionHandling().accessDeniedHandler(this.accessDenied);

        http.authorizeRequests().antMatchers("/").permitAll()
                .antMatchers("/").hasAnyRole("USER", "ADMIN","SHOP","EMPLOYEE")
                .antMatchers("/user/**").hasAnyRole("USER", "ADMIN","EMPLOYEE")
                .antMatchers("/shop-manager/**").hasAnyRole("SHOP", "ADMIN","EMPLOYEE")
                .antMatchers("/add_pro/**").hasAnyRole("USER")
                .antMatchers("/api/**").hasAnyRole("USER", "ADMIN","SHOP","EMPLOYEE")
                .antMatchers("/employeee/**").hasAnyRole("EMPLOYEE","ADMIN")
//                .anyRequest().authenticated()
                .and().formLogin()
                .loginPage("/login").permitAll().and().logout().permitAll();
        http.csrf().disable();
        http.headers().httpStrictTransportSecurity().disable();
    }

    @Bean
    public JavaMailSender getJavaMailSender(){
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(587);
        mailSender.setUsername("tct.vvh.k19@gmail.com");
        mailSender.setPassword("vdwoimvlanzvkbfy");

        Properties props = new Properties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true");
        props.put("mail.smtp.starttls.required", "true");
        props.put("mail.smtp.ssl.protocols", "TLSv1.2");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

        mailSender.setJavaMailProperties(props);

        return mailSender;
    }
}
