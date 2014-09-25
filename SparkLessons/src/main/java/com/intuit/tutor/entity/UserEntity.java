package com.intuit.tutor.entity;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table
public class UserEntity {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column
	private long id;
	@Column
	private String userid;
	@Column
	private String email;
	@Column
	private String firstname;
	@Column
	private String lastname;
	@Column
	private String masteraccount;
	@Column
	private String realmid;
	@Column
	private String accountnumber;
	@Column
	private String loginid;
	@Column
	private String description;
	@Column
	private String logoLocation;
	@Column
	private String lessonname;
	@Column
	private Date createdate;
	@Column
	private String lessoncategory;
	@Column
	private Double rate;
	@Column
	private Boolean paymentaccountpresent = Boolean.FALSE;
	@Column
	private String facebookid;
	@Column
	private String facebookusername;
	@Column
	private String facebookTokenId;
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public long getId() {
		return id;
	}
	public void setId(long id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getLogoLocation() {
		return logoLocation;
	}
	public void setLogoLocation(String logoLocation) {
		this.logoLocation = logoLocation;
	}
	public Double getRate() {
		return rate;
	}
	public void setRate(Double rate) {
		this.rate = rate;
	}
	public String getLessonname() {
		return lessonname;
	}
	public void setLessonname(String lessonname) {
		this.lessonname = lessonname;
	}
	public String getLessoncategory() {
		return lessoncategory;
	}
	public void setLessoncategory(String lessoncategory) {
		this.lessoncategory = lessoncategory;
	}
	public Date getCreatedate() {
		return createdate;
	}
	public void setCreatedate(Date date) {
		this.createdate = date;
	}
	public Boolean getPaymentaccountpresent() {
		return paymentaccountpresent;
	}
	public void setPaymentaccountpresent(Boolean paymentaccountpresent) {
		this.paymentaccountpresent = paymentaccountpresent;
	}
	public String getFacebookid() {
		return facebookid;
	}
	public void setFacebookid(String facebookid) {
		this.facebookid = facebookid;
	}
	public String getFacebookusername() {
		return facebookusername;
	}
	public void setFacebookusername(String facebookusername) {
		this.facebookusername = facebookusername;
	}
	
	
	
}
