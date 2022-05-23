package com.campus.myapp.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.ShopReviewService;
import com.campus.myapp.vo.ShopReviewVO;

@RestController
@RequestMapping("/map/")
public class ShopReviewController {
	@Inject
	ShopReviewService service;
	
	ModelAndView mav = new ModelAndView();
	
	// 리뷰등록하기
	@PostMapping("writeOk")
	public int writeOk(@RequestParam("filename") MultipartFile filename, ShopReviewVO vo, HttpSession session) {
		vo.setUserid((String) session.getAttribute("logId"));
		String path = session.getServletContext().getRealPath("/upload/review");
		try {
			UUID uuid = UUID.randomUUID();
            String extension = FilenameUtils.getExtension(filename.getOriginalFilename());
            String imgPath = uuid + "." + extension;
            
			if(!filename.isEmpty()) {
				filename.transferTo(new File(path+"/"+imgPath));
				vo.setFilename1(imgPath);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return service.insertReview(vo);
	}
	
	// 리뷰 목록 보이기
	@GetMapping("reviewList")
	public List<ShopReviewVO> reviewList(int shopid){
		return service.selectReview(shopid);
	}
	
	//리뷰 수정
	@PostMapping("editOk")
	public int updateReview(@RequestParam(value="filename", required=false) MultipartFile filename,ShopReviewVO vo, HttpSession session) {
		vo.setUserid((String)session.getAttribute("logId"));
		String path = session.getServletContext().getRealPath("/upload/review");

	   	try {
	   		if(filename!=null) {
			UUID uuid = UUID.randomUUID();
		    String extension = FilenameUtils.getExtension(filename.getOriginalFilename());
		    String imgPath = uuid + "." + extension;
		    
			if(vo.getDeleteFile()!=null && vo.getDeleteFile()!="") {
				vo.setFilename1(null);
				File f = new File(path,vo.getDeleteFile());
				//System.out.println(f);
				if(f!=null && f.exists()) {
					f.delete();
				}
			}
			if(!filename.isEmpty()) {
				String fname =  service.selectFile(vo.getReviewno());
				
				filename.transferTo(new File(path+"/"+imgPath));
				vo.setFilename1(imgPath);
			}
	   		}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return service.updateReview(vo);
	}
	
	//리뷰 삭제
	@GetMapping("deleteOk")
	public int deleteReview(int reviewno, HttpSession session) {
		String filename =  service.selectFile(reviewno);
		
		String path = session.getServletContext().getRealPath("/upload/review");
		if(filename!=null) {
			File f = new File(path,filename);
			if(f!=null && f.exists()) {
				f.delete();
			}
		}
		return service.deleteReview(reviewno, (String)session.getAttribute("logId"));
	}
	
}
