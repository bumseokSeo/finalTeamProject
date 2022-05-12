package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.ReplyDAO;
import com.campus.myapp.vo.ReplyVO;

@Service
public class ReplyServiceImp implements ReplyService {
	@Inject
	ReplyDAO dao;


	@Override
	public int replyWrite(ReplyVO vo) {
		return dao.replyWrite(vo);
	}

	@Override
	public List<ReplyVO> replyList(int boardno) {
		return dao.replyList(boardno);
	}

	@Override
	public int replyEdit(ReplyVO vo) {
		return dao.replyEdit(vo);
	}

	@Override
	public int replyDel(int replyno, String userid) {
		return dao.replyDel(replyno, userid);
	}

}
