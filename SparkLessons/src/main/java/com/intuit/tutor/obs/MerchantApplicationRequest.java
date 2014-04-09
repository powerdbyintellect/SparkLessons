package com.intuit.tutor.obs;

import com.intuit.tutor.entity.Address;
import com.intuit.tutor.entity.BankAccount;
import com.intuit.tutor.entity.Customer;


public class MerchantApplicationRequest {

	private String routingNumber;
	private String ssn;
	private String birthDate;
	private String zip;
	private String state;
	private String city;
	private String street;
	private String phone;
	private String lastName;
	private String firstName;
	private String bankName;
	private String accountNumber;
	private String dbaName;

	public String getRoutingNumber() {
		return this.routingNumber;
	}

	public String getAccountNumber() {
		return accountNumber;
	}

	public String getBankName() {
		return bankName;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getPhone() {
		return phone;
	}

	public String getStreet() {
		return street;
	}

	public String getCity() {
		return city;
	}

	public String getState() {
		return state;
	}

	public String getZip() {
		return zip;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public String getSsn() {
		return ssn;
	}

	public void setRoutingNumber(String routingNumber) {
		this.routingNumber = routingNumber;
	}

	public void setSsn(String ssn) {
		this.ssn = ssn;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

	public void setState(String state) {
		this.state = state;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getDbaName() {
		return dbaName;
	}

	public void setDbaName(String dbaName) {
		this.dbaName = dbaName;
	}

	public static MerchantApplicationRequest createFromMerchantApplication(
			Customer customer, Address address, BankAccount bankAccount) {
		MerchantApplicationRequest merchantApplicationRequest = new MerchantApplicationRequest();
		merchantApplicationRequest.setFirstName(customer.getFirstname());
		merchantApplicationRequest.setLastName(customer.getLastname());
		merchantApplicationRequest.setAccountNumber(bankAccount.getAccountNumber());
		merchantApplicationRequest.setBankName(bankAccount.getBankName());
		merchantApplicationRequest.setRoutingNumber(bankAccount.getRoutingNumber());
		merchantApplicationRequest.setBirthDate(customer.getDob());
		merchantApplicationRequest.setCity(address.getCity());
		merchantApplicationRequest.setStreet(address.getStreetAddress1());
		merchantApplicationRequest.setState(address.getState());
		merchantApplicationRequest.setZip(address.getZipCode());
		merchantApplicationRequest.setSsn(customer.getSsn());
		merchantApplicationRequest.setPhone(customer.getPhone());
		merchantApplicationRequest.setDbaName(customer.getDbaName());
		return merchantApplicationRequest;
	}

}
