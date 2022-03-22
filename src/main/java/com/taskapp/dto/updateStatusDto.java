package com.taskapp.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class updateStatusDto {
	private Integer id;
	private String title;
	private String status;
	
	public updateStatusDto(Integer id, String status) {
		this.id =id;
		this.status = status;
	}
}
