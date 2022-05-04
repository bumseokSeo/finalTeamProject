package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.AnimalInfoVO;

@Mapper
@Repository
public interface AnimalInfoDAO {
	public List<AnimalInfoVO> animalListDog(String searchword);
}
