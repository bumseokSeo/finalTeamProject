package com.campus.myapp.service;

import java.util.HashMap;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.ShopDAO;
import com.campus.myapp.vo.ShopVO;

@Service
public class ShopServiceImpl implements ShopService {

	ShopDAO dao;
	@Override
	public String insertShop(HashMap<String, ShopVO> places) {
		return dao.insertShop(places);
	}

}
