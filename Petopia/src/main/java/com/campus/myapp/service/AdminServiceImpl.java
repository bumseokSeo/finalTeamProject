package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.AdminDAO;
import com.campus.myapp.vo.AdminPagingVO;
import com.campus.myapp.vo.AnimalInfoVO;
import com.campus.myapp.vo.MemberVO;

@Service
public class AdminServiceImpl implements AdminService {
	@Inject
	AdminDAO dao;

	@Override
	public List<AnimalInfoVO> animalInfoList(AdminPagingVO apVO) {
		return dao.animalInfoList(apVO);
	}

	@Override
	public int animalInfoTotalRecord(AdminPagingVO apVO) {
		return dao.animalInfoTotalRecord(apVO)	;
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

	@Override
	public List<MemberVO> memberList(AdminPagingVO apVO) {
		return dao.memberList(apVO);
	}

	@Override
	public int memberTotalRecord(AdminPagingVO apVO) {
		return dao.memberTotalRecord(apVO);
	}

	@Override
	public int memberDelete(String userid) {
		return dao.memberDelete(userid);
	}

	@Override
	public int memberChangeAdmin(String userid) {
		return dao.memberChangeAdmin(userid);
	}

	@Override
	public int memberChangeNormal(String userid) {
		return dao.memberChangeNormal(userid);
	}

	@Override
	public int memberChangeStop(String userid) {
		return dao.memberChangeStop(userid);
	}

	
}
