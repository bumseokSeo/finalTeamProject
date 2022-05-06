package com.campus.myapp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/board/adopt/")
public class AdoptController {
	
	ModelAndView mav = new ModelAndView();
	
	//입양 글 리스트
	@GetMapping("adoptList")
	public ModelAndView adoptList() {
		mav.setViewName("/board/adopt/adoptList");
		
		return mav;
	}
	
	//입양 글 작성
	@GetMapping("adoptWrite")
	public ModelAndView adoptWrite() {
		mav.setViewName("/board/adopt/adoptWrite");
		return mav;
	}
	
	//입양 게시글 보기
	@GetMapping("adoptView")
	public ModelAndView adoptView() {
		mav.setViewName("/board/adopt/adoptView");
		return mav;
	}
}
