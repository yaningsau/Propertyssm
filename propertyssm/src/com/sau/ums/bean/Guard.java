package com.sau.ums.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Guard {

    private Integer id;

    private String name;

    private String idcard;

    private String sex;

    private String tel;

    private String lnum;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date time;

    private String ps;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getLnum() {
        return lnum;
    }

    public void setLnum(String lnum) {
        this.lnum = lnum;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getPs() {
        return ps;
    }

    public void setPs(String ps) {
        this.ps = ps;
    }

}
