package com.campus.myapp.service;


import java.util.HashMap;
import javax.inject.Inject;
import java.io.PrintWriter;



import org.json.simple.JSONObject;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.mail.HtmlEmail;
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
            // System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
	public String findId(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.findId(vo);
	}
	
	
	
	
	
	
	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "titia914@gmail.com";
		String hostSMTPpwd = "3436695g!!";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "titia914@gmail.com";
		String fromName = "펫토피아";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "펫토피아 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: orange;'>";
			msg += vo.getUserid() + "님의 임시 비밀번호 입니다.</h3>";
			msg += "<h3 style='color: orange;'>비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getUserpwd() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getUseremail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	@Override
	public void findPw(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberVO ck = dao.readMember(vo.getUserid());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(dao.memberIdOk(vo.getUserid()) == 0) {
			out.write("<script>alert('등록되지 않은 아이디입니다.');");
			out.write("history.back()</script>");
			out.close();
		}
		// 가입된 이메일이 아니면
		else if(!vo.getUseremail().equals(ck.getUseremail())) {
			out.write("<script>alert('등록되지 않은 이메일입니다.');");
			out.write("history.back()</script>");
			out.close();
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setUserpwd(pw);
			// 비밀번호 변경
			dao.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpw");
			out.write("<script>location.href='/member/resetPwdOk'");
			out.write("</script>");
			
			out.close();
		}
	}

	@Override
	public int updatePw(MemberVO vo) throws Exception {
		// TODO Auto-generated method stub
		return dao.updatePw(vo);
	}

	@Override
	public MemberVO readMember(String userid) {
		// TODO Auto-generated method stub
		return dao.readMember(userid);
	}
	
	
}
