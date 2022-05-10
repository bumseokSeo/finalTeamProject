package com.campus.myapp.controller;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.campus.myapp.dao.MessageDAO;
import com.campus.myapp.vo.MessageVO;


@Controller
public class MessageController {

	@Autowired
	private MessageDAO MessageDAO;

	// 메세지 목록
	@RequestMapping(value = "/message_list.do")
	public String message_list(HttpServletRequest request, HttpSession session) {
		// System.out.println("현대 사용자 nick : " + session.getAttribute("nick"));

		String username = (String) session.getAttribute("logName");

		MessageVO to = new MessageVO();
		to.setUsername(username);

		// 메세지 리스트
		ArrayList<MessageVO> list = MessageDAO.messageList(to);

		request.setAttribute("list", list);

		return "message/message_list";
	}

	// 메세지 목록
	@RequestMapping(value = "/message_ajax_list.do")
	public String message_ajax_list(HttpServletRequest request, HttpSession session) {

		String username = (String) session.getAttribute("logName");

		MessageVO to = new MessageVO();
		to.setUsername(username);

		// 메세지 리스트
		ArrayList<MessageVO> list = MessageDAO.messageList(to);

		request.setAttribute("list", list);

		return "message/message_ajax_list";
	}

	@RequestMapping(value = "/message_content_list.do")
	public String message_content_list(HttpServletRequest request, HttpSession session) {

		int room = Integer.parseInt(request.getParameter("room"));
		String username = (String) session.getAttribute("logName");

		MessageVO to = new MessageVO();
		to.setRoom(room);
		to.setUsername(username);

		// 메세지 내용을 가져온다.
		ArrayList<MessageVO> clist = MessageDAO.roomContentList(to);

		request.setAttribute("clist", clist);

		return "message/message_content_list";
	}

	// 메세지 리스트에서 메세지 보내기
	@ResponseBody
	@RequestMapping(value = "/message_send_inlist.do")
	public int message_send_inlist(@RequestParam int room, @RequestParam String other_nick,
			@RequestParam String content, HttpSession session) {

		MessageVO to = new MessageVO();
		to.setRoom(room);
		to.setSend_nick((String) session.getAttribute("logName"));
		to.setRecv_nick(other_nick);
		to.setContent(content);

		int flag = MessageDAO.messageSendInlist(to);

		return flag;
	}

}
