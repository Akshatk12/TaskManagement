package com.taskapp.model.persistance;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "tbltasks")
public class Tasks {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String title;
	private String priority;
	@ManyToOne(cascade = CascadeType.ALL)
	private User owner;
	@ManyToOne(cascade = CascadeType.ALL)
	private User assignee;
	private String status;

	public Tasks(String title, String priority, User owner, User assignee) {
		super();
		this.title = title;
		this.priority = priority;
		this.owner = owner;
		this.status = "To Do";
		this.assignee = assignee;
	}

}
