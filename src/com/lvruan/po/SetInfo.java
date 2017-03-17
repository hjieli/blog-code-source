package com.lvruan.po;

public class SetInfo {
    private Integer id;

    private String sName;

    private String sAuthor;

    private String sKeyword;

    private String sDescripte;

    private String sBottomstr;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName == null ? null : sName.trim();
    }

    public String getsAuthor() {
        return sAuthor;
    }

    public void setsAuthor(String sAuthor) {
        this.sAuthor = sAuthor == null ? null : sAuthor.trim();
    }

    public String getsKeyword() {
        return sKeyword;
    }

    public void setsKeyword(String sKeyword) {
        this.sKeyword = sKeyword == null ? null : sKeyword.trim();
    }

    public String getsDescripte() {
        return sDescripte;
    }

    public void setsDescripte(String sDescripte) {
        this.sDescripte = sDescripte == null ? null : sDescripte.trim();
    }

    public String getsBottomstr() {
        return sBottomstr;
    }

    public void setsBottomstr(String sBottomstr) {
        this.sBottomstr = sBottomstr == null ? null : sBottomstr.trim();
    }
}