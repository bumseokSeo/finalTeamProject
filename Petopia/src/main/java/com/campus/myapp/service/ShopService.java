package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.ShopVO;

public interface ShopService {
	public void insertShop(ShopVO svo);
	public ShopVO selectShop(int shopid);
}
