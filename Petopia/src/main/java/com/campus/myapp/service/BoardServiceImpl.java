package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.BoardDAO;
import com.campus.myapp.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	BoardDAO dao;
	
	@Override
	public List<BoardVO> selectList(BoardVO vo) {
		return dao.selectList(vo);
	}

	@Override
	public int shareInsert(BoardVO vo) {
		return dao.shareInsert(vo);
	}

}
