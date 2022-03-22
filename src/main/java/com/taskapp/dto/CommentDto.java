package com.taskapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CommentDto {
	private Integer taskId;
	private String username;
	private String comment;
	public CommentDto(Integer taskId) {
		super();
		this.taskId = taskId;
	}
	public CommentDto(String username, String comment) {
		super();
		this.username = username;
		this.comment = comment;
	}
	public CommentDto(Integer taskId, String comment) {
		super();
		this.taskId = taskId;
		this.comment = comment;
	}
	
	
}