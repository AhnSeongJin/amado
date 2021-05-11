package com.myspring.myapp.board.service;

import java.util.List;

import com.myspring.myapp.board.vo.BoardVO;
import com.myspring.myapp.board.vo.ReplyVO;
import com.myspring.myapp.common.pagination.Pagination;

public interface BoardService {
	// 전체 게시글 개수 구하기
	public int getBoardListCnt() throws Exception;
	// 게시글 리스트 가져오기
	public List<BoardVO> getBoardList(Pagination pagination) throws Exception;
	// 게시판 글 보기
	public BoardVO getArticleRead(int boardSeq) throws Exception;
	// 게시판 글 등록
	public int addNewArticle(BoardVO boardVO) throws Exception;

	/* ====== 댓글 영역 ====== */
	// 댓글 리스트 가져오기
	public List<ReplyVO> getReplyList(int boardSeq) throws Exception;
	// 댓글 저장
	public int addReply(ReplyVO replyVO) throws Exception;
	// 댓글 수정
	public int updateReply(ReplyVO replyVO) throws Exception;
	// 댓글 삭제
	public int deleteReply(int replySeq) throws Exception;


}
