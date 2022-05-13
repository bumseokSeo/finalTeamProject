package com.campus.myapp.dao;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.ShopVO;

@Mapper
@Repository
public interface ShopDAO {
	public void insertShop(ShopVO svo);
	public ShopVO selectShop(int shopid);
}
