package com.myspring.myapp.board.cotroller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.myapp.board.service.BoardService;
import com.myspring.myapp.board.vo.BoardVO;
import com.myspring.myapp.common.pagination.Pagination;

@Controller("boardController")
@RequestMapping(value="/board")
public class BoardControllerImpl implements BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private BoardVO boardVO;
	
	@Override
	@RequestMapping(value="/boardList", method=RequestMethod.GET)
	public ModelAndView getBoardList(@RequestParam(value="page", required=false, defaultValue="1") int page, @RequestParam(value="range", required=false, defaultValue="1") int range, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		//전체 게시글 개수
		int listCnt = boardService.getBoardListCnt();
		
		//페이징
		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);
		
		// 게시판 리스트 가져오기
		List<BoardVO> boardList = boardService.getBoardList(pagination);
		
		mav.addObject("boardList", boardList); //게시판 리스트
		mav.addObject("pagination", pagination); //페이지 정보
		
		return mav;
	}

	//게시판 글 보기
	@Override
	@RequestMapping(value="/articleRead", method=RequestMethod.GET)
	public ModelAndView getArticleRead(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		//게시판 글 정보 가져오기
		int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		BoardVO boardVO = boardService.getArticleRead(boardSeq);
		
		mav.addObject("boardVO", boardVO);
		System.out.println("getArticleRead: "+boardVO);
		return mav;
	}
	
	//게시판 글 쓰기 페이지 이동
	@Override
	public ModelAndView articleForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}

	//게시판 글 등록
	@Override
	public ModelAndView addNewArticle(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	
	
	
	
	
	
	
	
}