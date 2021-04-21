package com.myspring.myapp.member.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.myapp.member.vo.MemberVO;

public interface MemberDAO {

	public MemberVO login(Map loginMap) throws DataAccessException;

	public int insertMember(MemberVO memberVO) throws DataAccessException;

}
