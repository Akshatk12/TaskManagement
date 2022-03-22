package com.taskapp;

import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import com.taskapp.model.persistance.User;
import com.taskapp.model.service.UserService;

//import com.taskapp.model.persitance.Account;
//import com.taskapp.model.persitance.User;
//import com.taskapp.model.service.AccountService;
//import com.taskapp.model.service.UserService;

@SpringBootApplication
public class TaskappApplication implements CommandLineRunner{

//	@Autowired
//	private AccountService accountService;
	
	@Autowired
	private UserService userService;
//	
	
	public static void main(String[] args) {
		SpringApplication.run(TaskappApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
//userService.AddUser(new User("akshat", "1234", "ROLE_MGR", "akshat@gmail.com"));		
	}

}
