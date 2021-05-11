<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 스프링프레임워크 form:form 태그라이브러리 -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />
<!DOCTYPE html>
<html lang="en">

<head>
	<script>
				
		// $(document).ready() => javascript
		document.addEventListener("DOMContentLoaded", function(){
			showReplyList();
		});
		
		// 댓글 리스트 보기
		function showReplyList(){
			var url = "${contextPath}/restBoard/${boardVO.boardSeq}";
			var id = "${member.id}";
			//var paramData = {"boardSeq" : ${boardVO.boardSeq}};
			$.ajax({
	            type: 'GET',
	            url: url,
	            //data: paramData,
	            dataType: 'json',
	            success: function(result) {
	               	var htmls = "";
					if(result.length < 1){
						htmls += '<p>등록된 댓글이 없습니다.</p>';
					} else {
	                    $(result).each(function(){
		                     htmls += '<div class="media text-muted pt-3" id="rid' + this.replySeq + '">';
		                     htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
		                     htmls += '<title>Placeholder</title>';
		                     htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
		                     htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
		                     htmls += '</svg>';
		                     
		                     htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
		                     htmls += '<span class="d-block">';
		                     htmls += '<strong class="text-gray-dark">' + this.id + '</strong>';
		                     if(this.id == "${member.id}"){
		                    	 htmls += '<span style="padding-left: 7px; font-size: 9pt">';
			                     htmls += '<a href="javascript:void(0)" onclick="fn_editReply(' + this.replySeq + ', \'' + this.id + '\', \'' + this.replyContent + '\' )" style="padding-right:5px">수정</a>';
			                     htmls += '<a href="javascript:void(0)" onclick="fn_deleteReply(' + this.replySeq + ')" >삭제</a>';
			                     htmls += '</span>';
		                     }
		                     htmls += '</span>';
		                     htmls += this.replyContent;
		                     htmls += '</p>';
		                     htmls += '</div>';
		                });	//each end
					}
					$("#replyList").html(htmls);

	            } // Ajax success end

			});	// Ajax end

		}
		
		// 댓글 추가
		function btnReply(isLogOn){
			if(isLogOn=='false'){
				alert("로그인후 댓글을 등록할 수 있습니다.")
			}else{
				var data = {
						replyContent : $("#replyContent").val(),
						boardSeq : ${boardVO.boardSeq },
						id : "${member.id}"
				}

				$.ajax({
					type: "post",
					url: "${contextPath}/restBoard/new",
					data		:  JSON.stringify(data),
			        contentType : "application/json",
					
					success : function(data, textStatus) {
		    			alert("댓글이 등록되었습니다.");
		    			showReplyList();
		    		},
		    		error : function(data, textStatus) {
		    			alert("에러가 발생했습니다."+data);
		    		},
		    		complete : function(data, textStatus) {
		    			//alert("작업을완료 했습니다");
		    		}
				});
			}
		}
		
		// 댓글 수정
		function fn_editReply(reply_seq, id, content){
			console.log(reply_seq, id, content);
			var htmls = "";
			htmls += '<div class="media text-muted pt-3" id="rid' + reply_seq + '">';
			htmls += '<svg class="bd-placeholder-img mr-2 rounded" width="32" height="32" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder:32x32">';
			htmls += '<title>Placeholder</title>';
			htmls += '<rect width="100%" height="100%" fill="#007bff"></rect>';
			htmls += '<text x="50%" fill="#007bff" dy=".3em">32x32</text>';
			htmls += '</svg>';
			
			htmls += '<p class="media-body pb-3 mb-0 small lh-125 border-bottom horder-gray">';
			htmls += '<span class="d-block">';
			htmls += '<strong class="text-gray-dark">' + id + '</strong>';
			htmls += '<span style="padding-left: 7px; font-size: 9pt">';
			htmls += '<a href="javascript:void(0)" onclick="fn_updateReply(' + reply_seq + ', \'' + id + '\')" style="padding-right:5px">저장</a>';
			htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';
			htmls += '</span>';
			htmls += '</span>';
			htmls += '<textarea name="editContent" id="editContent" class="form-control" rows="3">';
			htmls += content;
			htmls += '</textarea>';
			htmls += '</p>';
			htmls += '</div>';
	
			$('#rid' + reply_seq).replaceWith(htmls);
			$('#rid' + reply_seq + ' #editContent').focus();
	
		}
		
		// 댓글 수정 저장
		function fn_updateReply(reply_seq, id){
			var data = {
					replyContent : $("#editContent").val(),
					replySeq : reply_seq
			}
			var headers = {"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"};

			$.ajax({
				type: "patch",
				url: "${contextPath}/restBoard",
				headers: headers,
				data: JSON.stringify(data),
		        contentType: "application/json",
				
				success : function(data, textStatus) {
	    			alert("댓글이 수정되었습니다.");
	    			showReplyList();
	    		},
	    		error : function(data, textStatus) {
	    			alert("에러가 발생했습니다."+data);
	    		},
	    		complete : function(data, textStatus) {
	    			//alert("작업을완료 했습니다");
	    		}
			});
		}
		
		// 댓글 삭제
		function fn_deleteReply(reply_seq){
			var replySeq = reply_seq;

			$.ajax({
				type: "DELETE",
				url: "${contextPath}/restBoard/"+replySeq,
		        contentType: "application/json",
				
				success : function(data, textStatus) {
	    			alert("댓글이 삭제되었습니다.");
	    			showReplyList();
	    		},
	    		error : function(data, textStatus) {
	    			alert("에러가 발생했습니다."+data);
	    		},
	    		complete : function(data, textStatus) {
	    			//alert("작업을완료 했습니다");
	    		}
			});
		}

	</script>
