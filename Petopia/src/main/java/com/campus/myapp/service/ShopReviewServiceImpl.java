package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.ShopReviewDAO;
import com.campus.myapp.vo.ShopReviewVO;

@Service
public class ShopReviewServiceImpl implements ShopReviewService{
	@Inject
	ShopReviewDAO dao;

	@Override
	public int insertReview(ShopReviewVO vo) {
		return dao.insertReview(vo);
	}

	@Override
	public List<ShopReviewVO> selectReview(int shopid) {
		return dao.selectReview(shopid);
	}

	@Override
	public int updateReview(ShopReviewVO vo) {
		return dao.updateReview(vo);
	}

	@Override
	public int deleteReview(int reviewno, String userid) {
		return dao.deleteReview(reviewno, userid);
	}

	@Override
	public String selectFile(int reviewno) {
		return dao.selectFile(reviewno);
	}

}
