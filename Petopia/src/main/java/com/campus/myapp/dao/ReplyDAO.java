package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.ReplyVO;

@Mapper
@Repository
public interface ReplyDAO {
	// 댓글등록
	public int replyWrite(ReplyVO vo);
	// 댓글목록
	public List<ReplyVO> replyList(int board_num);
	// 댓글수정
	public int replyEdit(ReplyVO vo);
	// 댓글삭제
	public int replyDel(int reply_num, String user_id);

}
