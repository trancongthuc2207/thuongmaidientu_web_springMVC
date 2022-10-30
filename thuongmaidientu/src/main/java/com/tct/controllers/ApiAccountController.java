package com.tct.controllers;

import com.tct.pojo.Comment;
import com.tct.repository.AccountRepository;
import com.tct.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

@RestController
@RequestMapping("/api")
public class ApiAccountController {
    @Autowired
    private AccountService accountService;

    @PostMapping(path = "/update-stt-account" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment> updateAccountStt(@RequestBody Map<String,String> params){
        int iđRole = Integer.parseInt(params.get("id_Role"));
        int iđUpdate = Integer.parseInt(params.get("id_Update"));
        String stt = params.get("Stt");

        if(this.accountService.updateSTT_Account(iđRole,iđUpdate,stt))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

}
