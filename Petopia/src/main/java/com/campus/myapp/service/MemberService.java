package com.campus.myapp.service;

<<<<<<< HEAD
=======


import javax.servlet.http.HttpServletResponse;

>>>>>>> refs/heads/bumseok
import com.campus.myapp.vo.MemberVO;

public interface MemberService {
	public MemberVO loginCheck(MemberVO vo);
	public MemberVO memberSelect(String userid);
	public int memberUpdate(MemberVO vo);
	public int memberIdOk(String id);
	public int memberNameOk(String name);
	public int memberEmailOk(String email);
	public int memberTelOk(String tel);
	public void smsCheckOk(String tel, String numStr);
	public int memberInsert(MemberVO vo);
	public String findId(MemberVO vo);
	
	//이메일발송
	public void sendEmail(MemberVO vo, String div) throws Exception;

	//비밀번호찾기
	public void findPw(HttpServletResponse resp, MemberVO vo) throws Exception;

	// 비밀번호 변경
	public int updatePw(MemberVO vo) throws Exception;
	
	//해당 계정의 정보 전부 조회
	public MemberVO readMember(String userid);
}
