package com.taskapp.model.persistance;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name="tbluser")
public class User {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String username;
	private String profile;
	private String email;
	private String password;

	public User(String username, String password, String profile, String email) {
		this.username = username;
		this.password = password;
		this.profile = profile;
		this.email = email;
	}
	
}
