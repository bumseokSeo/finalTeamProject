package com.campus.myapp.service;

import java.util.HashMap;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.campus.myapp.dao.MemberDAO;
import com.campus.myapp.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Service
public class MemberServiceImpl implements MemberService {
	@Inject
	MemberDAO dao;

	@Override
	public MemberVO loginCheck(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.loginCheck(vo);
	}

	@Override
	public MemberVO memberSelect(String userid) {
		// TODO Auto-generated method stub
		return dao.memberSelect(userid);
	}

	@Override
	public int memberUpdate(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.memberUpdate(vo);
	}
	
	@Override
	public int memberIdOk(String id) {
		return dao.memberIdOk(id);
	}

	@Override
	public int memberNameOk(String name) {
		return dao.memberNameOk(name);
	}

	@Override
	public int memberEmailOk(String email) {
		return dao.memberEmailOk(email);
	}

	@Override
	public int memberInsert(MemberVO vo) {
		return dao.memberInsert(vo);
	}

	@Override
	public int memberTelOk(String tel) {
		return dao.memberTelOk(tel);
	}

	@Override
	public void smsCheckOk(String tel, String numStr)  {
		
		String api_key = "NCSC9AFRRPOPNXPX";
		String api_secret = "JN5HV6JCETIXJW1VHMQRIOQOJWZQV3DE";
		Message coolsms = new Message(api_key, api_secret);
		
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", tel);
		params.put("from", "010-2826-4294");
		params.put("type", "SMS");
		params.put("text", "[펫토피아]에서보낸 인증번호 [" + numStr + "] 입니다.");
		params.put("app_version", "test app 1.2");
		
		try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
	}
	
	
}
