package com.voidblog.service;

import com.voidblog.domain.Comment;

import java.util.List;

public interface CommentService {
    List<Comment> allComments(int article_id, int offset , int limit);
    int insertComment(Comment comment);
    int countAllNum();
    boolean delById(Long id);
}
