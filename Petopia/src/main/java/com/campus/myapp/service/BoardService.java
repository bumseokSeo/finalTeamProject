package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PagingVO2;

public interface BoardService {
	//글 등록
	public int BoardInsert(BoardVO vo);
	//글 한개 선택하기(글보기)
	public BoardVO BoardSelect(int boardno);
	//글 선택(리스트)
	public List<BoardVO> BoardSelectList(BoardVO vo, String boardtype,PagingVO pVO);
	//글 선택(리스트)2
		public List<BoardVO> BoardSelectList(BoardVO vo, String boardtype, PagingVO2 pVO2);
	//조회수 증가
	public void hitCount(int boardno);
	
	public int BoardNum(String userid);
	
	//글수정
	public int BoardUpdate(BoardVO vo);
	public int BoardFileUpdate(BoardVO vo);
	//파일명 선택
	public BoardVO getFileName(int boardno);
	//글삭제
	public int boardDelete(int boardno, String userid);
	public BoardVO BoardView(int boardno);
	
	public String getType(int boardno);
	
	public int BoardtotalRecord(PagingVO pVO, String boardtype);

	// Share Board
	public int shareInsert(BoardVO vo);
	public List<BoardVO> shareSelectList(PagingVO pvo, BoardVO vo);
	public int shareTotalRecord(PagingVO pvo, BoardVO vo);
}
