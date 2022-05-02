package com.campus.myapp.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// 회원가입: 아이디 중복검사
	@GetMapping("idCheck")
	@ResponseBody
	public int idCheck(String id) {
		return service.memberIdOk(id);
	}
	
	// 회원가입: 닉네임 중복검사
	@GetMapping("nameCheck")
	@ResponseBody
	public int nameCheck(String name) {
		return service.memberNameOk(name);
	}
	
	// 회원가입: 이메일 중복검사
	@GetMapping("emailCheck")
	@ResponseBody
	public int emailCheck(String email) {
		return service.memberEmailOk(email);
	}
	
	// 회원가입
	@PostMapping("/signUpOk")
	public ModelAndView signUpOk(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		service.memberInsert(vo);
		mav.setViewName("redirect:/");
		return mav;
	}
}
