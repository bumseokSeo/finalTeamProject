package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.AnimalInfoDAO;
import com.campus.myapp.vo.AnimalInfoVO;

@Service
public class AnimalInfoServiceImpl implements AnimalInfoService{
	@Inject
	AnimalInfoDAO dao;

	@Override
	public List<AnimalInfoVO> animalListDog(String searchword) {
		// TODO Auto-generated method stub
		return dao.animalListDog(searchword);
	}
	
}
