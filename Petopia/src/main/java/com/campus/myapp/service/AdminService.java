package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.AdminPagingVO;
import com.campus.myapp.vo.AnimalInfoVO;
import com.campus.myapp.vo.MemberVO;

public interface AdminService {
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

	
}
