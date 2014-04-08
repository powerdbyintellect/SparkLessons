package com.intuit.tutor.transaction;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class CreditCardAuth {

	private CreditCard creditCard;
	private Double amount;
	private Integer cardSecurityCode;
	
	@XmlElement(name="CreditCard")
	public CreditCard getCreditCard() {
		return creditCard;
	}
	public void setCreditCard(CreditCard creditCard) {
		this.creditCard = creditCard;
	}
	
	@XmlElement(name="Amount")
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	
	@XmlElement(name="CardSecurityCode")
	public Integer getCardSecurityCode() {
		return cardSecurityCode;
	}
	public void setCardSecurityCode(Integer cardSecurityCode) {
		this.cardSecurityCode = cardSecurityCode;
	}
	
	
}
