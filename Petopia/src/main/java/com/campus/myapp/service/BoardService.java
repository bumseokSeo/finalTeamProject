package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;

public interface BoardService {
		//글 등록
		public int BoardInsert(BoardVO vo);
		//글 한개 선택하기(글보기)
		public BoardVO BoardSelect(int boardno);
		//글 선택(리스트)
		public List<BoardVO> BoardSelectList(String boardtype, PagingVO pvo);
		//조회수 증가
		public void hitCount(int boardno);
}
