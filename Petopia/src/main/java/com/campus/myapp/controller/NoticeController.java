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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.BoardService;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;
import com.campus.myapp.vo.PagingVO2;

@Controller
public class NoticeController {

	@Inject
	BoardService service;
	
	@GetMapping("/board/SubMenuSelect")
	public ModelAndView SubMenuSelect(PagingVO pVO, String type) {
		BoardVO bvo = new BoardVO();
		PagingVO2 pVO2 = new PagingVO2();
		ModelAndView mav = new ModelAndView();
		System.out.println("게시판 컨트롤러 ");
		
		
		//게시판 목록
		mav.addObject("noticeList", service.BoardSelectList(bvo, "notice",pVO2)); //공지사항
		mav.addObject("shareList", service.BoardSelectList(bvo, "share",pVO)); //나눔게시판
		mav.addObject("boastList", service.BoardSelectList(bvo, "boast",pVO)); //자랑게시판
		mav.addObject("suggestList", service.BoardSelectList(bvo, "suggest",pVO)); // 건의게시판
		mav.addObject("walkList", service.BoardSelectList(bvo, "walk",pVO2)); // 산책게시판
		mav.addObject("infoList", service.BoardSelectList(bvo, "info",pVO2)); // 정보게시판
		
		mav.addObject("type", type);
		

		pVO.setTotalRecord(service.BoardtotalRecord(pVO, type));
		pVO2.setTotalRecord(service.BoardtotalRecord(pVO, type));
		mav.addObject("pvo",pVO);
		mav.addObject("pVO2",pVO2);
		
		mav.setViewName("board/SubMenuSelect");
		return mav;
	}
	
	//글쓰기 폼 이동
	@GetMapping("/board/notice/noticeWrite")
	public String noticeWrite() {
		return "/board/notice/noticeWrite";
	}
	
	//글 쓰기(공통)
	@PostMapping("/board/BoardWriteOk")
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
			//게시판 회귀 선별조건
			String BF = vo.getBoardtype();
			System.out.println(BF);
			
