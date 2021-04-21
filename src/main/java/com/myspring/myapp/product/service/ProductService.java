package com.myspring.myapp.product.service;

import java.util.List;
import java.util.Map;

import com.myspring.myapp.product.vo.ProductVO;

public interface ProductService {

	public List<ProductVO> productList() throws Exception;

	public int addNewProduct(Map<String, Object> articleMap) throws Exception;

	

}
