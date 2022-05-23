package com.campus.myapp.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;





//인터셉트 처리
public class MasterInterceptor implements HandlerInterceptor {
	//컨트롤러 호출전 실행 메소드
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) throws Exception{
		//false -> 홈으로 이동 처리
		//true -> 정상처리
		
		HttpSession session = request.getSession();//세션객체
		Integer logLevel = (Integer) session.getAttribute("logLevel");//로그인 상태
		if(logLevel == 1 ) {//로그인 계정이 관리자인 경우
			return true;
		}
		
		else {
			response.sendRedirect("/");
			return false;
		}
	}
}

