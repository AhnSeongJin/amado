package com.myspring.myapp.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.myapp.board.dao.BoardDAO;
import com.myspring.myapp.board.vo.BoardVO;
import com.myspring.myapp.common.pagination.Pagination;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAO boardDAO;
	
	// 전체 게시글 개수 구하기
	@Override
	public int getBoardListCnt() throws Exception {
		return boardDAO.getBoardListCnt();
	}
	
	// 게시글 리스트 가져오기
	@Override
	public List<BoardVO> getBoardList(Pagination pagination) throws Exception {
		return boardDAO.getBoardList(pagination);
	}

	// 게시판 글 보기
	@Override
	public BoardVO getArticleRead(int boardSeq) throws Exception {
		// 조회수 증가
		boardDAO.updateViewCnt(boardSeq);
		return boardDAO.getArticleRead(boardSeq);
	}
	

}
