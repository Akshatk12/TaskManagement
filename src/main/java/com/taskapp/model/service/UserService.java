package com.taskapp.model.service;

import java.util.List;

import com.taskapp.model.persistance.User;

public interface UserService {
	public void AddUser(User user);
	public User getUserByUsername(String username);
	public Boolean validatePassword(String Password, User user);
	public void changePassword(User user, String password);
	public Boolean checkUsername(String username);
}
