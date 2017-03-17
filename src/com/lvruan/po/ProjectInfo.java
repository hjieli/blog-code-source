package com.lvruan.po;

import java.text.SimpleDateFormat;
import java.util.Date;

public class ProjectInfo {
    private Integer id;

    private Date pTime;

	private String pName;

    private String pAuthor;

    private Integer pReading;

    private String pAddress;

    private Integer pTypeid;

    private String pTag;

    private String pContent;
    
	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getpTime() {
    	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String str=sdf.format(pTime);    //当前时间
        return str;
    	//return pTime;
    }

    public void setpTime(Date pTime) {
        this.pTime = pTime;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName == null ? null : pName.trim();
    }

    public String getpAuthor() {
        return pAuthor;
    }

    public void setpAuthor(String pAuthor) {
        this.pAuthor = pAuthor == null ? null : pAuthor.trim();
    }

    public Integer getpReading() {
        return pReading;
    }

    public void setpReading(Integer pReading) {
        this.pReading = pReading;
    }

    public String getpAddress() {
        return pAddress;
    }

    public void setpAddress(String pAddress) {
        this.pAddress = pAddress == null ? null : pAddress.trim();
    }

    public Integer getpTypeid() {
        return pTypeid;
    }

    public void setpTypeid(Integer pTypeid) {
        this.pTypeid = pTypeid;
    }

    public String getpTag() {
        return pTag;
    }

    public void setpTag(String pTag) {
        this.pTag = pTag == null ? null : pTag.trim();
    }

    public String getpContent() {
        return pContent;
    }

    public void setpContent(String pContent) {
        this.pContent = pContent == null ? null : pContent.trim();
    }
}