package com.taskapp.model.persistance;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserDao extends JpaRepository<User, Integer>{
	public User findByUsername(String username);
	public Boolean existsByUsername(String username);
}
