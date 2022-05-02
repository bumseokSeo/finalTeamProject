package com.campus.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.MemberService;
import com.campus.myapp.vo.MemberVO;

@RestController
@RequestMapping("/member/")
public class MemberController {
	@Inject
	MemberService service;

	// 로그인페이지로 이동
	@GetMapping("/login")
	public ModelAndView loginPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/login");
		return mav;
	}
	
	// 회원가입페이지로 이동
	@GetMapping("/signUp")
	public ModelAndView signUpPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/signUp");
		return mav;
	}
	
	//로그인 진행
	@PostMapping("/loginOk")
	public ModelAndView loginOk(MemberVO vo, HttpSession session) {
		MemberVO vo2 = service.loginCheck(vo);

		ModelAndView mav = new ModelAndView();
		
		if (vo2 != null) {// 로그인 성공
			session.setAttribute("logId", vo2.getUserid());
			session.setAttribute("logLevel", vo2.getUserlevel());
			session.setAttribute("logName", vo2.getUsername());
			session.setAttribute("logImg", vo2.getProfileimage());
			session.setAttribute("logStatus", "Y");
			mav.setViewName("redirect:/");// 홈으로 이동
		} else {// 로그인 실패
			mav.setViewName("redirect:login");
		}
		return mav;
	}
	
	// 로그아웃
	@GetMapping("logout")
	public ModelAndView logout(HttpSession session) {
		
		session.invalidate();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	//회원정보수정 페이지로 이동
	@GetMapping("memberEdit")
	public ModelAndView memberEdit(HttpSession session) {
		String userid = (String) session.getAttribute("logId");
		ModelAndView mav = new ModelAndView();
			
		//MemberVO vo = service.memberSelect(userid);
			
		//mav.addObject("vo", vo);
		mav.setViewName("member/memberEdit");
		return mav;
	}
}
