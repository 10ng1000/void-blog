package com.voidblog.service.impl;

import com.voidblog.dao.CommentDao;
import com.voidblog.domain.Comment;
import com.voidblog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    public CommentDao commentDao;
    public List<Comment> allComments(int article_id, int offset, int limit) {
        return commentDao.queryAll(article_id,offset,limit);
    }

    public int insertComment(Comment comment) {
        return commentDao.insert(comment);
    }

    public int countAllNum() {
        return commentDao.countAllNum();
    }

    public boolean delById(Long id) {
        return commentDao.deleteByPrimaryKey(id)>0;
    }
}
