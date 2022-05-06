package com.campus.myapp.vo;

public class PagingVO {
	private int currentPage = 1; //현재페이지
	private int startPage = 1; //시작페이지
	private int endPage;	//마지막페이지
	private int recordPerPage = 12; //한 페이지당 표시할 DB 레코드 수(글 개수)
	private int onePageCount = 5; //하단에 표시할 페이지개수
	private int totalRecord;	//게시글 총 개수
	private int totalPage;	//총 페이지 수
	private int offsetIndex = 0;	//몇번째 행부터 12개씩 가져올 것인지 구간정하기
	
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
		setOffsetIndex((currentPage-1)*recordPerPage);
		//페이지번호의 시작값
		startPage = (currentPage-1)/onePageCount*onePageCount+1;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = (int)Math.ceil(this.currentPage*0.1)*10;
	}
	public int getRecordPerPage() {
		return recordPerPage;
	}
	public void setRecordPerPage(int recordPerPage) {
		this.recordPerPage = recordPerPage;
	}
	public int getOnePageCount() {
		return onePageCount;
	}
	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		if(totalRecord%recordPerPage==0) {
			totalPage = totalRecord/recordPerPage;
		} else {
			totalPage = totalRecord/recordPerPage+1;
		}
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getOffsetIndex() {
		return offsetIndex;
	}
	public void setOffsetIndex(int offsetIndex) {
		this.offsetIndex = offsetIndex;
	}
}
