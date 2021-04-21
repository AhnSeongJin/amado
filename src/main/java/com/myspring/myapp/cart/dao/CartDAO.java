package com.myspring.myapp.cart.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.myspring.myapp.cart.vo.CartVO;
import com.myspring.myapp.product.vo.ProductVO;


public interface CartDAO {
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException;
	//public List<ProductVO> selectProductList(List<CartVO> cartList) throws DataAccessException;
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException;
	public void insertProductInCart(CartVO cartVO) throws DataAccessException;
	public void updateCartProductQty(CartVO cartVO) throws DataAccessException;
//	public void deleteCartGoods(int cart_id) throws DataAccessException;
	
	public List<ProductVO> selectProductList(String id) throws DataAccessException;

}
