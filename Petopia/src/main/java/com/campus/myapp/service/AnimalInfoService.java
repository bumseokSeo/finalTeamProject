package com.campus.myapp.service;

import java.util.List;

import com.campus.myapp.vo.AnimalInfoVO;

public interface AnimalInfoService {
	public List<AnimalInfoVO> animalListDog(String searchword);
	public List<AnimalInfoVO> animalListCat(String searchword);
	public List<AnimalInfoVO> animalListReptile(String searchword);
	public List<AnimalInfoVO> animalListBird(String searchword);
	public List<AnimalInfoVO> animalListEtc(String searchword);
	public AnimalInfoVO animalList(String breedkey);
}
