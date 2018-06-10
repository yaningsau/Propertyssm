package com.sau.ums.bean;

import java.sql.Timestamp;

public class Propertyfee {

    private String id;

    private String room;

    private float housefee;

    private float parkfee;

    private float payment;

    private float arrearage;

    private String status;

    private Timestamp time;

    private String ps;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public float getHousefee() {
        return housefee;
    }

    public void setHousefee(float housefee) {
        this.housefee = housefee;
    }

    public float getParkfee() {
        return parkfee;
    }

    public void setParkfee(float parkfee) {
        this.parkfee = parkfee;
    }

    public float getPayment() {
        return payment;
    }

    public void setPayment(float payment) {
        this.payment = payment;
    }

    public float getArrearage() {
        return arrearage;
    }

    public void setArrearage(float arrearage) {
        this.arrearage = arrearage;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public String getPs() {
        return ps;
    }

    public void setPs(String ps) {
        this.ps = ps;
    }
}
