package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PagingVO2;


@Mapper
@Repository
public interface BoardDAO {
	//글 등록
	public int BoardInsert(BoardVO vo);
	//건의 등록
	public int BoardInsertSuggest(BoardVO vo);
	//입양 등록
	public int BoardInsertAdopt(BoardVO vo);
	//글 한개 선택하기(글보기)
	public BoardVO BoardSelect(int boardno);
	//글 선택(리스트)
	public List<BoardVO> BoardSelectList(String boardtype, PagingVO pVO);
	//조회수 증가
	public void hitCount(int boardno);
	public void LikeInsert(int boardno, String userid);
	public void LikeDelete(int boardno, String userid);
	public int LikeCheck(int boardno,String userid);
	public int LikeCnt(int boardno);
	public int LikeModi(int boardno, int likes);

	
	public int BoardNum();
	
	public int SuggestNum();
	
	//글보기
	public BoardVO BoardView(int boardno, String type);
	
	//페이징
	public int BoardtotalRecord(PagingVO pVO, String boardtype);
	
	//검색
	public List<BoardVO> boardSearch(String searchKey, String string, int start, int end, String boardtype);
	
	// 조회수 증가
	public void updateHit(int boardno);
	
	public String getType(int boardno);
	
	//글수정
	public int BoardUpdate(BoardVO vo);
	public int BoardAdUpdate(BoardVO vo);
	public int BoardFileUpdate(BoardVO vo);
	//파일명 선택
	public BoardVO getFileName(int boardno);
	//글삭제
	public int boardDelete(int boardno, String userid);
	
	public int myWriteCnt(String userid);
	public int myReviewCnt(String userid);
	
}

