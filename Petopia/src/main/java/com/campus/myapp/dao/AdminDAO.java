package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.AnimalInfoVO;

@Mapper
@Repository
public interface AdminDAO {
	public List<AnimalInfoVO> animalInfoList(String searchword);

	public int animalInfoInsert(AnimalInfoVO vo);

	public AnimalInfoVO animalInfoGetFileName(String breedkey);

	public int animalInfoDataDelete(String breedkey);

	public AnimalInfoVO animalInfoEditView(String breedkey);

	public int animalInfoUpdate(AnimalInfoVO vo);
	
}
