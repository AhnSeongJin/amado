package com.myspring.myapp.board.cotroller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.myapp.board.vo.BoardVO;

public interface BoardController {
	// 게시판 리스트
	public ModelAndView getBoardList(int page, int range, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 게시판 글 보기
	public ModelAndView getArticleRead(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 게시판 글 쓰기 페이지 이동
	public ModelAndView articleForm(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 게시판 글 등록
	public ResponseEntity addNewArticle(BoardVO boardVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
