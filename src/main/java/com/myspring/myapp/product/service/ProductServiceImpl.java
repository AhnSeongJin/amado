package com.myspring.myapp.product.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.myapp.common.pagination.Pagination;
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

	@Override
	public ProductVO viewProduct(String product_code) throws Exception {
		ProductVO productVO = productDAO.selectOneProduct(product_code);
		return productVO;
	}

	//전체 상품 개수 구하기
	@Override
	public int getBoardListCnt() throws Exception {
		int listCnt = productDAO.selectProductListCnt();
		return listCnt;
	}

	//상품 리스트 구하기
	@Override
	public List<ProductVO> getProductList(Pagination pagination) throws Exception {
		return productDAO.getProductList(pagination);
	}
	
	

}
