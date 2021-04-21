package com.myspring.myapp.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.myapp.member.vo.MemberVO;

public interface MemberController {
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView login(Map<String, String> loginMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView addMember(@ModelAttribute("member") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
}