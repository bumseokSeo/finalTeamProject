package com.campus.myapp.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import com.campus.myapp.service.AdminService;
import com.campus.myapp.vo.AnimalInfoVO;

@RestController
@RequestMapping("/admin/")
public class AdminController {
	@Inject
	AdminService service;
	
	// 관리자페이지 메인 이동
	@GetMapping("/adminMain")
	public ModelAndView adminMain() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/adminMain");
		return mav;
	}
	
	// 반려동물정보관리 이동
	@GetMapping("/admin_animalInfo")
	public ModelAndView admin_animalInfo(String searchword) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", service.animalInfoList(searchword));
		mav.setViewName("admin/admin_animalInfo");
		return mav;
	}
	
	// 반려동물정보관리-글쓰기 이동
	@GetMapping("/admin_animalInfo_Write")
	public ModelAndView admin_animalInfo_Write() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/admin_animalInfo_Write");
		return mav;
	}
	
	// 반려동물정보 등록
	@PostMapping("animalInfoWriteOk")
	public ResponseEntity<String> animalInfoWriteOk(AnimalInfoVO vo, HttpServletRequest request){
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html",Charset.forName("UTF-8")));
		
		String path = request.getSession().getServletContext().getRealPath("/img/animalInfo");
		
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			List<MultipartFile> files = mr.getFiles("imgName");
			System.out.println("업로드 파일 수 = " + files.size());
			
			if(files!=null) {
				int cnt = 1;
				
				for(int i = 0; i < files.size(); i++) {
					MultipartFile mf = files.get(i);
					
					String orgFileName = mf.getOriginalFilename();
					System.out.println("orgFileName = " + orgFileName);
					
					if(orgFileName != null && !orgFileName.equals("")) {
						File f = new File(path, orgFileName);
						
						if(f.exists()) {
							for(int renameNum=1;;renameNum++) {
								int point = orgFileName.lastIndexOf(".");
								String fileName = orgFileName.substring(0, point);
								String ext = orgFileName.substring(point+1);
								
								f = new File(path, fileName+" ("+renameNum+")."+ext);
								if(!f.exists()) {
									orgFileName = f.getName();
									break;
								}
							}
						}
						
						try {
							mf.transferTo(f);
						} catch(Exception ee) {
							ee.printStackTrace();
						}
						
						if(cnt==1) vo.setFilename1(orgFileName);
						if(cnt==2) vo.setFilename2(orgFileName);
						if(cnt==3) vo.setFilename3(orgFileName);
						cnt++;
					}
				}
			}
			System.out.println(vo.toString());
			
			service.animalInfoInsert(vo);
			String msg = "<script>alert('반려동물정보가 등록되었습니다.'); location.href='/admin/admin_animalInfo';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			
		} catch(Exception e) {
			e.printStackTrace();
			
			fileDelete(path, vo.getFilename1());
			fileDelete(path, vo.getFilename2());
			fileDelete(path, vo.getFilename3());
			String msg = "<script>alert('반려동물정보 등록 실패하였습니다'); history.back();</script>";
			entity = new ResponseEntity<String>(msg,headers,HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// 파일지우기
	public void fileDelete(String p, String f) {
		if(f != null) {
			File file = new File(p, f);
			file.delete();
		}
	}
}
