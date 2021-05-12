<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="productList" value="${productList }" />
<%
  request.setCharacterEncoding("UTF-8");
%> 
<!DOCTYPE html>
<html lang="en">

<head>
	
</head>

<body>

        <div class="shop_sidebar_area">

            <!-- ##### Single Widget ##### -->
            <div class="widget catagory mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">Catagories</h6>

                <!--  Catagories  -->
                <div class="catagories-menu">
                    <ul>
                        <li class="active"><a href="#">Chairs</a></li>
                        <li><a href="#">Beds</a></li>
                        <li><a href="#">Accesories</a></li>
                        <li><a href="#">Furniture</a></li>
                        <li><a href="#">Home Deco</a></li>
                        <li><a href="#">Dressings</a></li>
                        <li><a href="#">Tables</a></li>
                    </ul>
                </div>
            </div>

            <!-- ##### Single Widget ##### -->
            <div class="widget brands mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">Brands</h6>

                <div class="widget-desc">
                    <!-- Single Form Check -->
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="amado">
                        <label class="form-check-label" for="amado">Amado</label>
                    </div>
                    <!-- Single Form Check -->
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="ikea">
                        <label class="form-check-label" for="ikea">Ikea</label>
                    </div>
                    <!-- Single Form Check -->
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="furniture">
                        <label class="form-check-label" for="furniture">Furniture Inc</label>
                    </div>
                    <!-- Single Form Check -->
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="factory">
                        <label class="form-check-label" for="factory">The factory</label>
                    </div>
                    <!-- Single Form Check -->
                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" value="" id="artdeco">
                        <label class="form-check-label" for="artdeco">Artdeco</label>
                    </div>
                </div>
            </div>

            <!-- ##### Single Widget ##### -->
            <div class="widget color mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">Color</h6>

                <div class="widget-desc">
                    <ul class="d-flex">
                        <li><a href="#" class="color1"></a></li>
                        <li><a href="#" class="color2"></a></li>
                        <li><a href="#" class="color3"></a></li>
                        <li><a href="#" class="color4"></a></li>
                        <li><a href="#" class="color5"></a></li>
                        <li><a href="#" class="color6"></a></li>
                        <li><a href="#" class="color7"></a></li>
                        <li><a href="#" class="color8"></a></li>
                    </ul>
                </div>
            </div>

            <!-- ##### Single Widget ##### -->
            <div class="widget price mb-50">
                <!-- Widget Title -->
                <h6 class="widget-title mb-30">Price</h6>

                <div class="widget-desc">
                    <div class="slider-range">
                        <div data-min="10" data-max="1000" data-unit="$" class="slider-range-price ui-slider ui-slider-horizontal ui-widget ui-widget-content ui-corner-all" data-value-min="10" data-value-max="1000" data-label-result="">
                            <div class="ui-slider-range ui-widget-header ui-corner-all"></div>
                            <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                            <span class="ui-slider-handle ui-state-default ui-corner-all" tabindex="0"></span>
                        </div>
                        <div class="range-price">$10 - $1000</div>
                    </div>
                </div>
            </div>
        </div>

        <div class="amado_product_area section-padding-100">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <div class="product-topbar d-xl-flex align-items-end justify-content-between">
                            <!-- Total Products -->
                            <div class="total-products">
                                
                                <div class="view d-flex">
                                    <a href="#"><i class="fa fa-th-large" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-bars" aria-hidden="true"></i></a>
                                </div>
                            </div>
                            <!-- Sorting -->
                            <div class="product-sorting d-flex">
                                <div class="sort-by-date d-flex align-items-center mr-15">
                                    <p>Sort by</p>
                                    <form action="#" method="get">
                                        <select name="select" id="sortBydate">
                                            <option value="value">Date</option>
                                            <option value="value">Newest</option>
                                            <option value="value">Popular</option>
                                        </select>
                                    </form>
                                </div>
                                <div class="view-product d-flex align-items-center">
                                    <p>View</p>
                                    <form action="#" method="get">
                                        <select name="select" id="viewProduct" onchange="fn_viewProduct(this.value);">
                                        	<option>${pagination.listSize }개</option>
                                            <option value="6">6</option>
                                            <option value="12">12</option>
                                            <option value="18">18</option>
                                            <option value="24">24</option>
                                        </select>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="row">
                
                	<!-- 상품 forEach -->
					<c:forEach var="product" items="${productList }" varStatus="productNum">
						<!-- Single Product Area -->
	                    <div class="col-12 col-sm-6 col-md-12 col-xl-6">
	                        <div class="single-product-wrapper">
	                            <!-- Product Image -->
	                            <a href="${contextPath }/product/product_details.do?product_code=${product.product_code }">
		                            <div class="product-img">
			                                <img src="${contextPath}/download.do?product_code=${product.product_code }&imageFileName=${product.image_file_name}"
											id="preview" alt="${product.product_name }">
		                                <!-- Hover Thumb -->
		                                <img class="hover-img" src="${contextPath}/download.do?product_code=${product.product_code }&imageFileName=${product.image_file_name}" alt="">
		                            </div>
	                            </a>
	
	                            <!-- Product Description -->
	                            <div class="product-description d-flex align-items-center justify-content-between">
	                                <!-- Product Meta Data -->
	                                <div class="product-meta-data">
	                                    <div class="line"></div>
	                                    <p class="product-price">${product.product_price }$</p>
	                                    <a href="product-details.html">
	                                        <a href="${contextPath }/product/product_details.do?product_code=${product.product_code }"><h3>${product.product_name }</h3></a>
	                                    </a>
	                                </div>
	                                <!-- Ratings & Cart -->
	                                <div class="ratings-cart text-right">
	                                    <div class="ratings">
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                        <i class="fa fa-star" aria-hidden="true"></i>
	                                    </div>
	                                    <div class="cart">
	                                    	<!-- data-toggle의 tooltip : 링크에 마우스를 올리면 메시지가 나오는 말풍선  -->
	                                        <a href="javascript:add_cart('${product.product_code }')" data-toggle="tooltip" data-placement="left" title="Add to Cart"><img src="${contextPath}/resources/img/core-img/cart.png" alt=""></a>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
					</c:forEach>
					
                </div>
                
                <!-- start 페이지 번호 선택 -->
                <div class="row">
                    <div class="col-12">
                        <nav aria-label="navigation">
                            <ul class="pagination justify-content-end mt-50">
                                <c:if test="${pagination.prev}">
								<li class="page-item"><a class="page-link" href="#"
									onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">이전</a></li>
								</c:if>
								
								<!-- 페이지 번호 forEach -->
								<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}"
									var="idx">
									<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
										<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a>
									</li>
								</c:forEach>
						
								<c:if test="${pagination.next}">
									<li class="page-item">
									<a class="page-link" href="#" onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">다음</a></li>
								</c:if>
                            </ul>
                        </nav>
                    </div>
                </div>
                <!-- end 페이지 번호 선택 -->
                
            </div>
        </div>
	
	<script type="text/javascript">
    	// ajax 이용하여 카트에 담기
    	function add_cart(product_code) {
    		if(${isLogOn == true && member != null }){
    			$.ajax({
        			type: "post",
        			async: false, //false인 경우 동기식으로 처리한다.
        			url: "${contextPath}/cart/addProductInCart.do",
        			data: { product_code: product_code },
        			success: function(data, textStatus) {
        				if(data.trim() == 'add_success') {
        					//팝업창을 이미지 원본사이즈로 띄우기
        					//imagePopup('open');
        					$('#successModal').modal('show');
        				} else if(data.trim() == 'already_existed') {
        					//alert("이미 카트에 등록된 상품입니다.");
        					$('#failureModal').modal('show');
        				}
        			},
        			error: function(data, textStatus) {
        				alert("에러가 발생했습니다."+data);
        			},
        			complete: function(data, textStatus) {
        				//alert("작업을 완료했습니다.");
        			}
        		})
    		} else {
    			alert("로그인후 장바구니에 담을 수 있습니다.");
    		}
    	}
    	
    	//이전 버튼 이벤트
    	function fn_prev(page, range, rangeSize) {
    		var page = ((range - 2) * rangeSize) + 1;
    		var range = range - 1;		

    		var url = "${contextPath}/product/shop.do";
    		url = url + "?page=" + page;
    		url = url + "&range=" + range;

    		location.href = url;
    	}

      //페이지 번호 클릭
    	function fn_pagination(page, range, rangeSize, searchType, keyword) {
    		var url = "${contextPath}/product/shop.do";
    		url = url + "?page=" + page;
    		url = url + "&range=" + range;

    		location.href = url;	
    	}

    	//다음 버튼 이벤트
    	function fn_next(page, range, rangeSize) {
    		var page = parseInt((range * rangeSize)) + 1;
    		var range = parseInt(range) + 1;

    		var url = "${contextPath}/product/shop.do";
    		url = url + "?page=" + page;
    		url = url + "&range=" + range;		

    		location.href = url;
    	}
    	
    	//onchange 한페이지에서 볼 상품 개수 선택
    	function fn_viewProduct(select) {
    		//var select = document.getElementById('viewProduct').value;
    		console.log(select);
    		
    		location.href = "${contextPath}/product/shop.do?viewProduct="+select;
    	}
    	    	

    </script>
