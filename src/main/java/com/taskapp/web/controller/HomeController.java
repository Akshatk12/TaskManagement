package com.taskapp.web.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.taskapp.dto.ChangePasswordDto;
import com.taskapp.model.persistance.Tasks;
import com.taskapp.model.persistance.User;
import com.taskapp.model.service.TaskService;
import com.taskapp.model.service.UserService;

@Controller
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private TaskService taskService;

	
	@GetMapping("/home")
	public String home(Principal principal, Model model ) {
		User user = userService.getUserByUsername(principal.getName());
		List<Tasks> listAssignedTasks = taskService.getAssignedTasks(user);
		model.addAttribute("listAssignedTasks",listAssignedTasks);
        model.addAttribute("user", user);
		return "home";
	}

	@GetMapping(path = "changepwd")
	public ModelAndView changepasswordGet(ModelAndView mv, Principal principal) {
		mv.setViewName("changePassword");
		mv.addObject("changePassword", new ChangePasswordDto());
        User user = userService.getUserByUsername(principal.getName());
        mv.addObject("user", user);

		return mv;
	}
	@PostMapping(path = "changepwd")
	public String changepasswordPost(@ModelAttribute ChangePasswordDto changePasswordDto, Principal principal) {

		User user = userService.getUserByUsername(principal.getName());
		if(!changePasswordDto.getConfirmPassword().matches(changePasswordDto.getNewPassword())) {
			return "redirect:changepwd?error=Password Don't Match";
		}
		else if(!userService.validatePassword(changePasswordDto.getCurrPassword(), user)) {
			return "redirect:changepwd?error=Incorrect Current Password";
		}
		else {
			userService.changePassword(user, changePasswordDto.getNewPassword());
			return "redirect:changepwd?success=Password Changed Successfully!";
		}
	}
}