			if(BF.equals("notice")) {
			String msg = "<script>alert('공지사항 등록완료');location.href='/board/SubMenuSelect?type=notice';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			if(BF.equals("share")) {
			String msg = "<script>alert('나눔게시판 등록완료');location.href='/board/SubMenuSelect?type=share';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			if(BF.equals("adopt")) {
			String msg = "<script>alert('입양게시판 등록완료');location.href='/board/adopt/adoptList';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			
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
		public ModelAndView boardView(int boardno, String user, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			System.out.println("조회수 증가");
			service.hitCount(boardno); //조회수 증가
			mav.addObject("vo", service.BoardView(boardno));
			user = ((String)request.getSession().getAttribute("logId"));
			mav.addObject("user", user);
			
			mav.setViewName("/board/notice/noticeView");
			return mav;
		}
		
		//글 수정
		@GetMapping("/board/notice/noticeEdit")
		public ModelAndView BoardEdit(int boardno) {
			ModelAndView mav = new ModelAndView();
			mav.addObject("vo", service.BoardView(boardno));
			mav.setViewName("/board/notice/noticeEdit");
			return mav;
		}
	
		//수정(DB)
		@PostMapping("/board/notice/noticeEditOk")
		public ResponseEntity<String> reviewEditOk(BoardVO vo, HttpSession session, HttpServletRequest req) {
			System.out.println("boardEdit 시작");
			vo.setUserid((String) session.getAttribute("logId"));
			String path = session.getServletContext().getRealPath("/upload");

			ResponseEntity<String> entity = null;
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=UTF-8");

			//List<String> fileList = new ArrayList<String>(); // 새로 DB에 업데이트 할 파일명 정리하는 컬렉션
			List<String> newUpload = new ArrayList<String>(); // 폼에서 온 파일중 게시물에 없는 파일만 고른 컬렉션
			try {
				// 1. DB에서 파일명 가져오기
				//  BoardVO dbfileVO = service.getFileName(vo.getBoardno()); 지금은 없음.
				// fileList.add(dbfileVO.getFile1());

				// 2. 삭제된 파일이 있을 경우 List에서 같은 파일명을 지운다.
//					if(vo.getDelFile() != null) {		// null은 삭제파일이 없다
//						for(String delFile : vo.getDelFile()) {
//							fileList.remove(delFile);
//						}
//					}

				// 3. 새로 업로드 하기
				MultipartHttpServletRequest mr = (MultipartHttpServletRequest) req;

				// 새로 업로드된 MultipartFile객체를 얻어오기
				List<MultipartFile> newFileList = mr.getFiles("filename");
				if (newFileList != null) { // 새로 업로드 된 파일이 있으면
					for (int i = 0; i < newFileList.size(); i++) {
						MultipartFile newMf = newFileList.get(i);
						String newUploadFilename = newMf.getOriginalFilename();
						System.out.println((i + 1) + "번째 파일 -> " + newUploadFilename);
						// 리네임 작업
						if (newUploadFilename != null && !newUploadFilename.equals("")) {
							File f = new File(path, newUploadFilename);
//								if(fileList.contains(newUploadFilename)) {
//									//이미 해당 글에 업로드 된 파일이라면 리네임이나 업로드하지 않음
//								}else {
							// 해당 글에는 없지만 이미 업로드 된 파일이라면
							// 리네임 후 업로드
							if (f.exists()) {
								// 있으면 여기서 rename
								for (int n = 1;; n++) {
									int point = newUploadFilename.lastIndexOf(".");
									String fileNameNoExt = newUploadFilename.substring(0, point);
									String ext = newUploadFilename.substring(point + 1);

									// 새로운 파일명 만들어 존재유무 확인
									String nf = fileNameNoExt + " (" + n + ")." + ext;
									f = new File(path, nf);
									if (!f.exists()) { // 없으면
										newUploadFilename = nf;
										break;
									}
								} // for
							}
							// 업로드
							try {
								newMf.transferTo(f);
								newUpload.add(newUploadFilename);
							} catch (Exception ee) {
							}

					//		if(i==0) {
					//			if(dbfileVO.getFilename1()!=null) {
					//				fileDelete(path, dbfileVO.getFilename1());
					//			}
					//			dbfileVO.setFilename1(newUploadFilename);
					//		}
							// }

							// fileList.add(newUploadFilename); //db에 등록할 파일명에 추가
							// newUpload.add(newUploadFilename); //새로 업로드 목록 추가
							// }
							// }//for
						} // if
					//	else {
					//	}
					}
				}
				// fileList에 있는 DB에 등록할 파일명을 filename1, filename2에 세팅(여러개일경우)
//					for(int k=0; k<newUpload.size(); k++) {
//						if(k==0) vo.setFile1(newUpload.get(k));
//					}
		//		dbfileVO.setBoardno(vo.getBoardno());
				// DB update
				service.BoardUpdate(vo);
		//		service.BoardFileUpdate(dbfileVO);

				// // DB수정되었을 때
//					if(vo.getDelFile()!=null) {
//						for(String fname:vo.getDelFile()) {
//							fileDelete(path, fname);
//						}
//					}			

				// 글 내용보기로 이동
				String msg = "<script>alert('공지 게시글이 수정되었습니다.\\n글내용보기로 이동합니다');";
				msg += "location.href='/board/notice/noticeView?boardno="+vo.getBoardno()+"';</script>";

				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);

			} catch (Exception e) {
				e.printStackTrace();
				// DB잘못수정했을때
				for (String fname : newUpload) {
					fileDelete(path, fname);
				}

				// 수정페이지로 이동
				String msg = "<script>";
				msg += "alert('글 수정 실패하였습니다'\\n수정폼으로 이동합니다)";
				msg += "history.back();</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
			}
			/*
			 * for(String d:fileList) { System.out.println(d); }
			 */
			return entity;
		}
		
		//글 삭제
		@GetMapping("/board/boardDelete")
		public ResponseEntity<String> boardDelete(int boardno, HttpSession session) {
			
			String userid = (String)session.getAttribute("logId");
			
			String path = session.getServletContext().getRealPath("/upload");
			
			String boardtype= service.getType(boardno);
			System.out.println(boardtype);
			ResponseEntity<String> entity = null;
			HttpHeaders headers = new HttpHeaders();
			headers.add("Content-Type", "text/html; charset=utf-8");
			
			try {
				// 1. 삭제할 레코드의 파일명 얻어오기
				BoardVO dbFileVO = service.getFileName(boardno);
				if(dbFileVO == null) {
					dbFileVO = service.BoardSelect(boardno);
				}
				
				// 2. 레코드 삭제
				service.boardDelete(boardno, userid);
				
				// 3. 파일 삭제
				fileDelete(path, dbFileVO.getFilename1());
				String msg = "<script>alert('글이 삭제되었습니다');";
					   msg += "location.href='/board/SubMenuSelect?type="+boardtype+"';</script>";
						

				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);
				
			}catch(Exception e) {
				e.printStackTrace();
				
				String msg = "<script>alert('글 삭제에 실패하였습니다\\n글 내용보기로 이동합니다');history.back();</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);
			}
			return entity;
			
		}

		
		
}

