package com.campus.myapp.vo;

public class BoardVO {
	private int boardno;
	private String title;
	private String content;
	private int hit;
	private String userid;
	private String writedate;
	private int likes; //좋아요
	private String boardtype;
	private String filename1;
	private String username;
	
	private String category;
	private String breed;
	
	private int myWriteCnt;
	private int myReviewCnt;
	
	public int getBoardno() {
		return boardno;
	}
	public void setBoardno(int boardno) {
		this.boardno = boardno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public String getBoardtype() {
		return boardtype;
	}
	public void setBoardtype(String boardtype) {
		this.boardtype = boardtype;
	}
	public String getFilename1() {
		return filename1;
	}
	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public int getMyWriteCnt() {
		return myWriteCnt;
	}
	public void setMyWriteCnt(int myWriteCnt) {
		this.myWriteCnt = myWriteCnt;
	}
	public int getMyReviewCnt() {
		return myReviewCnt;
	}
	public void setMyReviewCnt(int myReviewCnt) {
		this.myReviewCnt = myReviewCnt;
	}
	
	
}