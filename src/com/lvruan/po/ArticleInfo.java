package com.lvruan.po;

import java.util.Date;

public class ArticleInfo {
    private Integer id;

    private String aTitle;

    private String aDescripte;

    private Date aDatetime;

    private Integer aTypeid;

    private String aTags;

    private String aContent;

    private String aCover;

    private Integer aState;

    private Integer aViewnum;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getaTitle() {
        return aTitle;
    }

    public void setaTitle(String aTitle) {
        this.aTitle = aTitle == null ? null : aTitle.trim();
    }

    public String getaDescripte() {
        return aDescripte;
    }

    public void setaDescripte(String aDescripte) {
        this.aDescripte = aDescripte == null ? null : aDescripte.trim();
    }

    public Date getaDatetime() {
        return aDatetime;
    }

    public void setaDatetime(Date aDatetime) {
        this.aDatetime = aDatetime;
    }

    public Integer getaTypeid() {
        return aTypeid;
    }

    public void setaTypeid(Integer aTypeid) {
        this.aTypeid = aTypeid;
    }

    public String getaTags() {
        return aTags;
    }

    public void setaTags(String aTags) {
        this.aTags = aTags == null ? null : aTags.trim();
    }

    public String getaContent() {
        return aContent;
    }

    public void setaContent(String aContent) {
        this.aContent = aContent == null ? null : aContent.trim();
    }

    public String getaCover() {
        return aCover;
    }

    public void setaCover(String aCover) {
        this.aCover = aCover == null ? null : aCover.trim();
    }

    public Integer getaState() {
        return aState;
    }

    public void setaState(Integer aState) {
        this.aState = aState;
    }

    public Integer getaViewnum() {
        return aViewnum;
    }

    public void setaViewnum(Integer aViewnum) {
        this.aViewnum = aViewnum;
    }
}