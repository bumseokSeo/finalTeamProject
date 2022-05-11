package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PagingVO2;


@Mapper
@Repository
public interface BoardDAO {
	//글 등록
	public int BoardInsert(BoardVO vo);
	//글 한개 선택하기(글보기)
	public BoardVO BoardSelect(int boardno);
	//글 선택(리스트)1
	public List<BoardVO> BoardSelectList(BoardVO vo, String boardtype, PagingVO pVO);
	//글 선택(리스트)2
	public List<BoardVO> BoardSelectList(BoardVO vo, String boardtype, PagingVO2 pVO2);
	//조회수 증가
	public void hitCount(int boardno);
	
	public int BoardNum(String userid);
	
	//글보기
	public BoardVO BoardView(int boardno);
	
	//페이징
	public int BoardtotalRecord(PagingVO pVO, String boardtype);
	//Share Board
	//게시글 작성
	public int shareInsert(BoardVO vo);
	// 게시글 리스트
	public List<BoardVO> shareSelectList(PagingVO pvo, BoardVO vo);
	// 게시판 총 레코드 수 
	public int shareTotalRecord(PagingVO pvo, BoardVO vo);
	// 조회수 증가
	public void updateHit(int boardno);
	
	public String getType(int boardno);
	
	//글수정
	public int BoardUpdate(BoardVO vo);
	public int BoardFileUpdate(BoardVO vo);
	//파일명 선택
	public BoardVO getFileName(int boardno);
	//글삭제
	public int boardDelete(int boardno, String userid);
	
}

