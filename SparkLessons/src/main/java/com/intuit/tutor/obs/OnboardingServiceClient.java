package com.intuit.tutor.obs;

import java.util.UUID;

import com.intuit.tutor.security.Token;

public interface OnboardingServiceClient {

	
	MerchantApplicationResponse submitMerchantApplication(MerchantApplicationRequest merchantApplication, Token token,
			String clientIPAddress, UUID requestId, String userEmail) throws OnBoardingException;
	
	MerchantApplicationResponse getMerchantApplicationStatus(String masterAccountId, Token token,
			UUID requestId) throws OnBoardingException;

	MerchantApplicationResponse getMerchantInformationByAuthId(Token token, UUID requestId) throws OnBoardingException;
	
}
