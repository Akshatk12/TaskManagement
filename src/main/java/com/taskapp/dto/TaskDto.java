package com.taskapp.dto;

import java.util.Date;

import com.taskapp.model.persistance.User;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TaskDto {
	private String title;
	private String priority;
	private String assignee_username;
	
}