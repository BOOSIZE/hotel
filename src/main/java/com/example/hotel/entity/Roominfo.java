package com.example.hotel.entity;


public class Roominfo {

  private Long rid;
  private String rnum;
  private String rtype;
  private Long tid;
  private String tname;
  private int state;

  public Long getRid() {
    return rid;
  }

  public void setRid(Long rid) {
    this.rid = rid;
  }

  public int getState() {
    return state;
  }

  public void setState(int state) {
    this.state = state;
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


  public Long getTid() {
    return tid;
  }

  public void setTid(Long tid) {
    this.tid = tid;
  }

  public String getTname() {
    return tname;
  }

  public void setTname(String tname) {
    this.tname = tname;
  }
}
