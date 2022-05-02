package com.campus.myapp.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
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
			
		MemberVO vo = service.memberSelect(userid);
			
		mav.addObject("vo", vo);
		mav.setViewName("member/memberEdit");
		return mav;
	}
	
	//회원정보 수정
	@PostMapping("memberEditOk")
	public ResponseEntity<String> memberEditOk(MemberVO vo, HttpServletRequest request, HttpSession session) {
		// session의 로그인 아이디 확인

		vo.setUserid((String) request.getSession().getAttribute("logId"));
			
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
			
		//String path = "/img/memberimg";
		String path = request.getSession().getServletContext().getRealPath("/img/memberimg");
		
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
				
			List<MultipartFile> files = mr.getFiles("imgName");
				
			if(files != null) {
					
					
					//multipartfile객체
					MultipartFile mf = files.get(0);
					//업로드한 실제 파일명
					String orgFileName = mf.getOriginalFilename();
					
					if(orgFileName != null && !orgFileName.equals("")) {
						File f = new File(path, orgFileName);
							
						if(f.exists()) {
							for(int renameNum=1;;renameNum++) {
									
								int point = orgFileName.lastIndexOf(".");
								String fileName = orgFileName.substring(0, point);//파일명
								String ext = orgFileName.substring(point+1);//확장자
									
								f = new File(path,fileName+" ("+renameNum+")."+ext);//새로운 파일명
								if(!f.exists()) {
									orgFileName = f.getName();
									break;
								}
							}
						}
							
						try {
							mf.transferTo(f);//실제 업로드가 진행
						} catch (Exception ee) {
							ee.printStackTrace();
						}
							
						vo.setProfileimage(orgFileName);
					}
			}
				
			//db등록
			service.memberUpdate(vo);
			session.setAttribute("logImg", vo.getProfileimage());
			//레코드 추가 성공
			String msg = "<script>alert('프로필이 수정되었습니다.'); location.href='/';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			//레코드 추가 실패
			fileDelete(path, vo.getProfileimage());
			String msg = "<script>alert('프로필 수정에 실패하였습니다'); history.back();</script>";

			entity = new ResponseEntity<String>(msg,headers,HttpStatus.BAD_REQUEST);
			}
		return entity;
	}
	//파일 지우기
	public void fileDelete(String p, String f) {
		if(f != null) {//파일명이 존재하면 
			File file = new File(p,f);
			file.delete();
		}
	}
	
	//아이디찾기 진입
	@GetMapping("findId")
	public ModelAndView findId() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/findId");
		return mav;
	}
	
	//비밀번호 초기화 진입
	@GetMapping("resetPwd")
	public ModelAndView resetPwd() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/resetPwd");
		return mav;
	}
}
