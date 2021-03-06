package com.myspring.myapp.cart.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

public interface CartController {
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception;
//	public @ResponseBody String addproductInCart(@RequestParam("product_code") String product_code,HttpServletRequest request, HttpServletResponse response)  throws Exception;
	public  @ResponseBody String modifyCartQty(@RequestParam("cart_id") int cart_id,@RequestParam("cart_product_qty") int cart_product_qty,
			                  HttpServletRequest request, HttpServletResponse response)  throws Exception;
//	public ModelAndView removeCartGoods(@RequestParam("cart_id") int cart_id,HttpServletRequest request, HttpServletResponse response)  throws Exception;

	public @ResponseBody String addProductInCart(String product_code, int cart_product_qty, HttpServletRequest request, HttpServletResponse response)
			throws Exception;
	public String deleteProductInCart(String product_code, HttpSession session)
			throws Exception;

	

}
