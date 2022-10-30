package com.tct.service;

import com.tct.pojo.Comment;

import java.util.List;

public interface CommentRatingService {
    List<Comment> getCommentsByIdProduct(int idPro, int page);

    boolean addNewComment(Comment cmt, int idPro, String idCus);

    int getIdCommentMax();
}
