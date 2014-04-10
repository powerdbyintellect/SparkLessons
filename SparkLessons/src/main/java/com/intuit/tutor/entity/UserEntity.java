package com.intuit.tutor.entity;

import org.springframework.stereotype.Repository;

@Repository
public class UserEntity {
	private String userid;
	private String password;
	private String email;
	private String firstname;
	private String lastname;
	private String masteraccount;
	private String realmid;
	private String accountnumber;
	private String loginid;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getMasteraccount() {
		return masteraccount;
	}
	public void setMasteraccount(String masteraccount) {
		this.masteraccount = masteraccount;
	}
	public String getRealmid() {
		return realmid;
	}
	public void setRealmid(String realmid) {
		this.realmid = realmid;
	}
	public String getAccountnumber() {
		return accountnumber;
	}
	public void setAccountnumber(String accountnumber) {
		this.accountnumber = accountnumber;
	}
	public String getLoginid() {
		return loginid;
	}
	public void setLoginid(String loginid) {
		this.loginid = loginid;
	}
	
	
}
