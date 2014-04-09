package com.intuit.tutor.obs;

public abstract class SparkException extends Exception {

	private static final long serialVersionUID = -451728639428600275L;

	public SparkException() {
		super();
	}

	/**
	 * Provide an integer value HTTP error/status code, e.g. 200, 204, 404, 500, 503, etc
	 * 
	 * @return HTTP status code
	 */
	public abstract int getHttpStatusCode();

	/**
	 * Provide a message which can be displayed to users on how to correct the error.
	 * 
	 * @return A string representation of the action a user should take
	 */
	public abstract String getFlamingoMessage();
}
