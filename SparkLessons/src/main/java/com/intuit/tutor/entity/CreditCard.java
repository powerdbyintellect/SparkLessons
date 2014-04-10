package com.intuit.tutor.entity;

import java.math.BigDecimal;
import java.util.Date;

public class CreditCard {

	private String creditCardNumber;
	private String nameOnCard;
	private Integer experiationYear;
	private Integer experiationMonth;
	private BigDecimal chargeAmount;
	private String postalCode;
	private String securityCode;
	private String realmId;
	
	
	public String getCreditCardNumber() {
		return creditCardNumber;
	}
	public void setCreditCardNumber(String creditCardNumber) {
		this.creditCardNumber = creditCardNumber;
	}
	public String getNameOnCard() {
		return nameOnCard;
	}
	public void setNameOnCard(String nameOnCard) {
		this.nameOnCard = nameOnCard;
	}
	public Integer getExperiationYear() {
		return experiationYear;
	}
	public void setExperiationYear(Integer experiationYear) {
		this.experiationYear = experiationYear;
	}
	public Integer getExperiationMonth() {
		return experiationMonth;
	}
	public void setExperiationMonth(Integer experiationMonth) {
		this.experiationMonth = experiationMonth;
	}
	public BigDecimal getChargeAmount() {
		return chargeAmount;
	}
	public void setChargeAmount(BigDecimal chargeAmount) {
		this.chargeAmount = chargeAmount;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getRealmId() {
		return realmId;
	}
	public void setRealmId(String realmId) {
		this.realmId = realmId;
	}
	public String getSecurityCode() {
		return securityCode;
	}
	public void setSecurityCode(String securityCode) {
		this.securityCode = securityCode;
	}
	
	
	
}
