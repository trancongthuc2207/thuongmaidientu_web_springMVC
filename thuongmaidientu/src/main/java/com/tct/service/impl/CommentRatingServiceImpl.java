package com.tct.service.impl;

import com.tct.pojo.Comment;
import com.tct.repository.CommentRatingRepository;
import com.tct.service.CommentRatingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentRatingServiceImpl implements CommentRatingService {
    @Autowired
    private CommentRatingRepository commentRatingRepository;


    @Override
    public List<Comment> getCommentsByIdProduct(int idPro, int page) {
        return this.commentRatingRepository.getCommentsByIdProduct(idPro,page);
    }

    @Override
    public boolean addNewComment(Comment cmt, int idPro, String idCus) {
        return this.commentRatingRepository.addNewComment(cmt, idPro, idCus);
    }

    @Override
    public int getIdCommentMax() {
        return this.commentRatingRepository.getIdCommentMax();
    }
}
