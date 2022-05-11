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
import com.campus.myapp.vo.PagingVO;

@RestController
@RequestMapping("/board/share/")
public class ShareController {
	
	ModelAndView mav = new ModelAndView();
	@Inject
	BoardService service;
	
	//share board list
	@GetMapping("shareList")
	public ModelAndView shareList(PagingVO pvo, BoardVO vo) {
		vo.setBoardtype("share");
		
		pvo.setTotalRecord(service.shareTotalRecord(pvo, vo));
		mav.addObject("list", service.shareSelectList(pvo, vo));
		mav.addObject("pvo", pvo);
		
		mav.setViewName("board/adopt/adoptList");
		return mav;
	}
	
	//share board write 폼
	@GetMapping("shareWrite")
	public ModelAndView shareWrite() {
		mav.setViewName("/board/share/shareWrite");
		return mav;
	}
	
	//게시글작성
	@PostMapping("shareWriteOk")
	public ModelAndView shareWriteOk(BoardVO vo, HttpServletRequest request) {
		vo.setUserid((String)request.getSession().getAttribute("logId"));
		vo.setBoardtype("share");
		
		try {
			int cnt = service.shareInsert(vo);
			mav.addObject("cnt",cnt);
		} catch(Exception e) {
			e.printStackTrace();
		}
		mav.addObject("vo",vo);
		mav.setViewName("board/boardWriteSuccess");
		return mav;
	}
	
	//게시글 보기
	@GetMapping("shareView")
	public ModelAndView shareView() {
		mav.setViewName("board/share/shareView");
		return mav;
	}
}
