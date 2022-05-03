package com.campus.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.BoardService;
import com.campus.myapp.vo.BoardVO;

@RestController
@RequestMapping("/board/share/")
public class ShareController {
	
	@Inject
	BoardService service;
	
	//share board list
	@GetMapping("shareList")
	public ModelAndView shareList(BoardVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/share/shareList");
		return mav;
	}
	
	//share board write 폼
	@GetMapping("shareWrite")
	public ModelAndView shareWrite() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/share/shareWrite");
		return mav;
	}
	
	//게시글작성
	@PostMapping("shareWriteOk")
	public ModelAndView shareWriteOk(BoardVO vo, HttpServletRequest request) {
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		vo.setTitle((String)request.getSession().getAttribute("title"));
		vo.setBoardtype("share");
		
		ModelAndView mav = new ModelAndView();
		try {
			int cnt = service.shareInsert(vo);
			mav.addObject("cnt", cnt);
		} catch(Exception e){
			e.printStackTrace();
		}
		mav.addObject("vo",vo);
		mav.setViewName("board/boardWriteSuccess");
		
		return mav;
	}
}
