package com.campus.myapp.controller;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.AnimalInfoService;

@RestController
@RequestMapping("/animalInfo/")
public class AnimalInfoController {
	@Inject
	AnimalInfoService service;
	//동물정보 메인으로 이동(강아지)
	@GetMapping("/animalInfoMain")
	public ModelAndView animalInfoMain(String searchword) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("list",service.animalListDog(searchword));
		mav.setViewName("animalInfo/animalInfoMain");
		return mav;
	}
	
	//고양이
	@GetMapping("/animalInfoCat")
	public ModelAndView animalInfoCat() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("animalInfo/animalInfoCat");
		return mav;
	}
	
	//파충류
	@GetMapping("/animalInfoReptile")
	public ModelAndView animalInfoReptile() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("animalInfo/animalInfoReptile");
		return mav;
	}
	
	//조류
	@GetMapping("/animalInfoBird")
	public ModelAndView animalInfoBird() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("animalInfo/animalInfoBird");
		return mav;
	}
	
	//기타동물
	@GetMapping("/animalInfoEtc")
	public ModelAndView animalInfoEtc() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("animalInfo/animalInfoEtc");
		return mav;
	}
	
	
	
	
	
	
	//동물정보 서브페이이지로 이동
	@GetMapping("/animalInfoSub")
	public ModelAndView animalInfosSub(String breedkey) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("vo",service.animalList(breedkey));
		mav.setViewName("animalInfo/animalInfoSub");
		return mav;
	}
}
