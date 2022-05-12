package com.campus.myapp.vo;

import java.io.Serializable;

public class ShopVO implements Serializable{
	private int shopid;
	private String shopname;
	private String shopaddr;
	private String shopnumber;
	
	public ShopVO() {
		
	}
	public ShopVO(int shopid, String shopname, String shopaddr, String shopnumber) {
		this.shopid = shopid;
		this.shopname = shopname;
		this.shopaddr = shopaddr;
		this.shopnumber = shopnumber;
	}
	public int getShopid() {
		return shopid;
	}
	public void setShopid(int shopid) {
		this.shopid = shopid;
	}
	public String getShopname() {
		return shopname;
	}
	public void setShopname(String shopname) {
		this.shopname = shopname;
	}
	public String getShopaddr() {
		return shopaddr;
	}
	public void setShopaddr(String shopaddr) {
		this.shopaddr = shopaddr;
	}
	public String getShopnumber() {
		return shopnumber;
	}
	public void setShopnumber(String shopnumber) {
		this.shopnumber = shopnumber;
	}
}
