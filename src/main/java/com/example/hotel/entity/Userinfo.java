package com.example.hotel.entity;

public class Userinfo
{

  private Long uid;
  private String account;
  private String password;
  private String uname;
  private String usex;
  private String amt;
  private String udate;
  private String urole;

  public String getUrole()
  {
    return urole;
  }

  public void setUrole(String urole)
  {
    this.urole = urole;
  }

  public Long getUid() {
    return uid;
  }

  public void setUid(Long uid) {
    this.uid = uid;
  }


  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public String getUname() {
    return uname;
  }

  public void setUname(String uname) {
    this.uname = uname;
  }


  public String getUsex() {
    return usex;
  }

  public void setUsex(String usex) {
    this.usex = usex;
  }


  public String getAmt() {
    return amt;
  }

  public void setAmt(String amt) {
    this.amt = amt;
  }


  public String getUdate() {
    return udate;
  }

  public void setUdate(String udate) {
    this.udate = udate;
  }

}
