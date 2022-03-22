package com.taskapp.model.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskapp.model.persistance.Comment;
import com.taskapp.model.persistance.CommentDao;
import com.taskapp.model.persistance.Tasks;

@Service
@Transactional
public class CommentServiceImpl implements CommentService{

	private CommentDao commentDao;
	
	
	@Autowired
	public CommentServiceImpl(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	@Override
	public List<Comment> getAllCommentsById(Tasks task) {
		return commentDao.findByTask(task);
	}

	@Override
	public Comment addComment(Comment comment) {
		return commentDao.save(comment);
	}


}
