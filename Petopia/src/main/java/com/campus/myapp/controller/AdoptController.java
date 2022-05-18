package com.campus.myapp.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.campus.myapp.service.BoardService;
import com.campus.myapp.vo.BoardVO;
import com.campus.myapp.vo.PagingVO;

@Controller
public class AdoptController {
	ModelAndView mav = new ModelAndView();
	
	@Inject
	BoardService service;
	
	@GetMapping("/board/adopt/adoptList")
	public ModelAndView AdoptListView(PagingVO pvo, BoardVO bvo) {
		//mav.addObject("adoptList", service.BoardSelectList(bvo, "adopt",pvo));

		mav.setViewName("board/adopt/adoptList");
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value="/board/adopt/adoptLists")
	public List<BoardVO> NoticePaging(PagingVO pvo, Model model, @RequestParam(value="startNum", required=false)String startNum) throws Exception{
		System.out.println("입양 페이징");
		
		pvo.setStart(Integer.parseInt(startNum));
		pvo.setEnd(19);
		return service.BoardSelectList("adopt", pvo);
	}
	
	
	

}

