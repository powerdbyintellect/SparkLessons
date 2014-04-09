package com.intuit.tutor.obs;

import java.math.BigInteger;

public class MerchantApplicationResponse {

	private OnboardingStatus onboardingStatus;
	private String MID;
	private BigInteger daysToFund;
	private String echoMerchantId;
	private String masterAccountId;
	
	public BigInteger getDaysToFund() {
		return daysToFund;
	}

	public void setDaysTofund(BigInteger daysTofund) {
		this.daysToFund = daysTofund;
	}

	public OnboardingStatus getOnboardingStatus() {
		return onboardingStatus;
	}

	public String getMID() {
		return MID;
	}


	public void setOnboardingStatus(OnboardingStatus status) {
		this.onboardingStatus = status;
	}

	public void setMID(String mid) {
		this.MID = mid;
	}

	public void setSettlementTime(BigInteger days) {
		this.daysToFund = days;
	}

	public void setEchoMerchantId(String echoId) {
		this.echoMerchantId = echoId;
	}

	public String getEchoMerchantId() {
		return this.echoMerchantId;
	}

	public void setMasterAccountId(String masterAccountId) {
		this.masterAccountId = masterAccountId;
	}

	public String getMasterAccountId() {
		return this.masterAccountId;
	}

}
