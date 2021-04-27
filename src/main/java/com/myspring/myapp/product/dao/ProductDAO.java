package com.myspring.myapp.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.myapp.common.pagination.Pagination;
import com.myspring.myapp.product.vo.ProductVO;

public interface ProductDAO {

	public List<ProductVO> selectProductList() throws DataAccessException;

	public int insertNewProduct(Map<String, Object> articleMap) throws DataAccessException;
	
	public ProductVO selectOneProduct(String product_code) throws DataAccessException;

	public int selectProductListCnt() throws DataAccessException; //전체 상품 개수 구하기

	public List<ProductVO> getProductList(Pagination pagination) throws DataAccessException; //상품 리스트 구하기

}
