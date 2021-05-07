package com.myspring.myapp.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.myapp.board.vo.BoardVO;
import com.myspring.myapp.common.pagination.Pagination;

@Repository("boardDAO")
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSession sqlSession;
	
	// 전체 게시글 개수 구하기
	@Override
	public int getBoardListCnt() throws DataAccessException {
		return sqlSession.selectOne("mapper.board.getBoardListCnt");
	}

	// 게시글 리스트 가져오기
	@Override
	public List<BoardVO> getBoardList(Pagination pagination) throws DataAccessException {
		return sqlSession.selectList("mapper.board.getBoardList", pagination);
	}

	// 게시판 글 보기
	@Override
	public BoardVO getArticleRead(int boardSeq) {
		return sqlSession.selectOne("mapper.board.getArticleRead", boardSeq);
	}

	// 게시글 조회수 증가
	@Override
	public void updateViewCnt(int boardSeq) throws DataAccessException {
		sqlSession.update("mapper.board.updateViewCnt", boardSeq);
	}

	// 게시판 글 등록
	@Override
	public int insertArticle(BoardVO boardVO) throws DataAccessException {
		return sqlSession.insert("mapper.board.insertArticle", boardVO);
	}
	
	

	
	

}
