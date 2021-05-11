package com.myspring.myapp.board.cotroller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@RequestMapping(value="/boardList.do", method=RequestMethod.GET)
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
	@RequestMapping(value="/articleRead.do", method=RequestMethod.GET)
	public ModelAndView getArticleRead(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		//System.out.println("articleRead");
		//게시판 글 정보 가져오기
		int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		BoardVO boardVO = boardService.getArticleRead(boardSeq);
		
		mav.addObject("boardVO", boardVO);
		//System.out.println("getArticleRead: "+boardVO);
		return mav;
	}
	
	//게시판 글 쓰기 페이지 이동
	@Override
	@RequestMapping(value="/articleForm.do", method=RequestMethod.GET)
	public ModelAndView articleForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String) request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		return mav;
	}
	
	//게시판 글 등록
	@Override
	@RequestMapping(value="/addNewArticle.do", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(@ModelAttribute("boardVO") BoardVO boardVO, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		
		// 글 등록. 추가될경우 추가한 행 개수 반환(1)
		int result = 0;
		result = boardService.addNewArticle(boardVO);
		
		//ResponseEntity
		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		if(result == 1) { //정상 등록
			message = "<script>";
			message += " alert('새글을 추가했습니다.');";	//alert에 ' 하나 안찍어서 ...
			message += "location.href='" + request.getContextPath() + "/board/boardList.do';";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}else { //등록X
			message = "<script>";
			message += "alert('오류가 발생했습니다. 다시 시도해주세요.);";
			message += "location.href='" + request.getContextPath() + "/board/articleForm.do';";
			message += "</script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		}
		
		return resEnt;
	}
	
	
	
	
	
	
	
	
	
}