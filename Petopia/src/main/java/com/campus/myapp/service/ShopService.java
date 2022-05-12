package com.campus.myapp.service;

import java.util.HashMap;

import org.springframework.web.bind.annotation.RequestBody;

import com.campus.myapp.vo.ShopVO;

public interface ShopService {
	public String insertShop(@RequestBody HashMap<String, ShopVO> places);
}
