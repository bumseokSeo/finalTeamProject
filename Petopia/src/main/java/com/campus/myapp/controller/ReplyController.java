package com.campus.myapp.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.campus.myapp.service.ReplyService;
import com.campus.myapp.vo.ReplyVO;

@RestController
public class ReplyController {
	@Inject
	ReplyService service;
	
	//댓글 등록
	@RequestMapping(value="/reply/replyWrite", method=RequestMethod.POST)
	public int replyWrite(ReplyVO vo, HttpSession session) {
		System.out.println("댓글등록 시작");
		vo.setUserid((String)session.getAttribute("logId"));
		return service.replyWrite(vo);
	}
	
	//댓글 목록 불러오기
	@RequestMapping("/reply/replyList")
	public List<ReplyVO> replyList(int boardno){
		List<ReplyVO> lst = service.replyList(boardno);
		System.out.println(lst.size());// 댓글 사이즈
		return lst;
	}
	
	
	//댓글 수정하기
	@PostMapping("/reply/replyEditOk")
	public int replyEditOk(ReplyVO vo, HttpSession session){
		vo.setUserid((String)session.getAttribute("logId"));
		return service.replyEdit(vo);
	}
	
	//댓글 삭제
	@GetMapping("/reply/replyDelete")
	public int replyDelete(int replyno, HttpSession session) {
		String userid = (String)session.getAttribute("logId");
		
		return service.replyDel(replyno, userid);
	}
	
}
