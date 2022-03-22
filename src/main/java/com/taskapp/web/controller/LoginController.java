package com.taskapp.web.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.taskapp.dto.DtoUtil;
import com.taskapp.dto.UserDto;
import com.taskapp.model.persistance.User;
import com.taskapp.model.service.UserService;

@Controller
public class LoginController {
	
	@Autowired
	private UserService userService;


	@GetMapping(path = "login")
	public String appLogin() {
		return "login";
	}
	
	@GetMapping(path = "accessdenied")
	public ModelAndView accessdenied(Principal principal, ModelAndView mv) {
		mv.addObject("username", principal.getName());
		mv.setViewName("403");
		return mv;
	}
	@GetMapping("/logout")
	public String logout()
	{
		return "login";
	}
	
	@GetMapping(path = "adduser")
	public ModelAndView addUserGet(Principal principal, ModelAndView mv) {
		mv.setViewName("userlogin");
		mv.addObject("userDto", new UserDto());
		User user = userService.getUserByUsername(principal.getName());
        mv.addObject("user", user);
		return mv;
	}
	@PostMapping(path = "adduser")
	public String addUserPost(@ModelAttribute UserDto userDto, Model model) {
		userService.AddUser(DtoUtil.convertToUser(userDto));
		model.addAttribute("success", "Registration Successfull");
		return "redirect:home?success=Registration Successfull! ";
	}
}
