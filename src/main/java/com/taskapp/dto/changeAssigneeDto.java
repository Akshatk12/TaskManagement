package com.taskapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class changeAssigneeDto {
	private String assignee_username;
	private Integer taskId;
}

