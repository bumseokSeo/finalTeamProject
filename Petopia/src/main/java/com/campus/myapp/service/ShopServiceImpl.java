package com.campus.myapp.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.ShopDAO;
import com.campus.myapp.vo.ShopVO;

@Service
public class ShopServiceImpl implements ShopService {
	@Inject
	ShopDAO dao;

	@Override
	public void insertShop(ShopVO svo) {
		dao.insertShop(svo);
	}

	@Override
	public ShopVO selectShop(int shopid) {
		return dao.selectShop(shopid);
	}
}
