package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.ReplyVO;

public interface ReplyService {
		// 댓글등록
		public int replyWrite(ReplyVO vo);

		// 댓글목록
		public List<ReplyVO> replyList(int boardno);

		// 댓글수정
		public int replyEdit(ReplyVO vo);

		// 댓글삭제
		public int replyDel(int replyno, String userid);
}
