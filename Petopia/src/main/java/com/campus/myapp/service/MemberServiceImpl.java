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
		params.put("text", "[????????????]???????????? ???????????? [" + numStr + "] ?????????.");
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
	
	public String findKakaoId(MemberVO vo) {
		// TODO Auto-generated method stub
		return dao.findKakaoId(vo);
	}
	
	
	
	@Override
	public void sendEmail(MemberVO vo, String div) throws Exception {
		// Mail Server ??????
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com";
		String hostSMTPid = "titia914@gmail.com";
		String hostSMTPpwd = "********";

		// ????????? ?????? EMail, ??????, ??????
		String fromEmail = "titia914@gmail.com";
		String fromName = "????????????";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "???????????? ?????? ???????????? ?????????.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: orange;'>";
			msg += vo.getUserid() + "?????? ?????? ???????????? ?????????.</h3>";
			msg += "<h3 style='color: orange;'>??????????????? ???????????? ???????????????.</h3>";
			msg += "<p>?????? ???????????? : ";
			msg += vo.getUserpwd() + "</p></div>";
		}

		// ?????? ?????? E-Mail ??????
		String mail = vo.getUseremail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //????????? ????????? 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("???????????? ?????? : " + e);
		}
	}

	//??????????????????
	@Override
	public void findPw(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberVO ck = dao.readMember(vo.getUserid());
		PrintWriter out = response.getWriter();
		// ????????? ???????????? ?????????
		if(dao.memberIdOk(vo.getUserid()) == 0) {
			out.write("<script>alert('???????????? ?????? ??????????????????.');");
			out.write("history.back()</script>");
			out.close();
		}
		// ????????? ???????????? ?????????
		else if(!vo.getUseremail().equals(ck.getUseremail())) {
			out.write("<script>alert('???????????? ?????? ??????????????????.');");
			out.write("history.back()</script>");
			out.close();
		}else {
			// ?????? ???????????? ??????
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			vo.setUserpwd(pw);
			// ???????????? ??????
			dao.updatePw(vo);
			// ???????????? ?????? ?????? ??????
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
            
            //    POST ????????? ?????? ???????????? false??? setDoOutput??? true???
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            
            //    POST ????????? ????????? ???????????? ???????????? ???????????? ?????? ??????
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=68f59a6a1ea23ebf55a954fbe4f7b684");
            sb.append("&redirect_uri=http://localhost:8090/member/kakao");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();
            
            //    ?????? ????????? 200????????? ??????
            int responseCode = conn.getResponseCode();
            // System.out.println("responseCode : " + responseCode);
 
            //    ????????? ?????? ?????? JSON????????? Response ????????? ????????????
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
            // System.out.println("response body : " + result);
            
            //    Gson ?????????????????? ????????? ???????????? JSON?????? ?????? ??????
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
	    
	    //    ???????????? ????????????????????? ?????? ????????? ?????? ??? ????????? HashMap???????????? ??????
	    HashMap<String, Object> userInfo = new HashMap<>();
	    String reqURL = "https://kapi.kakao.com/v2/user/me";
	    try {
	        URL url = new URL(reqURL);
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("POST");
	        
	        //    ????????? ????????? Header??? ????????? ??????
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

	@Override
	public int backtoNormal(String userid) {
		return dao.backtoNormal(userid);
	}

	
}
