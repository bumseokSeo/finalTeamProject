package com.campus.myapp;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.MemberService;
import com.campus.myapp.vo.MessageVO;


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
			
			session.setAttribute("logMessage", message);
			
		}
		mav.setViewName("home");
		return mav;
	}
	
	//�븞�씫�� 履쎌� �닔 泥댄겕
	@ResponseBody
	@RequestMapping(value = "/messageReload")
	public int messagesend(HttpSession session) {
		
		
		String username = (String) session.getAttribute("logName");
		
		int message=0;
		
		if(username != null) {
			message = service.messagechk(username);
			
			session.setAttribute("logMessage", message);
			
		}
		return message;
	}
}
