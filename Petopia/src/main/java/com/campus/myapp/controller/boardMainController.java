package com.campus.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class boardMainController {

	
	@GetMapping("/board/SubMenuSelect")
	public ModelAndView SubMenuSelect() {
		ModelAndView mav = new ModelAndView();
		System.out.println("보드 메인컨트롤러 시작");
		
		mav.setViewName("board/SubMenuSelect");
		return mav;
	}
	
	//글쓰기 폼 이동
	@GetMapping("/board/notice/noticeWrite")
	public String noticeWrite() {
		return "/board/notice/noticeWrite";
	}
}

