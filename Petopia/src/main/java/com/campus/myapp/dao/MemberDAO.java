package com.campus.myapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.MemberVO;

@Mapper
@Repository
public interface MemberDAO {
	
	//로그인
	public MemberVO loginCheck(MemberVO vo);
	
	//회원정보수정 진입
	public MemberVO memberSelect(String userid);
	
}

