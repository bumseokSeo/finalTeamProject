package com.campus.myapp.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.MessageVO;

@Repository
public class MessageDAO {

	@Autowired
	private SqlSession sqlSession;

	// 메세지 리스트
	public ArrayList<MessageVO> messageList(MessageVO to) {

		String username = to.getUsername();
		
		// 메세지 리스트에 나타낼 것들 가져오기 - 가장 최근 메세지, 보낸사람 profile 사진, 보낸사람 닉네임
		ArrayList<MessageVO> list = (ArrayList) sqlSession.selectList("message_list", to);

		for (MessageVO mto : list) {
			mto.setUsername(username);
			// 현재 사용자가 해당 room에서 안읽은 메세지의 갯수를 가져온다.
			int unread = sqlSession.selectOne("count_unread", mto);
			// 현재 사용자가 메세지를 주고받는 상대 profile을 가져온다.
			String profile = sqlSession.selectOne("get_other_profile",mto);
			// 안읽은 메세지 갯수를 mto에 set한다.
			mto.setUnread(unread);
			// 메세지 상대의 프로필사진을 mto에 set한다.
			mto.setProfile(profile);
			// 메세지 상대 nick을 세팅한다. other_nick
			if (username.equals(mto.getSend_nick())) {
				mto.setOther_nick(mto.getRecv_nick());
			} else {
				mto.setOther_nick(mto.getSend_nick());
			}
		}

		return list;
	}


	// room 별 메세지 내용을 가져온다.
	public ArrayList<MessageVO> roomContentList(MessageVO to) {

		// 메세지 내역을 가져온다
		ArrayList<MessageVO> clist = (ArrayList) sqlSession.selectList("room_content_list", to);

		// 해당 방의 메세지들 중 받는 사람이 현재사용자의 nick인 메세지를 모두 읽음 처리한다
		sqlSession.update("message_read_chk", to);

		return clist;
	}
	
	// 메세지 list에서 메세지를 보낸다.
	public int messageSendInlist(MessageVO to) {
		/*
		System.out.println("받는사람이름: "+to.getRecv_nick());
		System.out.println("보낸이름: "+to.getSend_nick());
		System.out.println("내용: "+to.getContent());
		System.out.println("타입: "+to.getMessagetype());
		System.out.println("방번호: "+to.getRoom());
		*/
		if(to.getRoom() == 0) {	// room이 0이라면 최초전송
			int exist_chat = sqlSession.selectOne("exist_chat", to);
			
			if(exist_chat == 0) {	// 메세지 내역이 없어서 0이면 message 테이블의 room 최댓값을 구해서 to에 set 한다.
				int max_room = sqlSession.selectOne("max_room", to);
				to.setRoom(max_room+1);
			}else {		// 메세지 내역이 있다면 해당 room 번호를 가져온다.
				int room = Integer.parseInt(sqlSession.selectOne("select_room", to) );
				to.setRoom(room);
			}
		}
		
		int flag = sqlSession.insert("messageSendInlist",to);
		return flag;
	}

}