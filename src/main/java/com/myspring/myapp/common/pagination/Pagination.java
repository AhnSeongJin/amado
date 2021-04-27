package com.myspring.myapp.common.pagination;

public class Pagination {
	
	private int listSize = 10; // 초기값으로 목록개수를 10으로 셋팅
	private int rangeSize = 10; // 초기값으로 페이지범위를 10으로 셋팅
	private int page;
	private int range;
	private int listCnt;
	private int pageCnt;
	private int startPage;
	private int startList;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	public Pagination() {}

	// 화면에 보여질 개수가 달라질때(상품 몇개씩 보기)
	public Pagination(int listSize) {
		this.listSize = listSize;
	}

	public int getListSize() {
		return listSize;
	}

	public void setListSize(int listSize) {
		this.listSize = listSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;		//현재 페이지 번호
		this.range = range;		//현재 페이지 범위 정보(페이지번호1~10=1, 11~20=2)
		this.listCnt = listCnt; // 게시물의 총 개수

		// 전체 페이지수
		this.pageCnt = (int) Math.ceil((double)listCnt / listSize);
		// 시작 페이지
		this.startPage = (range - 1) * rangeSize + 1;	//1, 11, 21, ...
		// 끝 페이지
		this.endPage = range * rangeSize;	// 10, 20, 30, ...
		// 게시판 시작번호
		this.startList = (page - 1) * listSize;
		// 이전 버튼 상태
		this.prev = range == 1 ? false : true;
		// 다음 버튼 상태: 끝 페이지 보다 총 페이지 개수가 많으면
		this.next = endPage > pageCnt ? false : true;
		// 마지막 번호와 페이지의 총 개수를 비교하여 마지막 번호가 총 개수보다 크면 마지막 번호로 셋팅후 false
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
		System.out.println(range*rangeSize);
		System.out.println("pagination:endPage= "+endPage);
		System.out.println("pageCnt: "+pageCnt);
		
		System.out.println(this.toString());
		
	}

	@Override
	public String toString() {
		return "Pagination [listSize=" + listSize + ", rangeSize=" + rangeSize + ", page=" + page + ", range=" + range
				+ ", listCnt=" + listCnt + ", pageCnt=" + pageCnt + ", startPage=" + startPage + ", startList="
				+ startList + ", endPage=" + endPage + ", prev=" + prev + ", next=" + next + "]";
	}
	
	

}
