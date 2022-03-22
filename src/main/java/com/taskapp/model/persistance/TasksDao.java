package com.taskapp.model.persistance;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface TasksDao extends JpaRepository<Tasks, Integer>{
	List<Tasks> findByAssignee(User user);
	List<Tasks> findByOwner(User user);

    
}
