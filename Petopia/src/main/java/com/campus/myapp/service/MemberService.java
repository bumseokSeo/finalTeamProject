package com.campus.myapp.service;



import com.campus.myapp.vo.MemberVO;


public interface MemberService {
	public MemberVO loginCheck(MemberVO vo);
	// 회원가입: 아이디 중복검사
	public int memberIdOk(String id);
	// 회원가입: 닉네임 중복검사
	public int memberNameOk(String name);
	// 회원가입: 이메일 중복검사
	public int memberEmailOk(String email);
	// 회원가입
	public int memberInsert(MemberVO vo);
}
