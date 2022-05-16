package com.campus.myapp.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.campus.myapp.dao.AdminDAO;
import com.campus.myapp.vo.AdminPagingVO;
import com.campus.myapp.vo.AdminVO;
import com.campus.myapp.vo.AnimalInfoVO;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.MemberVO;
import com.campus.myapp.vo.ReplyVO;

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

	@Override
	public List<BoardVO> boardList(AdminPagingVO apVO) {
		return dao.boardList(apVO);
	}

	@Override
	public int boardTotalRecord(AdminPagingVO apVO) {
		return dao.boardTotalRecord(apVO);
	}

	@Override
	public BoardVO boardGetFileName(int boardno) {
		return dao.boardGetFileName(boardno);
	}

	@Override
	public int boardDataDelete(int boardno) {
		return dao.boardDataDelete(boardno);
	}

	@Override
	public List<BoardVO> noticeList(AdminPagingVO apVO) {
		return dao.noticeList(apVO);
	}

	@Override
	public int noticeTotalRecord(AdminPagingVO apVO) {
		return dao.noticeTotalRecord(apVO);
	}

	@Override
	public int totalReplyCnt(AdminVO vo) {
		return dao.totalReplyCnt(vo);
	}

	@Override
	public int noticeReplyCnt(AdminVO vo) {
		return dao.noticeReplyCnt(vo);
	}

	@Override
	public int infoReplyCnt(AdminVO vo) {
		return dao.infoReplyCnt(vo);
	}

	@Override
	public int shareReplyCnt(AdminVO vo) {
		return dao.shareReplyCnt(vo);
	}

	@Override
	public int walkReplyCnt(AdminVO vo) {
		return dao.walkReplyCnt(vo);
	}

	@Override
	public int boastReplyCnt(AdminVO vo) {
		return dao.boastReplyCnt(vo);
	}

	@Override
	public int suggestReplyCnt(AdminVO vo) {
		return dao.suggestReplyCnt(vo);
	}

	@Override
	public int adoptReplyCnt(AdminVO vo) {
		return dao.adoptReplyCnt(vo);
	}

	@Override
	public int totalShopReviewCnt(AdminVO vo) {
		return dao.totalShopReviewCnt(vo);
	}

	@Override
	public int dogAdoptCnt(AdminVO vo) {
		return dao.dogAdoptCnt(vo);
	}

	@Override
	public int catAdoptCnt(AdminVO vo) {
		return dao.catAdoptCnt(vo);
	}

	@Override
	public int reptileAdoptCnt(AdminVO vo) {
		return dao.reptileAdoptCnt(vo);
	}

	@Override
	public int birdAdoptCnt(AdminVO vo) {
		return dao.birdAdoptCnt(vo);
	}

	@Override
	public int etcAdoptCnt(AdminVO vo) {
		return dao.etcAdoptCnt(vo);
	}

	@Override
	public List<ReplyVO> boardReviewList(AdminPagingVO apVO) {
		return dao.boardReviewList(apVO);
	}

	@Override
	public int boardReviewTotalRecord(AdminPagingVO apVO) {
		return dao.boardReviewTotalRecord(apVO);
	}

	@Override
	public int boardReviewDelete(int replyno) {
		return dao.boardReviewDelete(replyno);
	}

	@Override
	public List<BoardVO> adoptList(AdminPagingVO apVO) {
		return dao.adoptList(apVO);
	}

	@Override
	public int adoptTotalRecord(AdminPagingVO apVO) {
		return dao.adoptTotalRecord(apVO);
	}

	
}
