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
	// 회원가입: 휴대전화 인증
	public int memberTelOk(String tel);
	// 회원가입
	public int memberInsert(MemberVO vo);
	
	//회원정보수정 진입
	public MemberVO memberSelect(String userid);
	
	//회원정보수정
	public int memberUpdate(MemberVO vo);
	
	//아이디 찾기
	public String findId(MemberVO vo);
		
	// 비밀번호 변경
	public int updatePw(MemberVO vo) throws Exception;
		
	//해당 계정의 정보 조회
	public MemberVO readMember(String userid);
	
	// 회원탈퇴
	public int memberDelete(MemberVO vo);
	
	public MemberVO memberByEmail(String useremail);
	public MemberVO memberByKakaoId(String k_id);
	
}

