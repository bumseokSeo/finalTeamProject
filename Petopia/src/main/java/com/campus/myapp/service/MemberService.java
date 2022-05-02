package com.campus.myapp.service;



import com.campus.myapp.vo.MemberVO;


public interface MemberService {
	public MemberVO loginCheck(MemberVO vo);
	public MemberVO memberSelect(String userid);
	public int memberUpdate(MemberVO vo);
	public int memberIdOk(String id);
	public int memberNameOk(String name);
	public int memberEmailOk(String email);
	public int memberInsert(MemberVO vo);
}
