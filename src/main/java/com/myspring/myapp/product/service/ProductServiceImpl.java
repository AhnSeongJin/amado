package com.myspring.myapp.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.myapp.product.dao.ProductDAO;
import com.myspring.myapp.product.vo.ProductVO;

@Service("productService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<ProductVO> productList() throws Exception {
		List<ProductVO> productList = productDAO.selectProductList();
		return productList;
	}

	@Override
	public int addNewProduct(Map<String, Object> articleMap) throws Exception {
		return productDAO.insertNewProduct(articleMap);
	}
	

}
