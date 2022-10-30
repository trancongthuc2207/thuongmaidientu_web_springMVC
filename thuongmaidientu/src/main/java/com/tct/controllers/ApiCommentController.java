package com.tct.controllers;

import com.tct.pojo.Comment;
import com.tct.pojo.Product;
import com.tct.service.CommentRatingService;
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
public class ApiCommentController {
    @Autowired
    private CommentRatingService commentRatingService;

    @PostMapping(path = "/add-comment" , produces = {
            MediaType.APPLICATION_JSON_VALUE
    })
    public ResponseEntity<Comment> addComment(@RequestBody Map<String,String> params){
        int idCmt = Integer.parseInt(params.get("id_cmt"));
        int idPro = Integer.parseInt(params.get("id_pro"));
        String idCus = params.get("id_cus");
        String content = params.get("content");
        int rate = Integer.parseInt(params.get("rate"));
        Comment cmt = new Comment();
        cmt.setIdComment(idCmt);
        cmt.setContent(content);
        cmt.setRate(rate);
        if(this.commentRatingService.addNewComment(cmt,idPro,idCus))
            return new ResponseEntity<>(HttpStatus.OK);
        return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }
}
