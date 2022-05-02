package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import com.campus.myapp.dao.BoardDAO;
import com.campus.myapp.vo.BoardVO;

public class BoardServiceImpl implements BoardService{

	@Inject
	BoardDAO dao;
	
	@Override
	public List<BoardVO> selectList() {
		return dao.selectList();
	}

}
