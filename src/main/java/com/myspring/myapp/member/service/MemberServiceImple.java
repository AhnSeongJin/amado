package com.myspring.myapp.member.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import com.myspring.myapp.member.dao.MemberDAO;
import com.myspring.myapp.member.vo.MemberVO;

@Service("memberService")
public class MemberServiceImple implements MemberService {
	@Autowired
	private MemberDAO memberDAO;

	@Override
	public MemberVO login(Map loginMap) throws Exception {
		return memberDAO.login(loginMap);
	}

	@Override
	public int addMember(MemberVO memberVO) throws DataAccessException {
		return memberDAO.insertMember(memberVO);
	}

}
