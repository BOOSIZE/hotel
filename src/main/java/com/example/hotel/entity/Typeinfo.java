package com.example.hotel.entity;


public class Typeinfo {

  private long tid;
  private String tname;
  private String img;
  private String roomnum;
  private String roomstate;
  private String tpeople;
  private String amt;


  public long getTid() {
    return tid;
  }

  public void setTid(long tid) {
    this.tid = tid;
  }


  public String getTname() {
    return tname;
  }

  public void setTname(String tname) {
    this.tname = tname;
  }


  public String getImg() {
    return img;
  }

  public void setImg(String img) {
    this.img = img;
  }

  public String getRoomnum() {
    return roomnum;
  }

  public void setRoomnum(String roomnum) {
    this.roomnum = roomnum;
  }

  public String getRoomstate() {
    return roomstate;
  }

  public void setRoomstate(String roomstate) {
    this.roomstate = roomstate;
  }

  public String getTpeople() {
    return tpeople;
  }

  public void setTpeople(String tpeople) {
    this.tpeople = tpeople;
  }

  public String getAmt() {
    return amt;
  }

  public void setAmt(String amt) {
    this.amt = amt;
  }
}
