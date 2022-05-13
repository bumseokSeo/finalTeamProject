package com.campus.myapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.ShopService;
import com.campus.myapp.vo.ShopVO;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@RestController
@RequestMapping("/map/")
public class ShopController {
	
	@Inject
	ShopService service;
	ModelAndView mav = new ModelAndView();
	ResponseEntity<String> entity = null;
	
	@PostMapping("insertshop")
	public void insertShop(@RequestBody HashMap<String,Object> places) {
		JSONObject json=new JSONObject(places);
//		System.out.println(json);
		
		JsonParser Parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) Parser.parse(json.toString());
		JsonArray shopArray = (JsonArray) jsonObj.get("places");
//		System.out.println("------------------------");
		List<ShopVO> list=new ArrayList<>();
	
		for (int i = 0; i < shopArray.size(); i++) {          
			JsonObject object = (JsonObject) shopArray.get(i);
			String sid = object.get("shopid").getAsString();
			String saddr = object.get("shopaddr").getAsString();
			String sname = object.get("shopname").getAsString();
			String snumber = object.get("shopnumber").getAsString();
			ShopVO svo = new ShopVO(Integer.parseInt(sid), saddr, sname, snumber);
			
//			System.out.println("id : " + object.get("shopid"));     
//			System.out.println("address : " + object.get("shopaddr"));   
//			System.out.println("name : " + object.get("shopname"));    
//			System.out.println("number : " + object.get("shopnumber"));  
//			System.out.println("------------------------");    
//			mav.addObject("list",list);
			list.add(svo);
			service.insertShop(svo);
		} 
	}
	
}
 