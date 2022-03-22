package com.taskapp.dto;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;

import com.taskapp.model.persistance.Comment;
import com.taskapp.model.persistance.Tasks;
import com.taskapp.model.persistance.User;
import com.taskapp.model.service.UserService;

public class DtoUtil {

	@Autowired
	private UserService userService;
	
	public static User convertToUser(UserDto userDto) {
		User user=new User();
		user.setUsername(userDto.getUsername());
		user.setPassword(userDto.getPassword());
		user.setProfile(userDto.getProfile());
		user.setEmail(userDto.getEmail());
		return user;
	}
	public static Tasks convertToTask(TaskDto taskDto, User owner, User assignee) {
		return new Tasks(taskDto.getTitle(), taskDto.getPriority(), owner, assignee);
	}
	public static Comment convertToComment(CommentDto commentDto, User user, Tasks task) {
		return new Comment(user, commentDto.getComment(),  task);
	}
	
}
