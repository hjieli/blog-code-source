package com.lvruan.po;

public class LinkInfo {
	private Integer id;
	private String lUrl;
	private String lName;
	private Integer lSort;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getlUrl() {
		return lUrl;
	}
	public void setlUrl(String lUrl) {
		this.lUrl = lUrl == null ? null : lUrl.trim();
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName == null ? null : lName.trim();
	}
	public Integer getlSort() {
		return lSort;
	}
	public void setlSort(Integer lSort) {
		this.lSort = lSort;
	}
	
	
}