</head>

<body>

        <!-- Product Details Area Start -->
        <div class="single-product-area section-padding-100 clearfix">
            <div class="container-fluid">

                <div class="row">
                    <div class="col-12">
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb mt-50">
                                <li class="breadcrumb-item"><a href="#">Home</a></li>
                                <li class="breadcrumb-item"><a href="#">Board</a></li>
                                <li class="breadcrumb-item active" aria-current="page">게시글 보기</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
		            <div class="col-12">
		              
		              <form action="">
		              	<table class="table text-center">
			              	<tr>
								<td class="list">글번호</td>
								<td><input type="text" value="${boardVO.boardSeq }" disabled /> <input type="hidden" name="articleNO" value="${boardVO.boardSeq}" /></td>
							</tr>
							<tr>
								<td class="list">작성자 아이디</td>
								<td><input type=text value="${boardVO.id }" name="writer" disabled /></td>
							</tr>
							<tr>
								<td class="list">제목</td>
								<td><input type=text value="${boardVO.boardTitle }" name="title" id="i_title" disabled /></td>
							</tr>
							<tr>
								<td class="list">내용</td>
								<td><textarea rows="20" cols="60" name="content" id="i_content" disabled />${boardVO.boardContent }</textarea></td>
							</tr>
			              </table>
		              </form>
		                
		            </div>                    
		        </div>
		        
		        <!-- Reply Area -->
		        <div class="row">
		        	<div class="col-12">
		        		<%-- <div class="d-flex align-items-center justify-content-center">
		        			<textarea rows="5" cols="80" id="replyContent" placeholder="댓글을 작성해주세요."></textarea>
		        		</div>
		        		<div class="text-center p-2">
		        			<button class="rounded-3" type="button" onclick="btnReply('${isLogOn == true && member !=null}');">댓글 등록</button>
		        		</div> --%>
		        		
		        		<!-- Reply Form {s} -->

						<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
							<form name="form" id="form" action="" method="post">
							<input type="hidden" id="bid"/>
							<div class="row">
								<div class="col-10">
									<textarea name="replyContent" id="replyContent" class="form-control" rows="3" placeholder="댓글을 입력해 주세요" required></textarea>
								</div>
								<div class="col-2">
									<input type="hidden" name="id" class="form-control" id="id" placeholder="댓글 작성자" value="${member.id }"></input>
									<button type="button" class="btn btn-sm btn-primary" id="btnReplySave" onclick="btnReply('${isLogOn == true && member !=null}');" style="width: 100%; margin-top: 10px"> 저 장 </button>
								</div>
							</div>
							</form>
						</div>
					
						<!-- Reply Form {e} -->	
					
						<!-- Reply List {s}-->
						<div class="my-3 p-3 bg-white rounded shadow-sm" style="padding-top: 10px">
							<h6 class="border-bottom pb-2 mb-0">Reply list</h6>
							<div id="replyList"></div>
						</div> 
						<!-- Reply List {e}-->
		        		
		        	</div>
		        </div>

            </div>
        </div>
        <!-- Product Details Area End -->
        

</body>

</html>