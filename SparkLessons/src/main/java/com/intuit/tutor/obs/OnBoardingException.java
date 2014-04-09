package com.intuit.tutor.obs;


public class OnBoardingException extends SparkException {

	public static final String Type = "Unexpected error code: ";
	public static final String sparkMessage = "Internal service error. SparkLesson onboarding is temporarily unavailable.";
	public static final String UNEXPECTED_STATUS_CODE = "Unexpected status code";
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String unexpectedStatusCode = null;
	
	public OnBoardingException(String unexpectedStatusCode) {
		this.unexpectedStatusCode  = unexpectedStatusCode;
	}

	@Override
	public int getHttpStatusCode() {
		return 500;
	}
	@Override
	public String getFlamingoMessage() {
		return sparkMessage;
	}

}
