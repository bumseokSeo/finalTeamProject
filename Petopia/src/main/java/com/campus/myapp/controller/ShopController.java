package com.campus.myapp.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONObject;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.campus.myapp.vo.ShopVO;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;


@RestController
@RequestMapping("/map/")
public class ShopController {
	
	@PostMapping("insertshop")
	public String insertShop(@RequestBody HashMap<String,ShopVO> places) {
		System.out.println(places.toString());
		JSONObject json=new JSONObject(places);
		System.out.println(json);
		
		JsonParser Parser = new JsonParser();
		JsonObject jsonObj = (JsonObject) Parser.parse(json.toString());
		JsonArray shopArray = (JsonArray) jsonObj.get("places");
		System.out.println("------------------------");
		List<ShopVO> list=new ArrayList<>();
	
		for (int i = 0; i < shopArray.size(); i++) {          
			JsonObject object = (JsonObject) shopArray.get(i);
			String sid = object.get("shopid").getAsString();
			String saddr = object.get("shopaddr").getAsString();
			String sname = object.get("shopname").getAsString();
			String snumber = object.get("shopnumber").getAsString();
			
			System.out.println("id : " + object.get("shopid"));     
			System.out.println("address : " + object.get("shopaddr"));   
			System.out.println("name : " + object.get("shopname"));    
			System.out.println("number : " + object.get("shopnumber"));  
			System.out.println("------------------------");     
			ShopVO svo = new ShopVO(Integer.parseInt(sid), saddr, sname, snumber);
			list.add(svo);
			
			System.out.println(list);
		} 
		
		return "OK";
	}
}
 