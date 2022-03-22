package com.taskapp.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.taskapp.model.exceptions.TaskNotFoundException;
import com.taskapp.model.persistance.Tasks;
import com.taskapp.model.persistance.TasksDao;
import com.taskapp.model.persistance.User;


@Service
@Transactional
public class TaskServiceImpl implements TaskService{

	private TasksDao taskDao;
	
	
	@Autowired
	public TaskServiceImpl(TasksDao taskDao) {
		this.taskDao = taskDao;
	}

	@Override
	public Tasks getTaskById(int taskId) {
		return taskDao.findById(taskId)
				.orElseThrow(()->new TaskNotFoundException("Task Not Found"));
	}

	@Override
	public Tasks addTask(Tasks task) {
		return taskDao.save(task);
	}

	@Override
	public Tasks deleteTask(Tasks task) {
		task.setAssignee(null);
		task.setOwner(null);
		taskDao.delete(task);
		return task;
	}
	
	@Override
	public void updateStatus(String status, int taskId) {
		Tasks updateStatus = taskDao.getById(taskId);
		updateStatus.setStatus(status);
		taskDao.save(updateStatus);
	}

	@Override
	public void changeAssignee(User assignee, int taskId) {
		Tasks changeAssignee = taskDao.getById(taskId);
		changeAssignee.setAssignee(assignee);
		taskDao.save(changeAssignee);
	}

	@Override
	public List<Tasks> getAssignedTasks(User user) {
		return taskDao.findByAssignee(user);
	}

	@Override
	public List<Tasks> getCreatedTasks(User user) {
		return taskDao.findByOwner(user);
	}

	@Override
	public List<Tasks> getAllTasks(User user) {
		List<Tasks> getTasks=new ArrayList<>();
		getTasks.addAll(taskDao.findByAssignee(user));
		getTasks.addAll(taskDao.findByOwner(user));
		 List<Tasks> newList = getTasks.stream()
                 .distinct()
                 .collect(Collectors.toList());
		
				return newList;
	}


	
}
