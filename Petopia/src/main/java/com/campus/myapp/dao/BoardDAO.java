package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;


@Mapper
@Repository
public interface BoardDAO {
	//글 등록
	public int BoardInsert(BoardVO vo);
	//글 한개 선택하기(글보기)
	public BoardVO BoardSelect(int boardno);
	//글 선택(리스트)
	public List<BoardVO> BoardSelectList(String boardtype, PagingVO pvo);
	//조회수 증가
	public void hitCount(int boardno);
	
	public int BoardNum(String user_id);
	
	//글보기
	public BoardVO BoardView(int boardno);
	
	//페이징
	public int totalRecord(String boardtype, PagingVO pVO);
	

}
