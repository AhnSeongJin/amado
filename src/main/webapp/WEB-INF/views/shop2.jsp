<script>

	//이전 버튼 이벤트

	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;		

		var url = "${contextPath}/board/getBoardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;
	}

  //페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, searchType, keyword) {
		var url = "${contextPath}/board/getBoardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;

		location.href = url;	
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;

		var url = "${contextPath}/board/getBoardList";
		url = url + "?page=" + page;
		url = url + "&range=" + range;		

		location.href = url;
	}

</script>

<!-- pagination{s} -->
<div id="paginationBox">
	<ul class="pagination">
		<c:if test="${pagination.prev}">
			<li class="page-item"><a class="page-link" href="#"
				onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
		</c:if>
		
		<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}"
			var="idx">
			<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> ">
				<a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
		</c:forEach>

		<c:if test="${pagination.next}">
			<li class="page-item">
			<a class="page-link" href="#" onClick="fn_next('${pagination.range}', '${pagination.range}', '${pagination.rangeSize}')">Next</a></li>
		</c:if>
	</ul>
</div>
<!-- pagination{e} -->
