package com.campus.myapp.vo;

public class AdminPagingVO {
	// 페이징
	private int onePageRecord = 12; // 한페이지당 출력할 레코드 수
	private int pageNum = 1; // 현재페이지
	private int totalRecord; // 총 레코드 수
	private int totalPage; // 총 페이지 수
	private int offsetIndex = 0;
	private int onePageCount = 5; // 한번에 표시할 페이지 수
	private int startPage = 1;
	// 검색
	private String searchKey;
	private String searchWord;
	
	public int getOnePageRecord() {
		return onePageRecord;
	}
	public void setOnePageRecord(int onePageRecord) {
		this.onePageRecord = onePageRecord;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
		// offset위치계산
		offsetIndex = (pageNum-1)*onePageRecord;
		// 페이지 번호의 시작값
		startPage = ((pageNum-1)/onePageCount*onePageCount)+1;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		// 총 페이지 수
		if(totalRecord%onePageRecord==0) { // 나머지 레코드가 없을 때
			totalPage = totalRecord/onePageRecord;
		}else { // 나머지 레코드가 있을 때
			totalPage = totalRecord/onePageRecord+1;
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
	public int getOnePageCount() {
		return onePageCount;
	}
	public void setOnePageCount(int onePageCount) {
		this.onePageCount = onePageCount;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
}
