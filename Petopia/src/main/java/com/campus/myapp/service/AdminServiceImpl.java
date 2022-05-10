package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.AdminDAO;
import com.campus.myapp.vo.AnimalInfoVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	AdminDAO dao;

	@Override
	public List<AnimalInfoVO> animalInfoList(String searchword) {
		return dao.animalInfoList(searchword);
	}

	@Override
	public int animalInfoInsert(AnimalInfoVO vo) {
		return dao.animalInfoInsert(vo);
	}

	@Override
	public AnimalInfoVO animalInfoGetFileName(String breedkey) {
		return dao.animalInfoGetFileName(breedkey);
	}

	@Override
	public int animalInfoDataDelete(String breedkey) {
		return dao.animalInfoDataDelete(breedkey);
	}

	@Override
	public AnimalInfoVO animalInfoEditView(String breedkey) {
		return dao.animalInfoEditView(breedkey);
	}

	@Override
	public int animalInfoUpdate(AnimalInfoVO vo) {
		return dao.animalInfoUpdate(vo);
	}
}
