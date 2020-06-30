package com.example.hotel.entity;


import org.springframework.web.multipart.MultipartFile;


public class Typeinfo {

  private Long tid;
  private String tname;
  private String img;
  private String tpeople;
  private String amt;
  private String tcount;



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


  public String getImg() {
    return img;
  }

  public void setImg(String img) {
    this.img = img;
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


  public String getTcount() {
    return tcount;
  }

  public void setTcount(String tcount) {
    this.tcount = tcount;
  }

}
