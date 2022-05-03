package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.BoardVO;

public interface BoardService {
	public int shareInsert(BoardVO vo);
	public List<BoardVO> selectList(BoardVO vo);
}
