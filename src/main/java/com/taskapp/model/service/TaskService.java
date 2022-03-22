package com.taskapp.model.service;

import java.util.List;

import com.taskapp.model.persistance.Tasks;
import com.taskapp.model.persistance.User;

public interface TaskService {
	public List<Tasks> getAssignedTasks(User user);
	public List<Tasks> getCreatedTasks(User user);
	public List<Tasks> getAllTasks(User user);
	public Tasks getTaskById(int taskId);
	public Tasks addTask(Tasks task);
	public Tasks deleteTask(Tasks task);
	public void updateStatus(String status, int taskId);
	public void changeAssignee(User assignee, int taskId);
}
