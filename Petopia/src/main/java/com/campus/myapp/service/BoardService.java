package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PagingVO2;

public interface BoardService {
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
	//검색
	public List<BoardVO> boardSearch(String searchKey, String string, int start, int end, String boardtype);
	//조회수 증가
	public void hitCount(int boardno);
	//추천수 증가
	public void LikeInsert(int boardno, String userid);
	public void LikeDelete(int boardno, String userid);
	public int LikeCheck(int boardno,String userid);
	public int LikeCnt(int boardno);
	public int LikeModi(int boardno,int likes);
	
	public int BoardNum();
	public int SuggestNum();
	
	//글수정
	public int BoardUpdate(BoardVO vo);
	public int BoardAdUpdate(BoardVO vo);
	public int BoardFileUpdate(BoardVO vo);
	//파일명 선택
	public BoardVO getFileName(int boardno);
	//글삭제
	public int boardDelete(int boardno, String userid);
	public BoardVO BoardView(int boardno, String type);
	
	public String getType(int boardno);
	
	public int BoardtotalRecord(PagingVO pVO, String boardtype);
	
	public int myWriteCnt(String userid);
	public int myReviewCnt(String userid);
}
