package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.AdminDAO;
import com.campus.myapp.vo.AdminPagingVO;
import com.campus.myapp.vo.AdminVO;
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

	@Override
	public int totalMemberCnt(AdminVO vo) {
		return dao.totalMemberCnt(vo);
	}

	@Override
	public int level1MemberCnt(AdminVO vo) {
		return dao.level1MemberCnt(vo);
	}

	@Override
	public int level2MemberCnt(AdminVO vo) {
		return dao.level2MemberCnt(vo);
	}

	@Override
	public int level3MemberCnt(AdminVO vo) {
		return dao.level3MemberCnt(vo);
	}

	@Override
	public int totalAnimalInfoCnt(AdminVO vo) {
		return dao.totalAnimalInfoCnt(vo);
	}

	@Override
	public int dogInfoCnt(AdminVO vo) {
		return dao.dogInfoCnt(vo);
	}

	@Override
	public int catInfoCnt(AdminVO vo) {
		return dao.catInfoCnt(vo);
	}

	@Override
	public int reptileInfoCnt(AdminVO vo) {
		return dao.reptileInfoCnt(vo);
	}

	@Override
	public int birdInfoCnt(AdminVO vo) {
		return dao.birdInfoCnt(vo);
	}

	@Override
	public int etcInfoCnt(AdminVO vo) {
		return dao.etcInfoCnt(vo);
	}

	@Override
	public int totalBoardCnt(AdminVO vo) {
		return dao.totalBoardCnt(vo);
	}

	@Override
	public int infoCnt(AdminVO vo) {
		return dao.infoCnt(vo);
	}

	@Override
	public int shareCnt(AdminVO vo) {
		return dao.shareCnt(vo);
	}

	@Override
	public int walkCnt(AdminVO vo) {
		return dao.walkCnt(vo);
	}

	@Override
	public int boastCnt(AdminVO vo) {
		return dao.boastCnt(vo);
	}

	@Override
	public int suggestCnt(AdminVO vo) {
		return dao.suggestCnt(vo);
	}

	@Override
	public int totalNoticeCnt(AdminVO vo) {
		return dao.totalNoticeCnt(vo);
	}

	@Override
	public int totalAdoptCnt(AdminVO vo) {
		return dao.totalAdoptCnt(vo);
	}

	
}
