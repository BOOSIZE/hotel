package com.example.hotel.entity;

/**
 * @author 翁佳伟
 * @create 2020-07-03 10:25
 */
public class OrderDetails {
    private String account;
    private String pname;
    private String pcode;
    private String psex;
    private String rnum;
    private String rtype;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public String getPcode() {
        return pcode;
    }

    public void setPcode(String pcode) {
        this.pcode = pcode;
    }

    public String getPsex() {
        return psex;
    }

    public void setPsex(String psex) {
        this.psex = psex;
    }

    public String getRnum() {
        return rnum;
    }

    public void setRnum(String rnum) {
        this.rnum = rnum;
    }

    public String getRtype() {
        return rtype;
    }

    public void setRtype(String rtype) {
        this.rtype = rtype;
    }
}
