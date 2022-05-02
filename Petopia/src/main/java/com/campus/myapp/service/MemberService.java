package com.campus.myapp.service;



import com.campus.myapp.vo.MemberVO;


public interface MemberService {
	public MemberVO loginCheck(MemberVO vo);
	public MemberVO memberSelect(String userid);
}
