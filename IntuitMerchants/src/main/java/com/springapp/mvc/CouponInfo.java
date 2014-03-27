package com.springapp.mvc;

import java.math.BigDecimal;
import java.sql.Date;

public class CouponInfo {
	private String merchantname;
	private String merchantaccount;
	private BigDecimal mintransactionamount;
	private String expirationdate;
	private String startdate;
	private Integer couponcount;
	private BigDecimal discountpercent;
	
	public String getMerchantname() {
		return merchantname;
	}
	public void setMerchantname(String merchantname) {
		this.merchantname = merchantname;
	}
	public String getMerchantaccount() {
		return merchantaccount;
	}
	public void setMerchantaccount(String merchantaccount) {
		this.merchantaccount = merchantaccount;
	}
	public BigDecimal getMintransactionamount() {
		return mintransactionamount;
	}
	public void setMintransactionamount(BigDecimal mintransactionamount) {
		this.mintransactionamount = mintransactionamount;
	}
	public Integer getCouponcount() {
		return couponcount;
	}
	public void setCouponcount(Integer couponcount) {
		this.couponcount = couponcount;
	}
	public BigDecimal getDiscountpercent() {
		return discountpercent;
	}
	public void setDiscountpercent(BigDecimal discountpercent) {
		this.discountpercent = discountpercent;
	}
	public String getExpirationdate() {
		return expirationdate;
	}
	public void setExpirationdate(String expirationdate) {
		this.expirationdate = expirationdate;
	}
	public String getStartdate() {
		return startdate;
	}
	public void setStartdate(String startdate) {
		this.startdate = startdate;
	}
}
