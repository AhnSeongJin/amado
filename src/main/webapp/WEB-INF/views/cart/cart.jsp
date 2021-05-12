<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<c:set var="cart" value="${cartMap.myCartList }" />
<c:set var="img" value="${cartMap.myProductList }" />
<!DOCTYPE html>
<html lang="en">

<head>
<body>

        <div class="cart-table-area section-padding-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12 col-lg-8">
                        <div class="cart-title mt-50">
                            <h2>Shopping Cart</h2>
                        </div>

                        <div class="cart-table clearfix">
                        	<c:choose>
                          		<c:when test="${cartMap != null && isLogOn == true }">                          			
                          			<table class="table table-responsive text-center">
		                                <thead>
		                                    <tr>
		                                        <th></th>
		                                        <th>Name</th>
		                                        <th>Price</th>
		                                        <th>Quantity</th>
		                                    </tr>
		                                </thead>
                                		<tbody>
                                			<c:forEach var="cart" items="${cartMap.myCartList }" varStatus="cnt">
		                                		<c:set var="product" value="${cartMap.myProductList[cnt.index] }" />
		                                		<tr>
			                                        <td class="cart_product_img">
			                                            <a href="#"><img src="${contextPath}/download.do?product_code=${product.product_code }&imageFileName=${product.image_file_name}" alt="Product"></a>
			                                        </td>
			                                        <td class="cart_product_desc">
			                                            <h5>${product.product_name }</h5>
			                                        </td>
			                                        <td class="price">
			                                            <span>$<span id="price${cnt.count }">${product.product_price*cart.cart_product_qty }</span></span>
			                                        </td>
			                                        <td class="qty">
			                                            <div class="qty-btn d-flex row justify-content-center">
			                                                <p>Qty</p>
			                                                <div class="quantity">
			                                                    <span class="qty-minus" onclick="qty_minus(${cart.cart_id }, ${cnt.count }, ${product.product_price*cart.cart_product_qty })"><i class="fa fa-minus" aria-hidden="true"></i></span>
			                                                    <input type="number" class="qty-text" id="qty${cnt.count }" step="1" min="1" max="300" name="quantity" value="${cart.cart_product_qty }" onchange="change(${cart.cart_id }, this.value, ${product.product_price*cart.cart_product_qty })">
			                                                    <span class="qty-plus" onclick="qty_plus(${cart.cart_id }, ${cnt.count }, ${product.product_price*cart.cart_product_qty })"><i class="fa fa-plus" aria-hidden="true"></i></span>
			                                                </div>
			                                            </div>
			                                            <div class="row justify-content-center">
			                                            	<button class="btn" onclick="btn_delete('${product.product_code}');">삭제</button>
			                                            </div>
			                                        </td>
			                                    </tr>
		                                	</c:forEach>
	                                	</tbody>
		                            </table>
                          		</c:when>
                          		<c:otherwise>
		                            <div>
                          				<h3 class="text-center mt-5">장바구니에 상품이 없습니다.</h3>
                          			</div>
                           		</c:otherwise>
                           	</c:choose>
                        </div>
                    </div>
                    <div class="col-12 col-lg-4">
                        <div class="cart-summary">
                            <h5>Cart Total</h5>
                            <ul class="summary-table">
                                <li><span>subtotal:</span> <span id="subtotal">0</span></li>
                                <li><span>delivery:</span> <span>Free</span></li>
                                <li><span>total:</span> <span id="total"></span></li>
                            </ul>
                            <div class="cart-btn mt-100">
                                <a href="cart.html" class="btn amado-btn w-100">Checkout</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Main Content Wrapper End ##### -->

    <script type="text/javascript">
    	var arr_total = new Array(); //각 상품 합계 담을 배열
    	var mod_price = "";
    	<c:forEach var="cart" items="${cartMap.myCartList }" varStatus="cnt">
    		<c:set var="product" value="${cartMap.myProductList[cnt.index] }" />
    			//각 상품 가격과 수량 곱해서 배열에 담기
    			arr_total.push(${product.product_price*cart.cart_product_qty});
    	</c:forEach>
    	var total_price = 0; // 총 금액 담을 변수
    	while(arr_total.length){
    		total_price += arr_total.pop(); //값 더하면서 배열 요소 삭제
    	}
    	console.log("total_price:", total_price, "arr_total:", arr_total);
    	
    	// 페이지 로딩시
    	document.addEventListener("DOMContentLoaded", function(){
    		if(${isLogOn == true}){
    			//최초 DB값을 계산한 총 금액 넣기
        		$('#total, #subtotal').text('$'+total_price);
    		}
    	});
    	
    	function change(cart_id, qty, price){
    		//cart_id, qty : DB변경할 쿼리문에 들어갈 값
    		//price : DB수정후 view에서 가격 수정할 상품 1개 가격(금액 = 가격 * 수량)
    		
    		//ajax로 수량 변경
    		$.ajax({
	    		type : "post",
	    		async : true, //false인 경우 동기식으로 처리한다.
	    		url : "${contextPath}/cart/modifyCartQty.do",
	    		data : {
	    			cart_id:cart_id,
	    			cart_product_qty:qty
	    		},
	    		
	    		success : function(data, textStatus) {
	    			//alert(data);
	    			if(data.trim()=='modify_success'){
	    				//alert("수량을 변경했습니다!!");
	    			}else{
	    				alert("다시 시도해 주세요!!");
	    			}
	    			
	    		},
	    		error : function(data, textStatus) {
	    			alert("에러가 발생했습니다."+data);
	    		},
	    		complete : function(data, textStatus) {
	    			//alert("작업을완료 했습니다");
	    		}
	    	}); //end ajax	
	    	
    		<c:forEach var="cart" items="${cartMap.myCartList }" varStatus="cnt">
	    		<c:set var="product" value="${cartMap.myProductList[cnt.index] }" />
	    			//ajax로 수정후 다시 가격설정
	    			//각 상품별 금액합 구해서 값 넣어준다.
	    			var single_qty = document.getElementById('qty'+${cnt.count}).value;
	    			single_total = ${product.product_price}*single_qty;
	    			$('#price${cnt.count}').text(single_total);
	    			//각 상품별 합계 배열에 넣기
	    			arr_total.push(single_total);
	    	</c:forEach>
	    	console.log("")
	    	total_price = 0; //초기화
	    	while(arr_total.length){
	    		total_price += arr_total.pop(); //값 더하면서 배열 요소 삭제
	    	}
	    	$('#total, #subtotal').text('$'+total_price);
    	}
    	
		// 버튼 수량 변경
		function qty_minus(cart_id, count, price) {
			//cart_id, price : change 메소드에 넣어줄 매개변수
			//count: 클릭한 상품값 알기위한 값
			
			var effect = document.getElementById('qty'+count); //상품구분하기위해 count 사용
			var qty = effect.value; 
			//console.log('버튼 수량변경:', cart_id, qty, price);
			//1보다 큰 수에서만 실행
			if( !isNaN( qty ) && qty > 1 ) {
				effect.value--;
			}else{
				alert("최소수량입니다.");
				return false;
			}
			//DB 변경 메소드 실행
			change(cart_id, effect.value, price); //effect.value: 변경된 수량을 매개변수로 사용
		}
		
		function qty_plus(cart_id, count, price) {
			var effect = document.getElementById('qty'+count);
			var qty = effect.value;
			if( !isNaN( qty )) {
				effect.value++;
			} else {
				return false;
			}
			change(cart_id, effect.value, price); //effect.value: 변경된 수량을 매개변수로 사용
		}
		// end 버튼 수량 변경
		
		/* 카트 상품 삭제 */
		function btn_delete(product_code) {
			console.log("삭제버튼클릭");
			// 스크립트 확인/취소 창
			if(confirm("해당 상품을 삭제하시겠습니까?")){
				location.href="${contextPath}/cart/deleteProductInCart.do?product_code="+product_code;
			}
		}
		
		
    </script>

</body>

</html>