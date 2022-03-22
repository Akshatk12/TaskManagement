package com.taskapp.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.taskapp.model.persistance.User;
import com.taskapp.model.persistance.UserDao;

@Service
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private PasswordEncoder bCryptPasswordEncoder;
	
	
	private UserDao userDao;
	
	@Autowired
	public UserServiceImpl(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void AddUser(User user) {
		user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
		userDao.save(user);
	}
	
	@Override
	public void changePassword(User user, String password) {
		user.setPassword(bCryptPasswordEncoder.encode(password));
		userDao.save(user);
	}

	@Override
	public User getUserByUsername(String username) {
		return userDao.findByUsername(username);
	}

	@Override
	public Boolean validatePassword(String Password, User user) {
		return bCryptPasswordEncoder.matches(Password, user.getPassword());
	}



	@Override
	public Boolean checkUsername(String username) {
		return userDao.existsByUsername(username);
	}

}
