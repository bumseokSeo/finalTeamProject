package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.AdminPagingVO;
import com.campus.myapp.vo.AdminVO;
import com.campus.myapp.vo.AnimalInfoVO;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.MemberVO;
import com.campus.myapp.vo.ReplyVO;

@Mapper
@Repository
public interface AdminDAO {
	public List<AnimalInfoVO> animalInfoList(AdminPagingVO apVO);
	public int animalInfoTotalRecord(AdminPagingVO apVO);
	public int animalInfoInsert(AnimalInfoVO vo);
	public AnimalInfoVO animalInfoGetFileName(String breedkey);
	public int animalInfoDataDelete(String breedkey);
	public AnimalInfoVO animalInfoEditView(String breedkey);
	public int animalInfoUpdate(AnimalInfoVO vo);
	
	public List<MemberVO> memberList(AdminPagingVO apVO);
	public int memberTotalRecord(AdminPagingVO apVO);
	public int memberDelete(String userid);
	public int memberChangeAdmin(String userid);
	public int memberChangeNormal(String userid);
	public int memberChangeStop(String userid);
	
	
	public int totalMemberCnt(AdminVO vo);
	public int level1MemberCnt(AdminVO vo);
	public int level2MemberCnt(AdminVO vo);
	public int level3MemberCnt(AdminVO vo);
	
	public int totalAnimalInfoCnt(AdminVO vo);
	public int dogInfoCnt(AdminVO vo);
	public int catInfoCnt(AdminVO vo);
	public int reptileInfoCnt(AdminVO vo);
	public int birdInfoCnt(AdminVO vo);
	public int etcInfoCnt(AdminVO vo);
	
	public int totalBoardCnt(AdminVO vo);
	public int infoCnt(AdminVO vo);
	public int shareCnt(AdminVO vo);
	public int walkCnt(AdminVO vo);
	public int boastCnt(AdminVO vo);
	public int suggestCnt(AdminVO vo);
	
	public int totalNoticeCnt(AdminVO vo);
	
	public int totalAdoptCnt(AdminVO vo);
	public int dogAdoptCnt(AdminVO vo);
	public int catAdoptCnt(AdminVO vo);
	public int reptileAdoptCnt(AdminVO vo);
	public int birdAdoptCnt(AdminVO vo);
	public int etcAdoptCnt(AdminVO vo);
	
	public List<BoardVO> boardList(AdminPagingVO apVO);
	public int boardTotalRecord(AdminPagingVO apVO);
	public BoardVO boardGetFileName(int boardno);
	public int boardDataDelete(int boardno);
	
	public List<BoardVO> noticeList(AdminPagingVO apVO);
	public int noticeTotalRecord(AdminPagingVO apVO);
	
	public int totalReplyCnt(AdminVO vo);
	public int noticeReplyCnt(AdminVO vo);
	public int infoReplyCnt(AdminVO vo);
	public int shareReplyCnt(AdminVO vo);
	public int walkReplyCnt(AdminVO vo);
	public int boastReplyCnt(AdminVO vo);
	public int suggestReplyCnt(AdminVO vo);
	public int adoptReplyCnt(AdminVO vo);
	
	public int totalShopReviewCnt(AdminVO vo);
	public List<ReplyVO> boardReviewList(AdminPagingVO apVO);
	public int boardReviewTotalRecord(AdminPagingVO apVO);
	public int boardReviewDelete(int replyno);
	
	public List<BoardVO> adoptList(AdminPagingVO apVO);
	public int adoptTotalRecord(AdminPagingVO apVO);
	
	
	
}
