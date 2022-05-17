package com.campus.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;





//인터셉트 처리
public class LoginInterceptor implements HandlerInterceptor {
	//컨트롤러 호출 전에 실행되는 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception{
		//false -> 로그인 페이지로
		//true -> 정상처리
		
		HttpSession session = request.getSession();//세션객체
		String logStatus = (String) session.getAttribute("logStatus");//로그인 상태 구하기
		
		if(logStatus!=null && logStatus.equals("Y")) {//로그인이 된 경우
			return true;
		}else {
			response.sendRedirect(request.getContextPath()+"/member/login");
			return false;
		}
	}
}

