package com.myspring.myapp.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

public interface ProductController {

	public ModelAndView shop(HttpServletRequest request, HttpServletResponse response) throws Exception;

	public ModelAndView productAdd(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ResponseEntity addNewProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception;
	
	public ModelAndView viewProduct(HttpServletRequest request, HttpServletResponse response) throws Exception;

}
