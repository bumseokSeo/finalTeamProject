package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.BoardDAO;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;

@Service
public class BoardServiceImp implements BoardService{
	@Inject
	BoardDAO dao;
	
	@Override
	public int BoardInsert(BoardVO vo) {
		return dao.BoardInsert(vo);
	}
	
	@Override
	public BoardVO BoardSelect(int boardno) {
		return dao.BoardSelect(boardno);
	}
	
	@Override
	public List<BoardVO> BoardSelectList(String boardtype, PagingVO pvo){
		return dao.BoardSelectList(boardtype, pvo);
	}
	
	@Override
	public void hitCount(int boardno){
		dao.hitCount(boardno);
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
}
