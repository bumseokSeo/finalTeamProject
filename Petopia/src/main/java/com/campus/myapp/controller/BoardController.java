package com.campus.myapp.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.nio.charset.Charset;
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
	public ModelAndView SubMenuSelect(PagingVO pVO, String type, BoardVO vo, HttpSession session) {
		String userid = (String) session.getAttribute("logId");
		ModelAndView mav = new ModelAndView();
		
		vo.setMyWriteCnt(service.myWriteCnt(userid));
		vo.setMyReviewCnt(service.myReviewCnt(userid));
		//게시판 타입
		mav.addObject("type", type);
		mav.addObject("vo", vo);
		mav.setViewName("board/SubMenuSelect");
		return mav;
	}
	
	@GetMapping("/board/adopt/adoptList")
	public ModelAndView AdoptList(PagingVO pVO) {
		ModelAndView mav = new ModelAndView();

		mav.setViewName("/board/adopt/adoptList");
		return mav;
	}
	
	// 게시판 페이징 모음
	
	// 검색 기능
	//공지
	@ResponseBody
	@GetMapping("/board/notice/noticeSearch")
	public ModelAndView Nsearch(String searchKey, String searchWord, String type) {
		ModelAndView mav = new ModelAndView();
		//게시판 타입
		mav.addObject("type", type);
		mav.setViewName("/board/SubMenuSelect");
		return mav;
	}
	//나눔
	@GetMapping("/board/share/shareSearch")
	public ModelAndView Ssearch(String searchKey, String searchWord, String type) {
		ModelAndView mav = new ModelAndView();
		//게시판 타입
		mav.addObject("type", type);
		mav.setViewName("/board/SubMenuSelect");
		return mav;
	}
	//정보
	@GetMapping("/board/info/infoSearch")
	public ModelAndView Isearch(String searchKey, String searchWord, String type) {
		ModelAndView mav = new ModelAndView();
		//게시판 타입
		mav.addObject("type", type);
		mav.setViewName("/board/SubMenuSelect");
		return mav;
	}
	//산책
	@GetMapping("/board/walk/walkSearch")
	public ModelAndView Wsearch(String searchKey, String searchWord, String type) {
		ModelAndView mav = new ModelAndView();
		//게시판 타입
		mav.addObject("type", type);
		mav.setViewName("/board/SubMenuSelect");
		return mav;
	}
	//자랑
	@GetMapping("/board/boast/boastSearch")
	public ModelAndView Bsearch(String searchKey, String searchWord, String type) {
		ModelAndView mav = new ModelAndView();
		//게시판 타입
		mav.addObject("type", type);
		mav.setViewName("/board/SubMenuSelect");
		return mav;
	}
	//건의
	@GetMapping("/board/suggest/suggestSearch")
	public ModelAndView search(String searchKey, String searchWord, String type) {
		ModelAndView mav = new ModelAndView();
		//게시판 타입
		mav.addObject("type", type);
		mav.setViewName("/board/SubMenuSelect");
		return mav;
	}
	//입양
	@GetMapping("/board/adopt/adoptSearch")
	public ModelAndView ADsearch(String searchKey, String searchWord) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/board/adopt/adoptList");
		return mav;
	}
	
	//notice
	@ResponseBody
	@RequestMapping(value="/board/notice/noticeLists")
	public List<BoardVO> NoticePaging(PagingVO pvo, Model model, @RequestParam(value="startNum", required=false)String startNum) throws Exception{	
		pvo.setStart(Integer.parseInt(startNum));
		pvo.setEnd(19);
		List<BoardVO> arr=service.BoardSelectList("notice", pvo);
		return arr;
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
		pvo.setEnd(12);
		return service.BoardSelectList("share", pvo);
	}
	
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/share/searchLists")
	public List<BoardVO> searchMoreViewS(String searchKey, String searchWord,@RequestParam(value = "startNum", required = false) String startNum) throws Exception {
		int start = Integer.parseInt(startNum);
		int end = 12;

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
		pvo.setEnd(12);
		return service.BoardSelectList("boast", pvo);
	}
	
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/boast/searchLists")
	public List<BoardVO> searchMoreViewB(String searchKey, String searchWord,@RequestParam(value = "startNum", required = false) String startNum) throws Exception {
		int start = Integer.parseInt(startNum);
		int end = 12;

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
		pvo.setEnd(12);
		List<BoardVO> lst= service.BoardSelectList("adopt", pvo);
		return lst;
	}
		
	@ResponseBody // Ajax
	@RequestMapping(value = "/board/adopt/searchLists")
	public List<BoardVO> searchMoreViewAD(String searchKey, String searchWord,@RequestParam(value = "startNum", required = false) String startNum) throws Exception {
		int start = Integer.parseInt(startNum);
		int end = 12;
		return service.boardSearch(searchKey, "%"+searchWord+"%", start, end, "adopt");
	}
	
	
	
	
	//글쓰기 폼 이동
	@GetMapping("/board/boardWrite")
	public ModelAndView noticeWrite(String type) {
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("type",type);
		
		if(type.equals("suggest")) {
			mav.setViewName("/board/suggest/suggestWrite");
		}
		if(type.equals("adopt")) {
			mav.setViewName("/board/adopt/adoptWrite");
		}
		
		return mav;
	}
	
	//글쓰기 이미지 업로드
	
	@RequestMapping("/board/ckeditorImageUpload")
	public void fileUpload(MultipartFile upload,HttpServletRequest req, HttpServletResponse res) { 
		
		String uploadPath = req.getSession().getServletContext().getRealPath("/upload/board/");
		
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
            String fileUrl = "/upload/board/" + uuid + "." + extension;

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
	public ResponseEntity<String> boardWriteOk(BoardVO vo, HttpServletRequest request, String type) {
		vo.setUserid((String)request.getSession().getAttribute("logId"));//아이디 등록
	
		ResponseEntity<String> entity = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
		
		String path = request.getSession().getServletContext().getRealPath("/upload/board/"); // 파일업로드를 위한 업로드 위치의 절대주소
		
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
			
			//게시판 회귀 선별조건
			vo.setBoardno(service.BoardNum()+1); // 번호 매기도록 하는것.
			
			vo.setBoardtype(vo.getBoardtype());
			
			
			
			service.BoardInsert(vo);
			
			
		
			if(vo.getBoardtype().equals("notice")) {
			String msg = "<script>alert('공지사항 등록완료');location.href='/board/SubMenuSelect?type=notice';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			if(vo.getBoardtype().equals("info")) {
			String msg = "<script>alert('정보게시판 등록완료');location.href='/board/SubMenuSelect?type=info';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			if(vo.getBoardtype().equals("share")) {
			String msg = "<script>alert('나눔게시판 등록완료');location.href='/board/SubMenuSelect?type=share';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			if(vo.getBoardtype().equals("walk")) {
			String msg = "<script>alert('산책게시판 등록완료');location.href='/board/SubMenuSelect?type=walk';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			if(vo.getBoardtype().equals("boast")) {
			String msg = "<script>alert('자랑게시판 등록완료');location.href='/board/SubMenuSelect?type=boast';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			if(vo.getBoardtype().equals("suggest")) {
			service.BoardInsertSuggest(vo);
			String msg = "<script>alert('건의게시판 등록완료');location.href='/board/SubMenuSelect?type=suggest';</script>";
			entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
			}
			if(vo.getBoardtype().equals("adopt")) {
			service.BoardInsertAdopt(vo);
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
			service.hitCount(boardno); //조회수 증가
			String BF = service.getType(boardno);
			mav.addObject("vo", service.BoardView(boardno,BF));
			user = ((String)request.getSession().getAttribute("logId"));
			mav.addObject("user", user);

			mav.setViewName("/board/"+BF+"/"+BF+"View");
			return mav;
		}
		
		//글 수정
		@GetMapping("/board/boardEdit")
		public ModelAndView BoardEdit(int boardno, @RequestParam("type")String type) {
			
			ModelAndView mav = new ModelAndView();
			mav.addObject("vo", service.BoardView(boardno, type));
			mav.addObject("type",type);
			if(type.equals("suggest")) {
			mav.setViewName("/board/suggest/suggestEdit");
			}else if(type.equals("adopt")) {
			mav.setViewName("/board/adopt/adoptEdit");
			}else {
			mav.setViewName("/board/boardEdit");
			}
			return mav;
		}
	
		//수정(DB)
		@PostMapping("/board/boardEditOk")
		public ResponseEntity<String> reviewEditOk(BoardVO vo, HttpSession session, HttpServletRequest req) {
			vo.setUserid((String)req.getSession().getAttribute("logId"));//아이디 등록
		
			ResponseEntity<String> entity = null;
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(new MediaType("text","html", Charset.forName("UTF-8")));
			
			String path = req.getSession().getServletContext().getRealPath("/upload/board/"); // 파일업로드를 위한 업로드 위치의 절대주소
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
				
				//게시판 회귀 선별조건
				String type = service.getType(vo.getBoardno());
				
				service.BoardUpdate(vo);
				
				
				String msg = "<script>location.href='/board/boardView?boardno="+vo.getBoardno()+"';</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.OK);	//200
				
				
			}catch(Exception e) {
				e.printStackTrace();
					fileDelete(path, vo.getFilename1());
				String msg = "<script>alert('글 등록 실패');history.back();</script>";
				entity = new ResponseEntity<String>(msg, headers, HttpStatus.BAD_REQUEST);	//400
			}
			return entity;
		}
		//글 삭제
		@GetMapping("/board/boardDelete")
		public ResponseEntity<String> boardDelete(int boardno, HttpSession session) {
			
			String userid = (String)session.getAttribute("logId");
			
			String path = session.getServletContext().getRealPath("/upload/board/");
			
			String boardtype= service.getType(boardno);
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
