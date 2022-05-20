package com.campus.myapp.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
				
		ModelAndView mav = new ModelAndView();
		if (vo2 != null && vo2.getUserlevel() != 3) {// 로그인 성공
			session.setAttribute("logId", vo2.getUserid());
			session.setAttribute("logLevel", vo2.getUserlevel());
			session.setAttribute("logName", vo2.getUsername());
			session.setAttribute("logImg", vo2.getProfileimage());
			session.setAttribute("logTel", vo2.getTel());
			session.setAttribute("logStatus", "Y");
			mav.setViewName("redirect:/");// 홈으로 이동
		} else if (vo2 != null && vo2.getUserlevel() == 3 
				&& format.format(now).compareTo(vo2.getStopend()) <= 0){ // 정지기간
			mav.setViewName("member/loginStop");
		} else if (vo2 != null && vo2.getUserlevel() == 3 
				&& format.format(now).compareTo(vo2.getStopend()) > 0) { // 정지기간 끝
			service.backtoNormal(vo2.getUserid());
			session.setAttribute("logId", vo2.getUserid());
			session.setAttribute("logLevel", vo2.getUserlevel());
			session.setAttribute("logName", vo2.getUsername());
			session.setAttribute("logImg", vo2.getProfileimage());
			session.setAttribute("logTel", vo2.getTel());
			session.setAttribute("logStatus", "Y");
			mav.setViewName("redirect:/");// 홈으로 이동
		} else {// 로그인 실패
			mav.setViewName("member/loginFail");
		}
		return mav;
	}
	
	// 로그아웃
	@GetMapping("/logout")
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
						session.setAttribute("logImg", vo.getProfileimage());
					}
			}
				
			//db등록
			service.memberUpdate(vo);
			
			session.setAttribute("logName", vo.getUsername());
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
	
	// 회원가입: 휴대전화 중복검사&인증
	@GetMapping("telCheck")
	@ResponseBody
	public int telCheck(String tel) {
		return service.memberTelOk(tel);
	}
	@GetMapping("smsCheck")
	@ResponseBody
	public String smsCheck(String tel) {
		
		Random random = new Random();
		String numStr = "";
		for(int i = 0; i < 4; i++) {
			String ran = Integer.toString(random.nextInt(10));
			numStr+=ran;
		}
		
		// System.out.println("수신자 번호 : " + tel);
		// System.out.println("인증번호 : " + numStr);
		service.smsCheckOk(tel, numStr);
		return numStr;
	}
	
	// 회원가입
	@PostMapping("/signUpOk")
	public ModelAndView signUpOk(MemberVO vo) {
		ModelAndView mav = new ModelAndView();
		int cnt = service.memberInsert(vo);
		mav.addObject("cnt", cnt);
		mav.setViewName("member/signUpResult");
		return mav;
	}
		
		
	//아이디찾기 진입
	@GetMapping("findId")
	public ModelAndView findId() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/findId");
		return mav;
	}
	@GetMapping("findIdOk")
	public ModelAndView findIdOk() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/findIdOk");
		return mav;
	}
	
	//비밀번호 초기화 진입
	@GetMapping("resetPwd")
	public ModelAndView resetPwd() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/resetPwd");
		return mav;
	}
	@GetMapping("resetPwdOk")
	public ModelAndView resetPwdOk() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/resetPwdOk");
		return mav;
	}
	
	//아이디 찾기
	@PostMapping("findIdOk")
	public ResponseEntity<String> findIdOk(MemberVO vo, HttpServletRequest request, HttpSession session ) {
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		
		headers.add("Content-Type", "text/html; charset=UTF-8");
		
		String tempUserId = service.findId(vo);
		String KakaoId = service.findKakaoId(vo);
		String msg = "<script>";
		
		if(tempUserId == null) {
			msg+="alert('해당하는 계정이 존재하지 않습니다.');";
			msg += "history.back()";
			msg+="</script>";
		}else if(KakaoId != null){
			msg+="alert('카카오계정으로 가입한 아이디가 있어 바로 로그인할 수 있습니다.');";
			msg += "history.back()";
			msg+="</script>";
		}else {
			
			msg += "location.href='/member/findIdOk'";
			msg += "</script>";
			session.setAttribute("tempUserId", tempUserId);
		}
		
			
		entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);//200

		//entity = new ResponseEntity<String>(msg,headers,HttpStatus.BAD_REQUEST);//200
		
		return entity;
	}
	
	
	
	@RequestMapping(value = "/findpw", method = RequestMethod.POST)
	public void findPwPOST(@ModelAttribute MemberVO member, HttpServletResponse response) throws Exception{
		service.findPw(response, member);
		
	}
	
	// 회원탈퇴
	@GetMapping("memberDelete")
	public ModelAndView memberDelete(MemberVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		service.memberDelete(vo);
		session.invalidate();
		mav.setViewName("redirect:/");
		return mav;
	}
	
	// 카카오로그인
	@GetMapping("kakao")
	@ResponseBody
	public ModelAndView kakaoCallback(@RequestParam String code, HttpSession session, RedirectAttributes attr) {
		ModelAndView mav = new ModelAndView();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date now = new Date();
		
		String access_Token = service.getAccessToken(code);
	    HashMap<String, Object> userInfo = service.getUserInfo(access_Token);
	    // System.out.println("login Controller : " + userInfo);
	    // System.out.println(userInfo.get("useremail"));
	    // System.out.println(userInfo.get("k_id"));
	    
	    MemberVO vo = new MemberVO();
	    vo.setUseremail((String) userInfo.get("useremail"));
	    MemberVO kvo = service.memberByEmail((String) userInfo.get("useremail"));
	    // System.out.println("kvo : " + kvo);
	    MemberVO kakaovo = service.memberByKakaoId((String) userInfo.get("k_id"));
	    // System.out.println("kakaovo : " + kakaovo);
	    
	    if(kvo != null && kakaovo != null && kakaovo.getUserlevel() != 3) { // 로그인 성공
	    	session.setAttribute("logId", kvo.getUserid());
			session.setAttribute("logLevel", kvo.getUserlevel());
			session.setAttribute("logName", kvo.getUsername());
			session.setAttribute("logImg", kvo.getProfileimage());
			session.setAttribute("logTel", kvo.getTel());
			session.setAttribute("logStatus", "Y");
			session.setAttribute("kakao", "Y");
			mav.setViewName("redirect:/");// 홈으로 이동
	    }else if(kvo != null && kakaovo != null && kakaovo.getUserlevel() == 3 
	    		&& format.format(now).compareTo(kakaovo.getStopend()) <= 0) { // 정지기간
	    	mav.setViewName("member/loginStop");
	    }else if(kvo != null && kakaovo != null && kakaovo.getUserlevel() == 3 
	    		&& format.format(now).compareTo(kakaovo.getStopend()) > 0) { // 정지기간 끝
	    	service.backtoNormal(kakaovo.getUserid());
	    	session.setAttribute("logId", kvo.getUserid());
			session.setAttribute("logLevel", kvo.getUserlevel());
			session.setAttribute("logName", kvo.getUsername());
			session.setAttribute("logImg", kvo.getProfileimage());
			session.setAttribute("logTel", kvo.getTel());
			session.setAttribute("logStatus", "Y");
			session.setAttribute("kakao", "Y");
			mav.setViewName("redirect:/");// 홈으로 이동
	    }else if(kvo != null){
	    	// 기존에 등록된 회원이 카카오 로그인 누를때
			mav.setViewName("member/kakaologinfail");// 홈으로 이동
	    }else {
	    	session.setAttribute("k_useremail", (String)userInfo.get("useremail"));
	    	session.setAttribute("k_id", (String)userInfo.get("k_id"));
	    	session.setAttribute("k_profileimage", (String)userInfo.get("profileimage"));
	    	mav.addObject("kakao", "Y");
	    	mav.setViewName("member/signUp");
	    }
	    
	    // System.out.println(session.getAttribute("logStatus"));
	    
		return mav;
	}
}
