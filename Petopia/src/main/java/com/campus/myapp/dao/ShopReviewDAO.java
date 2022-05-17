package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.ShopReviewVO;

@Mapper
@Repository
public interface ShopReviewDAO {
	public int insertReview(ShopReviewVO vo);
	public List<ShopReviewVO> selectReview(int shopid);
	public int updateReview(ShopReviewVO vo);
	public int deleteReview(int reviewno, String userid);
}
