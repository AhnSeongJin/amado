package com.myspring.myapp.member.service;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.myapp.member.vo.MemberVO;

public interface MemberService {

	public MemberVO login(Map loginMap) throws Exception;

	public int addMember(MemberVO memberVO) throws DataAccessException;

}
