package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.BoardVO;

@Mapper
@Repository
public interface BoardDAO {
	//게시글 작성
	public int shareInsert(BoardVO vo);
	// 게시글리스트
	public List<BoardVO> selectList(BoardVO vo);
	
}
