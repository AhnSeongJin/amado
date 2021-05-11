package com.myspring.myapp.board.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("relpyVO")
public class ReplyVO {
	private int replySeq;
	private int boardSeq;
	private String id;
	private String replyContent;
	private Date regDate;
	private Date modDate;
			
	public int getReplySeq() {
		return replySeq;
	}
	public void setReplySeq(int replySeq) {
		this.replySeq = replySeq;
	}
	public int getBoardSeq() {
		return boardSeq;
	}
	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getModDate() {
		return modDate;
	}
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [replySeq=" + replySeq + ", boardSeq=" + boardSeq + ", id=" + id + ", replyContent="
				+ replyContent + ", regDate=" + regDate + ", modDate=" + modDate + "]";
	}
	
	
}
