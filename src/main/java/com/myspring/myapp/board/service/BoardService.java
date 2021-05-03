package com.myspring.myapp.board.service;

import java.util.List;

import com.myspring.myapp.board.vo.BoardVO;
import com.myspring.myapp.common.pagination.Pagination;

public interface BoardService {
	// 전체 게시글 개수 구하기
	public int getBoardListCnt() throws Exception;
	// 게시글 리스트 가져오기
	public List<BoardVO> getBoardList(Pagination pagination) throws Exception;
	// 게시판 글 보기
	public BoardVO getArticleRead(int boardSeq) throws Exception;



}
