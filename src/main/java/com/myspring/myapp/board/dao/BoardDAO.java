package com.myspring.myapp.board.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.myapp.board.vo.BoardVO;
import com.myspring.myapp.common.pagination.Pagination;

public interface BoardDAO {
	// 전체 게시글 개수 구하기
	public int getBoardListCnt() throws DataAccessException;
	// 게시글 리스트 가져오기
	public List<BoardVO> getBoardList(Pagination pagination) throws DataAccessException;
	// 게시판 글 보기
	public BoardVO getArticleRead(int boardSeq) throws DataAccessException;
	// 게시판 글 이동시 조회수 증가
	public void updateViewCnt(int boardSeq) throws DataAccessException;
	

	
}
