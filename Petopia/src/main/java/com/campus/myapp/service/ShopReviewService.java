package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.ShopReviewVO;

public interface ShopReviewService {
	public int insertReview(ShopReviewVO vo);
	public List<ShopReviewVO> selectReview(int shopid);
	public int updateReview(ShopReviewVO vo);
	public int deleteReview(int reviewno, String userid);
	public String selectFile(int reviewno);
}
