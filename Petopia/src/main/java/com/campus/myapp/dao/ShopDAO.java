package com.campus.myapp.dao;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;

import com.campus.myapp.vo.ShopVO;

@Mapper
@Repository
public interface ShopDAO {
	public String insertShop(@RequestBody HashMap<String, ShopVO> places);
}
