package com.campus.myapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.MemberVO;

@Mapper
@Repository
public interface MemberDAO {
	
	//로그인
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

