package com.sau.ums.bean;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Park {

    private String carnum;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date begintime;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endtime;

    private String status;

    private String room;

    private String ps;

    public String getCarnum() {
        return carnum;
    }

    public void setCarnum(String carnum) {
        this.carnum = carnum;
    }

    public Date getBegintime() {
        return begintime;
    }

    public void setBegintime(Date begintime) {
        this.begintime = begintime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getPs() {
        return ps;
    }

    public void setPs(String ps) {
        this.ps = ps;
    }

}
