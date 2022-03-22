package com.taskapp.model.service;

import java.util.List;

import com.taskapp.model.persistance.Comment;
import com.taskapp.model.persistance.Tasks;

public interface CommentService {
	public List<Comment> getAllCommentsById(Tasks task);
	public Comment addComment(Comment comment);
}
