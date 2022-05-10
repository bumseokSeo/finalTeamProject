package com.campus.myapp;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.MemberService;


@RestController
public class HomeController {
	@Inject
	MemberService service;
	
	@GetMapping("/")
	public ModelAndView home(HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		String username = (String) session.getAttribute("logName");
		
		int message=0;
		if(username != null) {
			message = service.messagechk(username);
			if(message>0) {
				session.setAttribute("logMessage", message);
			}
		}
		mav.setViewName("home");
		return mav;
		
	}
	
	

}
