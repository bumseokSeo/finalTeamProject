package com.campus.myapp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.BoardService;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;


@Controller
public class BoardController {

	@Value("${image.upload.path}")
	private String uploadPath;

	@Value("${resource.handler}")
	private String resourceHandler;
	
	@Inject
	BoardService service;
	
	@GetMapping("/board/SubMenuSelect")
	public ModelAndView SubMenuSelect(PagingVO pVO, String type) {
		ModelAndView mav = new ModelAndView();
		System.out.println("게시판 컨트롤러 ");
		
		//게시판 타입
		mav.addObject("type", type);

		mav.setViewName("board/SubMenuSelect");
		return mav;
	}
	
	// 게시판 페이징 모음
	
	// 검색 기능
	@GetMapping("/board/notice/noticeSearch")
	public ModelAndView search(String searchKey, String searchWord, String type) {
		System.out.println("검색시작");
		ModelAndView mav = new ModelAndView();
		//게시판 타입
		mav.addObject("type", type);
		mav.setViewName("/board/SubMenuSelect");
		return mav;
	}
	
	//notice
	@ResponseBody
	@RequestMapping(value="/board/notice/noticeLists")
	public List<BoardVO> NoticePaging(PagingVO pvo, Model model, @RequestParam(value="startNum", required=false)String startNum) throws Exception{	
		pvo.setStart(Integer.parseInt(startNum));
		pvo.setEnd(19);
		return service.BoardSelectList("notice", pvo);
	}
		
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/notice/searchLists")
	public List<BoardVO> searchMoreViewN(String searchKey, String searchWord,@RequestParam(value = "startNum", required = false) String startNum) throws Exception {
		int start = Integer.parseInt(startNum);
		int end = 19;

		
		return service.boardSearch(searchKey, "%"+searchWord+"%", start, end, "notice");
	}
	
	//info
	@ResponseBody
	@RequestMapping(value="/board/info/infoLists")
	public List<BoardVO> InfoPaging(PagingVO pvo, Model model, @RequestParam(value="startNum", required=false)String startNum) throws Exception{	
		pvo.setStart(Integer.parseInt(startNum));
		pvo.setEnd(19);
		return service.BoardSelectList("info", pvo);
	}
		
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/info/searchLists")
	public List<BoardVO> searchMoreViewI(String searchKey, String searchWord,@RequestParam(value = "startNum", required = false) String startNum) throws Exception {
		int start = Integer.parseInt(startNum);
		int end = 19;

		
		return service.boardSearch(searchKey, "%"+searchWord+"%", start, end, "info");
	}
	
