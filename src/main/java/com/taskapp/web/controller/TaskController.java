package com.taskapp.web.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.taskapp.dto.DtoUtil;
import com.taskapp.dto.TaskDto;
import com.taskapp.dto.changeAssigneeDto;
import com.taskapp.dto.updateStatusDto;
import com.taskapp.model.persistance.Tasks;
import com.taskapp.model.persistance.User;
import com.taskapp.model.service.TaskService;
import com.taskapp.model.service.UserService;

@Controller
@RequestMapping(path = "tasks")
public class TaskController {
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private UserService userService;
	
	
	@GetMapping(path = "updateStatus")
	public ModelAndView updateStatusGet(Principal principal, ModelAndView mv) {
		mv.addObject("updateStatusDto", new updateStatusDto());
		mv.setViewName("updatestatus");
		User user = userService.getUserByUsername(principal.getName());
        mv.addObject("user", user);
		return mv;
	}
	@PostMapping(path="updateStatus")
	public String updateStatus(@ModelAttribute updateStatusDto updateStatus) {
		taskService.updateStatus(updateStatus.getStatus(), updateStatus.getId());
		return "redirect:/home?success=status updated";
	}
	
	@GetMapping(path = "addtask")
	public ModelAndView addUserGet(Principal principal ,ModelAndView mv) {
		mv.setViewName("addtask");
		mv.addObject("taskDto", new TaskDto());
		User user = userService.getUserByUsername(principal.getName());
        mv.addObject("user", user);
		return mv;
	}
	@PostMapping(path = "addtask")
	public String addTask(@ModelAttribute TaskDto taskDto, Principal principal) {
		User owner = userService.getUserByUsername(principal.getName());

		if(taskDto.getAssignee_username().isEmpty()) {
			taskService.addTask(DtoUtil.convertToTask(taskDto,owner,null));
			return "redirect:/home?success=Task Added";
		}
		else if(!userService.checkUsername(taskDto.getAssignee_username())) {
			return "redirect:/tasks/addtask?error=Username not found";
		}
		else {
		User assignee = userService.getUserByUsername(taskDto.getAssignee_username());
			if(owner.getProfile().matches("ROLE_MGR")) {
				taskService.addTask(DtoUtil.convertToTask(taskDto,owner,assignee));
				return "redirect:/home?success=Task Added";
			}
			else {
				if(owner.getUsername().matches(assignee.getUsername())) {
					taskService.addTask(DtoUtil.convertToTask(taskDto,owner,assignee));
					return "redirect:/home?success=Task Added";
				}
				else return "redirect:/tasks/addtask?error=You aren't authorized to Assign Tasks to others";
			}
		
		}
	}
	
	
	@GetMapping(path = "changeAssignee")
	public ModelAndView changeAssigneeGet(@RequestParam("id") Integer taskId, ModelAndView mv, Principal principal) {
		Tasks task = taskService.getTaskById(taskId);
		mv.addObject("currentAssignee", task.getAssignee().getUsername());
		mv.addObject("changeAssigneeDto", new changeAssigneeDto());
		User user = userService.getUserByUsername(principal.getName());
        mv.addObject("user", user);
		mv.setViewName("changeAssignee");
		return mv;
	}
	@PostMapping(path="changeAssignee")
	public String changeAssignee(@ModelAttribute changeAssigneeDto changeAssignee) {
		if(!userService.checkUsername(changeAssignee.getAssignee_username())) {
			return "redirect:/tasks/changeAssignee?id="+changeAssignee.getTaskId()+"&error=Username not found";
		}
		User assignee = userService.getUserByUsername(changeAssignee.getAssignee_username());
		taskService.changeAssignee(assignee, changeAssignee.getTaskId());
		return "redirect:/tasks/getCreatedTasks?success=assignee changed";
	}
	@GetMapping(path="viewAllTasks")
	public ModelAndView getAssignedTasks(ModelAndView mv, Principal principal) {
		User user = userService.getUserByUsername(principal.getName());
		List<Tasks> listAssignedTasks = taskService.getAllTasks(user);
		mv.setViewName("viewAllTasks");
		mv.addObject("listTasks",listAssignedTasks);
		mv.addObject("user", user);
		return mv;
	}
	
	@GetMapping(path="getCreatedTasks")
	public ModelAndView getCreatedTasks(ModelAndView mv, Principal principal) {
		User user = userService.getUserByUsername(principal.getName());
		List<Tasks> listCreatedTasks = taskService.getCreatedTasks(user);
		mv.addObject("listCreatedTasks", listCreatedTasks);
		mv.addObject("user", user);
		mv.setViewName("createdTasks");
		return mv;
	}
	@GetMapping(path="deleteTask")
	public String deleteTask(@RequestParam("id") Integer taskId, Principal principal) {
		Tasks task = taskService.getTaskById(taskId);
		taskService.deleteTask(task);
		return "redirect:/tasks/getCreatedTasks?success=Task Deleted";
	}
	


}
