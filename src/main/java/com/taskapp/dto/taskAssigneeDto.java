package com.taskapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class taskAssigneeDto {
	private Integer taskId;
	private String title;
	private String assignee_username;

}
