package com.campus.myapp.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.campus.myapp.vo.AnimalInfoVO;

@Mapper
@Repository
public interface AnimalInfoDAO {
	//강아지 리스트 출력(검색포함)
	public List<AnimalInfoVO> animalListDog(String searchword);
	
	//고양이 리스트 출력(검색포함)
	public List<AnimalInfoVO> animalListCat(String searchword);
	
	//파충류 리스트 출력(검색포함)
	public List<AnimalInfoVO> animalListReptile(String searchword);
		
	//조류 리스트 출력(검색포함)
	public List<AnimalInfoVO> animalListBird(String searchword);
		
	//기타동물 리스트 출력(검색포함)
	public List<AnimalInfoVO> animalListEtc(String searchword);
	
	//동물 종류를 입력받아 그 정보 출력
	public AnimalInfoVO animalList(String breedkey);
}
