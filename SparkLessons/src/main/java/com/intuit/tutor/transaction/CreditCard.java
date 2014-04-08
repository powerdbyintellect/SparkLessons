package com.intuit.tutor.transaction;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;


@XmlRootElement
public class CreditCard {
	
	private String creditCardNumber;
	private String expirationMonth;
	private String expirationYear;
	private String nameOnCard;
	private String creditCardAddress;
	private String creditCardCity;
	private String creditCardState;
	private String creditCardPostalCode;
	
	@XmlElement(name="CreditCardNumber")
	public String getCreditCardNumber() {
		return creditCardNumber;
	}
	public void setCreditCardNumber(String creditCardNumber) {
		this.creditCardNumber = creditCardNumber;
	}
	@XmlElement(name="ExpirationMonth")
	public String getExpirationMonth() {
		return expirationMonth;
	}
	public void setExpirationMonth(String expirationMonth) {
		this.expirationMonth = expirationMonth;
	}
	@XmlElement(name="ExpirationYear")
	public String getExpirationYear() {
		return expirationYear;
	}
	public void setExpirationYear(String expirationYear) {
		this.expirationYear = expirationYear;
	}
	@XmlElement(name="NameOnCard")
	public String getNameOnCard() {
		return nameOnCard;
	}
	public void setNameOnCard(String nameOnCard) {
		this.nameOnCard = nameOnCard;
	}
	@XmlElement(name="CreditCardAddress")
	public String getCreditCardAddress() {
		return creditCardAddress;
	}
	public void setCreditCardAddress(String creditCardAddress) {
		this.creditCardAddress = creditCardAddress;
	}
	
	@XmlElement(name="CreditCardCity")
	public String getCreditCardCity() {
		return creditCardCity;
	}
	public void setCreditCardCity(String creditCardCity) {
		this.creditCardCity = creditCardCity;
	}
	
	@XmlElement(name="CreditCardState")
	public String getCreditCardState() {
		return creditCardState;
	}
	public void setCreditCardState(String creditCardState) {
		this.creditCardState = creditCardState;
	}
	
	@XmlElement(name="CreditCardPostalCode")
	public String getCreditCardPostalCode() {
		return creditCardPostalCode;
	}
	public void setCreditCardPostalCode(String creditCardPostalCode) {
		this.creditCardPostalCode = creditCardPostalCode;
	}
	
	
}
