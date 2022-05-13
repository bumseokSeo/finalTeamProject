package com.campus.myapp.controller;

import java.io.File;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.campus.myapp.vo.AdminPagingVO;
import com.campus.myapp.vo.AnimalInfoVO;
import com.campus.myapp.vo.MemberVO;

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
	public ModelAndView admin_animalInfo(AdminPagingVO apVO) {
		ModelAndView mav = new ModelAndView();
		
		apVO.setTotalRecord(service.animalInfoTotalRecord(apVO));
		
		mav.addObject("list", service.animalInfoList(apVO));
		mav.addObject("apVO", apVO);
		
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
			
			if(files!=null) {
				int cnt = 1;
				
				for(int i = 0; i < files.size(); i++) {
					MultipartFile mf = files.get(i);
					
					String orgFileName = mf.getOriginalFilename();
					
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
	
	// 반려동물정보 삭제
	@GetMapping("/breedDel")
	public ResponseEntity<String> breedDel(String breedkey, HttpSession session){
		String path = session.getServletContext().getRealPath("/img/animalInfo");
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		try {
			AnimalInfoVO vo = service.animalInfoGetFileName(breedkey);
			
			service.animalInfoDataDelete(breedkey);
			
			fileDelete(path, vo.getFilename1());
			if(vo.getFilename2() != null) {
				fileDelete(path, vo.getFilename2());
			}
			if(vo.getFilename3() != null) {
				fileDelete(path, vo.getFilename3());
			}
			
			String msg = "<script>alert('반려동물정보가 삭제되었습니다.'); location.href='/admin/admin_animalInfo';</script>";
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			
			String msg = "<script>alert('삭제실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 반려동물정보 수정 이동
	@GetMapping("admin_animalInfo_Edit")
	public ModelAndView animalInfoEdit(String breedkey) {
		ModelAndView mav = new ModelAndView();
		AnimalInfoVO vo = service.animalInfoEditView(breedkey);
		
		int fileCount = 1;
		if(vo.getFilename2()!=null) {
			fileCount++;
		}
		if(vo.getFilename3()!=null) {
			fileCount++;
		}
		
		mav.addObject("fileCount", fileCount);
		mav.addObject("vo", vo);
		mav.setViewName("admin/admin_animalInfo_Edit");
		return mav;
	}
	
	// 반려동물정보 수정(DB)
	@PostMapping("animalInfoEditOk")
	public ResponseEntity<String> animalInfoEditOk(AnimalInfoVO vo, HttpServletRequest request){
		String path = request.getServletContext().getRealPath("/img/animalInfo");
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.add("Content-Type", "text/html; charset=utf-8");
		
		List<String> fileList = new ArrayList<String>();
		List<String> newUpload = new ArrayList<String>();
		
		try {
			// DB에서 파일명 가져오기
			AnimalInfoVO avo = service.animalInfoGetFileName(vo.getBreed());
			
			
			fileList.add(avo.getFilename1());
			if(avo.getFilename2() != null) {
				fileList.add(avo.getFilename2());
			}
			if(avo.getFilename3() != null) {
				fileList.add(avo.getFilename3());
			}
			
			// list에서 파일명 지우기
			if(vo.getDelFile() != null) {
				for(int i = 0; i < vo.getDelFile().length; i++) {
					if(vo.getDelFile() != null) {
						for(String delFile: vo.getDelFile()) {
							fileList.remove(delFile);
						}
					}
				}
			}
			
			
			// 새로 업로드하기
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;
			
			List<MultipartFile> newFileList = mr.getFiles("imgName");
			if(newFileList != null) {
				for(int i = 0; i < newFileList.size(); i++) {
					MultipartFile newMf = newFileList.get(i);
					String newUploadFilename = newMf.getOriginalFilename();
					
					if(newUploadFilename != null && !newUploadFilename.equals("")) {
						File f = new File(path, newUploadFilename);
						if(f.exists()) {
							for(int n = 1;; n++) {
								int point = newUploadFilename.lastIndexOf(".");
								String fileNameNoExt = newUploadFilename.substring(0, point);
								String ext = newUploadFilename.substring(point+1);
								
								String nf = fileNameNoExt + " (" + n + ")." + ext;
								f = new File(path, nf);
								if(!f.exists()) {
									newUploadFilename = nf;
									break;
								}
							}
						}
						
						try {
							newMf.transferTo(f);
						}catch(Exception ee) {
							ee.printStackTrace();
						}
						fileList.add(newUploadFilename);
						newUpload.add(newUploadFilename);
						
					}
				}
			}
			if(vo.getDelFile() != null) {
				if(vo.getDelFile().length == 1) {
					if(avo.getFilename1().equals(vo.getDelFile()[0])) {
						vo.setFilename1(fileList.get(2));
						vo.setFilename2(fileList.get(0));
						vo.setFilename3(fileList.get(1));
					}
					if(avo.getFilename2().equals(vo.getDelFile()[0])) {
						vo.setFilename1(fileList.get(0));
						vo.setFilename2(fileList.get(2));
						vo.setFilename3(fileList.get(1));
					}
					if(avo.getFilename3().equals(vo.getDelFile()[0])) {
						vo.setFilename1(fileList.get(0));
						vo.setFilename2(fileList.get(1));
						vo.setFilename3(fileList.get(2));
					}
				}
				
				if(vo.getDelFile().length == 2) {
					if(avo.getFilename1().equals(vo.getDelFile()[0]) && avo.getFilename2().equals(vo.getDelFile()[1])) {
						vo.setFilename1(fileList.get(1));
						vo.setFilename2(fileList.get(2));
						vo.setFilename3(fileList.get(0));
					}
					if(avo.getFilename1().equals(vo.getDelFile()[0]) && avo.getFilename3().equals(vo.getDelFile()[1])) {
						vo.setFilename1(fileList.get(1));
						vo.setFilename2(fileList.get(0));
						vo.setFilename3(fileList.get(2));
					}
					if(avo.getFilename2().equals(vo.getDelFile()[0]) && avo.getFilename3().equals(vo.getDelFile()[1])) {
						vo.setFilename1(fileList.get(0));
						vo.setFilename2(fileList.get(1));
						vo.setFilename3(fileList.get(2));
					}
				}
				
				if(vo.getDelFile().length == 3) {
					vo.setFilename1(fileList.get(0));
					vo.setFilename2(fileList.get(1));
					vo.setFilename3(fileList.get(2));
				}
			}else if(vo.getDelFile() == null) {
				vo.setFilename1(fileList.get(0));
				vo.setFilename2(fileList.get(1));
				vo.setFilename3(fileList.get(2));
			}
			
			
			service.animalInfoUpdate(vo);
			
			if(vo.getDelFile() != null) {
				for(String fname : vo.getDelFile()) {
					fileDelete(path, fname);
				}
			}
			
			String msg = "<script>alert('반려동물정보가 수정되었습니다.'); location.href='/admin/admin_animalInfo';</script>";
			
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
			
		}catch(Exception e) {
			e.printStackTrace();
			for(String fname : newUpload) {
				fileDelete(path, fname);
			}
			
			String msg = "<script>alert('반려동물정보 수정 실패하였습니다');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
		
		
	// 회원 관리 이동
	@GetMapping("/admin_memberList")
	public ModelAndView admin_memberList(AdminPagingVO apVO) {
		ModelAndView mav = new ModelAndView();
		
		apVO.setTotalRecord(service.memberTotalRecord(apVO));
		
		mav.addObject("list", service.memberList(apVO));
		mav.addObject("apVO", apVO);
		
		mav.setViewName("admin/admin_memberList");
		return mav;
	}
		
		
	// 회원정보 삭제
	@GetMapping("/memberDel")
	public ResponseEntity<String> memberDel(String userid, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		try {			
			service.memberDelete(userid);
			
			String msg = "<script>alert('회원정보가 삭제되었습니다.'); location.href='/admin/admin_memberList';</script>";
			
			entity = new ResponseEntity<String>(msg, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			
			String msg = "<script>alert('삭제실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	// 회원등급 변경
	@GetMapping("/memberChangeAdmin")
	public ResponseEntity<String> memberChangeAdmin(String userid, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		try {			
			service.memberChangeAdmin(userid);
			
			String msg = "<script>alert('회원 등급이 변경되었습니다.'); location.href='/admin/admin_memberList';</script>";
			
			entity = new ResponseEntity<String>(msg, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			
			String msg = "<script>alert('회원 등급 변경 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("/memberChangeNormal")
	public ResponseEntity<String> memberChangeNormal(String userid, HttpSession session){
		
		ResponseEntity<String> entity = null;
		
		try {			
			service.memberChangeNormal(userid);
			
			String msg = "<script>alert('회원 등급이 변경되었습니다.'); location.href='/admin/admin_memberList';</script>";
			
			entity = new ResponseEntity<String>(msg, HttpStatus.OK);
		}catch(Exception e) {
			e.printStackTrace();
			
			String msg = "<script>alert('회원 등급 변경 실패하였습니다.');history.back();</script>";
			entity = new ResponseEntity<String>(msg, HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@GetMapping("/memberChangeStop")
	public ResponseEntity<String> memberChangeStop(String userid, HttpSession session){
	
	ResponseEntity<String> entity = null;
	
	try {			
		service.memberChangeStop(userid);
		
		String msg = "<script>alert('회원 등급이 변경되었습니다.'); location.href='/admin/admin_memberList';</script>";
		
		entity = new ResponseEntity<String>(msg, HttpStatus.OK);
	}catch(Exception e) {
		e.printStackTrace();
		
		String msg = "<script>alert('회원 등급 변경 실패하였습니다.');history.back();</script>";
		entity = new ResponseEntity<String>(msg, HttpStatus.BAD_REQUEST);
	}
	return entity;
}
}
