package com.taskapp.web.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.taskapp.dto.CommentDto;
import com.taskapp.dto.DtoUtil;
import com.taskapp.model.persistance.Comment;
import com.taskapp.model.persistance.Tasks;
import com.taskapp.model.persistance.User;
import com.taskapp.model.service.CommentService;
import com.taskapp.model.service.TaskService;
import com.taskapp.model.service.UserService;

@Controller
@RequestMapping(path = "comment")
public class CommentController {
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private TaskService taskService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping(path = "addcomment")
	public ModelAndView addCommentGet(@RequestParam("id") Integer taskId, ModelAndView mv, Principal principal) {
		Tasks task = taskService.getTaskById(taskId);
		List<Comment> commentsList = commentService.getAllCommentsById(task);
		List<CommentDto> res = new ArrayList<CommentDto>();
		for(Comment comment : commentsList) {
			res.add(new CommentDto(comment.getUser().getUsername(),comment.getComment()));
		}
		User user = userService.getUserByUsername(principal.getName());
        mv.addObject("user", user);
		mv.addObject("comments", res);
		mv.addObject("commentDto", new CommentDto());
		mv.setViewName("comment");

		return mv;
	}
	@PostMapping(path = "addcomment")
	public String addCommentPost(@ModelAttribute CommentDto commentDto, Principal principal) {
		User user = userService.getUserByUsername(principal.getName());
		Tasks task = taskService.getTaskById(commentDto.getTaskId());
		commentService.addComment(DtoUtil.convertToComment(commentDto,user,task));
		return "redirect:/comment/addcomment?id="+commentDto.getTaskId()+"&success=Comment Added";
	}
	
}
