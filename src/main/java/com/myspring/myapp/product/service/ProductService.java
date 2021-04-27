package com.myspring.myapp.product.service;

import java.util.List;
import java.util.Map;

import com.myspring.myapp.common.pagination.Pagination;
import com.myspring.myapp.product.vo.ProductVO;

public interface ProductService {

	public List<ProductVO> productList() throws Exception;

	public int addNewProduct(Map<String, Object> articleMap) throws Exception;
	
	public ProductVO viewProduct(String product_code) throws Exception;

	public int getBoardListCnt() throws Exception; //전체 상품 개수 구하기

	public List<ProductVO> getProductList(Pagination pagination) throws Exception; //상품 리스트 구하기

	

}
