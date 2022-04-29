package com.campus.myapp.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/board/share/")
public class ShareController {
	
	@GetMapping("shareList")
	public ModelAndView shareList() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/share/shareList");
		return mav;
	}
}
