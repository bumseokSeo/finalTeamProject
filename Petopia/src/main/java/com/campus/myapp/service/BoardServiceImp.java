package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.BoardDAO;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PagingVO2;

@Service
public class BoardServiceImp implements BoardService{
	@Inject
	BoardDAO dao;
	
	@Override
	public int BoardInsert(BoardVO vo) {
		return dao.BoardInsert(vo);
	}
	
	@Override
	public int BoardInsertSuggest(BoardVO vo) {
		return dao.BoardInsertSuggest(vo);
	}

	@Override
	public int BoardInsertAdopt(BoardVO vo) {
		return dao.BoardInsertAdopt(vo);
	}
	
	@Override
	public BoardVO BoardSelect(int boardno) {
		return dao.BoardSelect(boardno);
	}
	
	@Override
	public List<BoardVO> BoardSelectList(String boardtype, PagingVO pVO){
		return dao.BoardSelectList(boardtype, pVO);
	}
	
	@Override
	public List<BoardVO> boardSearch(String searchKey, String string, int start, int end, String boardtype){
		return dao.boardSearch(searchKey, string, start, end, boardtype);
	}
	
	@Override
	public void hitCount(int boardno){
		dao.hitCount(boardno);
	}
	
	@Override
	public int BoardNum(){
		return dao.BoardNum();
	}
	
	@Override
	public int SuggestNum() {
		return dao.SuggestNum();
	}
	
	@Override
	public BoardVO BoardView(int boardno, String type) {
		return dao.BoardView(boardno, type);
	}
	
	@Override
	public int BoardtotalRecord(PagingVO pVO, String boardtype) {
		return dao.BoardtotalRecord(pVO, boardtype);
	}

	@Override
	public BoardVO getFileName(int boardno) {
		return dao.getFileName(boardno);
	}
	
	@Override
	public int BoardUpdate(BoardVO vo) {
		return dao.BoardUpdate(vo);
	}

	@Override
	public int BoardFileUpdate(BoardVO vo) {
		return dao.BoardFileUpdate(vo);
	}

	//Share Board
	@Override
	public List<BoardVO> shareSelectList(PagingVO pvo, BoardVO vo) {
		return dao.shareSelectList(pvo,vo);
	}

	@Override
	public int shareInsert(BoardVO vo) {
		return dao.shareInsert(vo);
	}

	@Override
	public int shareTotalRecord(PagingVO pvo, BoardVO vo) {
		return dao.shareTotalRecord(pvo,vo);
	}

	@Override
	public int boardDelete(int boardno, String userid) {
		return dao.boardDelete(boardno, userid);
	}
	
	@Override
	public String getType(int boardno) {
		return dao.getType(boardno);
	}

	@Override
	public int myWriteCnt(String userid) {
		return dao.myWriteCnt(userid);
	}

	@Override
	public int myReviewCnt(String userid) {
		return dao.myReviewCnt(userid);
	}
}
