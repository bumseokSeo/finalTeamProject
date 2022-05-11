package com.campus.myapp.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.BoardService;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;

@Controller
public class AdoptController {
	ModelAndView mav = new ModelAndView();
	
	@Inject
	BoardService service;
	
	@GetMapping("/board/adopt/adoptList")
	public ModelAndView AdoptListView(PagingVO pvo, BoardVO bvo) {
		mav.addObject("adoptList", service.BoardSelectList(bvo, "adopt",pvo));
		
		pvo.setTotalRecord(service.BoardtotalRecord(pvo, "adopt"));
		mav.addObject("pvo",pvo);
		
		mav.setViewName("board/adopt/adoptList");
		return mav;
	}
	
	@GetMapping("/board/adopt/adoptWrite")
	public String noticeWrite() {
		return "/board/adopt/adoptWrite";
	}
	
	

}

