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
		// TODO Auto-generated method stub
		return dao.animalInfoList(searchword);
	}

	@Override
	public int animalInfoInsert(AnimalInfoVO vo) {
		return dao.animalInfoInsert(vo);
	}
}
