package com.mbs.mvc.vo;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;

@JsonInclude(Include.NON_NULL)
public class Main_SearchVO {
	private int category = 0;
	private String addr = null;
	private String date = null;
	private int price_start = 0;
	private int price_end = 0;
	
	
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPrice_start() {
		return price_start;
	}
	public void setPrice_start(int price_start) {
		this.price_start = price_start;
	}
	public int getPrice_end() {
		return price_end;
	}
	public void setPrice_end(int price_end) {
		this.price_end = price_end;
	}
	
}
