package com.campus.myapp.dao;

import java.util.List;

import com.campus.myapp.vo.BoardVO;

public interface BoardDAO {
	public List<BoardVO> selectList();
}