	//share
	@ResponseBody
	@RequestMapping(value="/board/share/shareLists")
	public List<BoardVO> SharePaging(PagingVO pvo, Model model, @RequestParam(value="startNum", required=false)String startNum) throws Exception{
		pvo.setStart(Integer.parseInt(startNum));
		pvo.setEnd(8);
		return service.BoardSelectList("share", pvo);
	}
	
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/share/searchLists")
	public List<BoardVO> searchMoreViewS(String searchKey, String searchWord,@RequestParam(value = "startNum", required = false) String startNum) throws Exception {
		int start = Integer.parseInt(startNum);
		int end = 8;

		return service.boardSearch(searchKey, "%"+searchWord+"%", start, end, "share");
	}
	//walk
	@ResponseBody
	@RequestMapping(value="/board/walk/walkLists")
	public List<BoardVO> WalkPaging(PagingVO pvo, Model model, @RequestParam(value="startNum", required=false)String startNum) throws Exception{
		pvo.setStart(Integer.parseInt(startNum));
		pvo.setEnd(19);
		return service.BoardSelectList("walk", pvo);
	}
		
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/walk/searchLists")
	public List<BoardVO> searchMoreViewW(String searchKey, String searchWord,@RequestParam(value = "startNum", required = false) String startNum) throws Exception {
		int start = Integer.parseInt(startNum);
		int end = 19;

		
		return service.boardSearch(searchKey, "%"+searchWord+"%", start, end, "walk");
	}
	//boast
	@ResponseBody
	@RequestMapping(value="/board/boast/boastLists")
	public List<BoardVO> BoastPaging(PagingVO pvo, Model model, @RequestParam(value="startNum", required=false)String startNum) throws Exception{
		pvo.setStart(Integer.parseInt(startNum));
		pvo.setEnd(8);
		return service.BoardSelectList("boast", pvo);
	}
	
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/boast/searchLists")
	public List<BoardVO> searchMoreViewB(String searchKey, String searchWord,@RequestParam(value = "startNum", required = false) String startNum) throws Exception {
		int start = Integer.parseInt(startNum);
		int end = 8;

		return service.boardSearch(searchKey, "%"+searchWord+"%", start, end, "boast");
	}
	//suggest
	@ResponseBody
	@RequestMapping(value="/board/suggest/suggestLists")
	public List<BoardVO> SuggestPaging(PagingVO pvo, Model model, @RequestParam(value="startNum", required=false)String startNum) throws Exception{	
		pvo.setStart(Integer.parseInt(startNum));
		pvo.setEnd(19);
		return service.BoardSelectList("suggest", pvo);
	}
		
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/suggest/searchLists")
	public List<BoardVO> searchMoreViewSu(String searchKey, String searchWord,@RequestParam(value = "startNum", required = false) String startNum) throws Exception {
		int start = Integer.parseInt(startNum);
		int end = 19;

		
		return service.boardSearch(searchKey, "%"+searchWord+"%", start, end, "suggest");
	}
	//adopt
	@ResponseBody
	@RequestMapping(value="/board/adopt/adoptListMethod")
	public List<BoardVO> AdoptPaging(PagingVO pvo, Model model, @RequestParam(value="startNum", required=false)String startNum) throws Exception{
		pvo.setStart(Integer.parseInt(startNum));
		pvo.setEnd(8);
		List<BoardVO>  lst= service.BoardSelectList("adopt", pvo);
		for(BoardVO vo  : lst) {
			System.out.println(vo.getFilename1());
		}
		return lst;
	}
		
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/adopt/searchLists")
	public List<BoardVO> searchMoreViewAD(String searchKey, String searchWord,@RequestParam(value = "startNum", required = false) String startNum) throws Exception {
		int start = Integer.parseInt(startNum);
		int end = 8;

		return service.boardSearch(searchKey, "%"+searchWord+"%", start, end, "adopt");
	}
	
	
	
	
	//글쓰기 폼 이동
	@GetMapping("/board/boardWrite")
	public ModelAndView noticeWrite(String type) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("type",type);
		return mav;
		
	}
	
	//글쓰기 이미지 업로드
	
	@RequestMapping("/board/ckeditorImageUpload")
	public void fileUpload(MultipartFile upload,HttpServletRequest req, HttpServletResponse res) { 
		
		String uploadPath = req.getSession().getServletContext().getRealPath("/upload/");
		
		OutputStream out = null;
        PrintWriter printWriter = null;

        res.setCharacterEncoding("utf-8");
        res.setContentType("text/html;charset=utf-8");

        try{

            UUID uuid = UUID.randomUUID();
            String extension = FilenameUtils.getExtension(upload.getOriginalFilename());

            byte[] bytes = upload.getBytes();

            // 실제 이미지 저장 경로
            String imgUploadPath = uploadPath + File.separator + uuid + "." + extension;

            // 이미지 저장
            out = new FileOutputStream(imgUploadPath);
            out.write(bytes);
            out.flush();

            // ckEditor 로 전송
            printWriter = res.getWriter();
            String callback = req.getParameter("CKEditorFuncNum");
            String fileUrl = "/upload/" + uuid + "." + extension;

            printWriter.println("<script type='text/javascript'>"
                    + "window.parent.CKEDITOR.tools.callFunction("
                    + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
                    +"</script>");

            printWriter.flush();

        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                if(out != null) { out.close(); }
                if(printWriter != null) { printWriter.close(); }
            } catch(IOException e) { e.printStackTrace(); }
        }
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
			//DB등록
			Pattern pattern  =  Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>");
			String content = vo.getContent();
			Matcher match = pattern.matcher(content);

			String imgTag = "/img/Logo(main).png";
			String result = imgTag;
			if(match.find()){ // 이미지 태그를 찾았다면,,
			    imgTag = match.group(0); // 글 내용 중에 첫번째 이미지 태그를 뽑아옴.
			    result = imgTag.substring(imgTag.indexOf("src=")+5,(imgTag.substring(imgTag.indexOf("src=")).indexOf("style")+(imgTag.indexOf("src=")-2)));
			}			
			vo.setFilename1(result);
			System.out.println(result);
			
			//게시판 회귀 선별조건
			
			
			String userid = (String)request.getSession().getAttribute("logId");
			vo.setBoardno(service.BoardNum(userid));
			
			service.BoardInsert(vo);
			String type = service.getType(vo.getBoardno());
			System.out.println(type);
			
			
			if(type.equals("notice")) {
			String msg = "<script>alert('공지사항 등록완료');location.href='/board/SubMenuSelect?type=notice';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			if(type.equals("info")) {
			String msg = "<script>alert('정보게시판 등록완료');location.href='/board/SubMenuSelect?type=info';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			if(type.equals("share")) {
			String msg = "<script>alert('나눔게시판 등록완료');location.href='/board/SubMenuSelect?type=share';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			if(type.equals("walk")) {
			String msg = "<script>alert('산책게시판 등록완료');location.href='/board/SubMenuSelect?type=walk';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			if(type.equals("boast")) {
			String msg = "<script>alert('자랑게시판 등록완료');location.href='/board/SubMenuSelect?type=boast';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			if(type.equals("suggest")) {
			String msg = "<script>alert('건의게시판 등록완료');location.href='/board/SubMenuSelect?type=suggest';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			if(type.equals("adopt")) {
			String msg = "<script>alert('입양게시판 등록완료');location.href='/board/adopt/adoptList';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			
		}catch(Exception e) {
			e.printStackTrace();
				fileDelete(path, vo.getFilename1());
			String msg = "<script>alert('글 등록 실패');history.back();</script>";
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
		
		//글 내용보기(공통)
		@GetMapping("/board/boardView")
		public ModelAndView boardView(int boardno, String user, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			System.out.println("조회수 증가");
			service.hitCount(boardno); //조회수 증가
			mav.addObject("vo", service.BoardView(boardno));
			user = ((String)request.getSession().getAttribute("logId"));
			mav.addObject("user", user);
			
			String BF = service.getType(boardno);
			System.out.println(BF);
			

			mav.setViewName("/board/"+BF+"/"+BF+"View");
			return mav;
		}
		
		//글 수정
		@GetMapping("/board/boardEdit")
		public ModelAndView BoardEdit(int boardno) {
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("vo", service.BoardView(boardno));
			mav.setViewName("/board/boardEdit");
			return mav;
		}
	
		//수정(DB)
		@PostMapping("/board/boardEditOk")
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
				
				//조건걸기
				String BF = vo.getBoardtype();
				System.out.println(BF);
				
				String msg = "<script>alert('공지 게시글이 수정되었습니다.\\n글내용보기로 이동합니다');";
				
				//선별조건
				if(BF.equals("notice")) {
				msg = "location.href='/board/notice/noticeView?boardno="+vo.getBoardno()+"';</script>";
				}
				if(BF.equals("share")) {
				msg = "location.href='/board/share/shareView?boardno="+vo.getBoardno()+"';</script>";
				}
				if(BF.equals("adopt")) {
				msg = "location.href='/board/adopt/adoptView?boardno="+vo.getBoardno()+"';</script>";
				}
				
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
