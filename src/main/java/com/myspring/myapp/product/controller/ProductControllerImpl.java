package com.myspring.myapp.product.controller;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.myapp.common.pagination.Pagination;
import com.myspring.myapp.product.service.ProductService;
import com.myspring.myapp.product.vo.ProductVO;

@Controller("productController")
@RequestMapping(value="/product")
public class ProductControllerImpl implements ProductController {
	private static final String ARTICLE_IMAGE_REPO = "C:\\repository\\shop\\article_image";
	@Autowired
	private ProductService productService;
	@Autowired
	private ProductVO productVO;
	
	//리스트 보기(페이징X), 상품리스트
//	@Override
//	@RequestMapping(value = "/shop.do", method = {RequestMethod.GET, RequestMethod.POST})
//	public ModelAndView shop(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		String viewName = (String)request.getAttribute("viewName");
//		List productList = productService.productList();
//		ModelAndView mav = new ModelAndView(viewName);
//		mav.addObject("productList", productList);
//		System.out.println("productController: "+viewName);
//		return mav;
//	}
	
	//리스트 보기(페이징 처리), 상품리스트
	@Override
	@RequestMapping(value = "/shop.do", method = RequestMethod.GET)
	public ModelAndView getProductList(@RequestParam(value="page", required=false, defaultValue="1") int page, @RequestParam(value="range", required=false, defaultValue="1") int range, @RequestParam(value="viewProduct", required=false, defaultValue="6") int viewProduct, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		
		//전체 상품 개수
		int listCnt = productService.getBoardListCnt();
		
		//Pagination 객체 생성, 페이지당 상품 몇개씩 볼건지 값 받음 default=6
		Pagination pagination = new Pagination(viewProduct);
		//최초 페이지 이동시는 defualtValue 설정값으로
		pagination.pageInfo(page, range, listCnt);
		
		List<ProductVO> productList = productService.getProductList(pagination);
		
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("pagination", pagination); //페이지 정보
		mav.addObject("productList", productList); //상품 정보
		
		return mav;
	}
	
	// 상품 등록 페이지
	@RequestMapping(value = "/product_add.do", method = RequestMethod.GET)
	public ModelAndView productAdd(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	// 상품 등록하기
	@Override
	@RequestMapping(value = "/addNewProduct.do", method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewProduct(MultipartHttpServletRequest multipartRequest, HttpServletResponse response)
			throws Exception {
		multipartRequest.setCharacterEncoding("utf-8");
		
		Map<String, Object> articleMap = new HashMap<String, Object>();
		Enumeration enu = multipartRequest.getParameterNames();
		while (enu.hasMoreElements()) {
			String name = (String) enu.nextElement();
			String value = multipartRequest.getParameter(name);
			articleMap.put(name, value);
		}
		System.out.println("이미지파일전: "+articleMap);
		System.out.println("multipartRequest: "+multipartRequest);

		String imageFileName = upload(multipartRequest);
//		HttpSession session = multipartRequest.getSession();
//		ProductVO productVO = (ProductVO) session.getAttribute("product");
//		String id = memberVO.getId();
//		articleMap.put("parentNO", 0);
//		articleMap.put("id", id);
		articleMap.put("image_file_name", imageFileName);

		String message;
		ResponseEntity resEnt = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			int product = productService.addNewProduct(articleMap);
			if (imageFileName != null && imageFileName.length() != 0) {
				File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
				File destDir = new File(ARTICLE_IMAGE_REPO + "\\" + articleMap.get("product_code"));
				FileUtils.moveFileToDirectory(srcFile, destDir, true);
			}

			message = "<script>";
			message += " alert('새글을 추가했습니다.');";
			message += " location.href='" + multipartRequest.getContextPath() + "/product/product_add.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			File srcFile = new File(ARTICLE_IMAGE_REPO + "\\" + "temp" + "\\" + imageFileName);
			srcFile.delete();

			message = " <script>";
			message += " alert('오류가 발생했습니다. 다시 시도해 주세요');');";
			message += " location.href='" + multipartRequest.getContextPath() + "/product/product_add.do'; ";
			message += " </script>";
			resEnt = new ResponseEntity(message, responseHeaders, HttpStatus.CREATED);
			e.printStackTrace();
		}
		return resEnt;
	}
	
	//상품 상세보기
	@Override
	@RequestMapping(value = "/product_details", method = RequestMethod.GET)
	public ModelAndView viewProduct(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("productController: /product/product_details");
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		
		String product_code = request.getParameter("product_code");
		productVO = productService.viewProduct(product_code);
		mav.addObject("productVO", productVO);
		return mav;
	}
	
	
	/* ========= 아래는 사용 메소드들 ========= */
	
	// 한개 이미지 업로드하기
	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		String imageFileName= null;
		Iterator<String> fileNames = multipartRequest.getFileNames();
		
		while(fileNames.hasNext()){
			String fileName = fileNames.next();
			MultipartFile mFile = multipartRequest.getFile(fileName);
			imageFileName=mFile.getOriginalFilename();
			File file = new File(ARTICLE_IMAGE_REPO +"\\"+ fileName);
			if(mFile.getSize()!=0){ //File Null Check
				if(! file.exists()){ //경로상에 파일이 존재하지 않을 경우
					if(file.getParentFile().mkdirs()){ //경로에 해당하는 디렉토리들을 생성
							file.createNewFile(); //이후 파일 생성
					}
				}
				// temp 폴더 직접 생성
				// 임시로 저장된 multipartFile을 실제 파일로 전송
				mFile.transferTo(new File(ARTICLE_IMAGE_REPO +"\\"+"temp"+ "\\"+imageFileName));
			}
			System.out.println("mFile: "+mFile+" file: "+file);
		}
		System.out.println("upload() 성공");
		return imageFileName;
	}
	
	//페이지 이름 얻는 메소드
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {			
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}

}
