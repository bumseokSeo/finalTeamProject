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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.BoardService;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;

@Controller
public class NoticeController {

	@Inject
	BoardService service;
	
	@GetMapping("/board/SubMenuSelect")
	public ModelAndView SubMenuSelect(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();
		System.out.println("보드 메인컨트롤러 시작");
		
		pVO.setTotalRecord(service.totalRecord("공지사항", pVO));
		
		mav.addObject("pVO", pVO);
		mav.addObject("nlist", service.BoardSelectList("공지사항", pVO));
		mav.setViewName("board/SubMenuSelect");
		return mav;
	}
	
	//글쓰기 폼 이동
	@GetMapping("/board/notice/noticeWrite")
	public String noticeWrite() {
		return "/board/notice/noticeWrite";
	}
	
	//글 쓰기
	@PostMapping("/board/notice/noticeWriteOk")
	public ResponseEntity<String> boardWriteOk(BoardVO vo, HttpServletRequest request) {
		System.out.println("BoardWrite");
		vo.setUserid((String)request.getSession().getAttribute("logId"));//아이디 등록
		
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
		
		String path = request.getSession().getServletContext().getRealPath("/upload/"); // 파일업로드를 위한 업로드 위치의 절대주소
		System.out.println("path -> "+path);
		try {
			MultipartHttpServletRequest mr = (MultipartHttpServletRequest)request;

			List<MultipartFile> files = mr.getFiles("filename");
			System.out.println("업로드 파일 수 -> "+files.size());
			
			if(files!=null) {	//if 1
				int cnt = 1;	
				for(int i=0; i<files.size(); i++) {	// for 222
					//	1. MultipartFile
					MultipartFile mf = files.get(i);
					
					//	2.실제 파일명
					String orgFileName = mf.getOriginalFilename();
					System.out.println("orgFileName -> "+ orgFileName );
					
					//	3. rename
					if(orgFileName!=null && !orgFileName.equals("")) {	//if 3
						File f = new File(path, orgFileName);
						if(f.exists()) {	//if 4
							for(int renameNum=1;; renameNum++) {	//for 5
								//	확장자와 파일을 분리
								int point = orgFileName.lastIndexOf(".");
								String fileName = orgFileName.substring(0, point);
								String ext = orgFileName.substring(point+1);
								
								f = new File(path, fileName+" ("+renameNum+")."+ext);
								if(!f.exists()) {
									orgFileName = f.getName();
									break;
								}	//if 6
								
							}	//for 5
							
						}	//if 4
						//	4. 파일 업로드
						try {
							mf.transferTo(f);
							System.out.println(f);
						}catch(Exception ee) {
							ee.printStackTrace();
						}
						
						//	5.새로운파일명 vo에 셋팅
						if(cnt==1) vo.setFilename1(orgFileName);
						cnt++;
					}	//if 3
					
				}// for 2
				
			}//	if 1
			System.out.println(vo.getFilename1());

			//DB등록
			service.BoardInsert(vo);
			String userid = (String)request.getSession().getAttribute("logId");
			vo.setBoardno(service.BoardNum(userid));
			String msg = "<script>alert('공지사항 등록완료');location.href='/board/notice/noticeList';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			
		}catch(Exception e) {
			e.printStackTrace();
				fileDelete(path, vo.getFilename1());
			String msg = "<script>alert('공지사항 등록 실패');history.back();</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);	//400
		}
		return entity;
	}
		
		public void fileDelete(String p, String f) {
			if(f != null) {	//파일명이 있을때만
				File file = new File(p, f);
				file.delete();
			}
		}
		
		//글 내용보기
		@GetMapping("/board/notice/noticeView")
		public ModelAndView reviewBoardView(int boardno) {
			ModelAndView mav = new ModelAndView();
			System.out.println("조회수 증가");
			service.hitCount(boardno); //조회수 증가
			mav.addObject("vo", service.BoardView(boardno));
			mav.setViewName("/board/notice/noticeView");
			return mav;
		}
	
}

