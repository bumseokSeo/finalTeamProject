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

	@Override
	public AnimalInfoVO animalList(String breedkey) {
		// TODO Auto-generated method stub
		return dao.animalList(breedkey);
	}

	@Override
	public List<AnimalInfoVO> animalListCat(String searchword) {
		// TODO Auto-generated method stub
		return dao.animalListCat(searchword);
	}

	@Override
	public List<AnimalInfoVO> animalListReptile(String searchword) {
		// TODO Auto-generated method stub
		return dao.animalListReptile(searchword);
	}

	@Override
	public List<AnimalInfoVO> animalListBird(String searchword) {
		// TODO Auto-generated method stub
		return dao.animalListBird(searchword);
	}

	@Override
	public List<AnimalInfoVO> animalListEtc(String searchword) {
		// TODO Auto-generated method stub
		return dao.animalListEtc(searchword);
	}
	
}
