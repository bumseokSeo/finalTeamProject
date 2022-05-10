package com.campus.myapp.service;


import java.util.HashMap;
import javax.inject.Inject;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.json.simple.JSONObject;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.mail.HtmlEmail;
import org.springframework.stereotype.Service;
import com.campus.myapp.dao.MemberDAO;
import com.campus.myapp.vo.MemberVO;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

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
	}
	public String findId(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.findId(vo);
	}
	
	
	
	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "titia914@gmail.com";
		String hostSMTPpwd = "trgrw553213#@";

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
	
	@Override
	public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";
        
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=68f59a6a1ea23ebf55a954fbe4f7b684");
            sb.append("&redirect_uri=http://localhost:8090/member/kakao");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            // System.out.println("responseCode : " + responseCode);
 
            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            // System.out.println("response body : " + result);
            
            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);
            
            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
            
            // System.out.println("access_token : " + access_Token);
            // System.out.println("refresh_token : " + refresh_Token);
            
            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        
        return access_Token;
    }
	
	@Override
	public HashMap<String, Object> getUserInfo (String access_Token) {
	    
	    //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    요청에 필요한 Header에 포함될 내용
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        // System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String line = "";
	        String result = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        // System.out.println("response body : " + result);
	        
	        JsonParser parser = new JsonParser();
	        JsonElement element = parser.parse(result);
	        
	        JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	        JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	        
	        String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	        String email = kakao_account.getAsJsonObject().get("email").getAsString();
	        String profile_image = properties.getAsJsonObject().get("profile_image").getAsString();
	        String id = element.getAsJsonObject().get("id").getAsString();
	        
	        userInfo.put("username", nickname);
	        userInfo.put("useremail", email);
	        userInfo.put("profileimage", profile_image);
	        userInfo.put("k_id", id);
	        
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	    
	    return userInfo;
	}
	
	@Override
	public void kakaoLogout(String access_Token) {
	    String reqURL = "https://kapi.kakao.com/v1/user/logout";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        conn.setRequestProperty("Authorization", "Bearer " + access_Token);
	        
	        int responseCode = conn.getResponseCode();
	        // System.out.println("responseCode : " + responseCode);
	        
	        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
	        
	        String result = "";
	        String line = "";
	        
	        while ((line = br.readLine()) != null) {
	            result += line;
	        }
	        // System.out.println(result);
	    } catch (IOException e) {
	        // TODO Auto-generated catch block
	        e.printStackTrace();
	    }
	}
	
	@Override
	public int memberDelete(MemberVO vo) {
		return dao.memberDelete(vo);
	}

	@Override
	public MemberVO memberByEmail(String useremail) {
		// TODO Auto-generated method stub
		return dao.memberByEmail(useremail);
	}

	@Override
	public MemberVO memberByKakaoId(String k_id) {
		// TODO Auto-generated method stub
		return dao.memberByKakaoId(k_id);
	}

	@Override
	public int messagechk(String username) {
		// TODO Auto-generated method stub
		
		return dao.messagechk(username);
	}
}
