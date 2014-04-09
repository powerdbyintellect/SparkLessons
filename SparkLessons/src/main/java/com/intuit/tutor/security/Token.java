package com.intuit.tutor.security;

public class Token {

	private String userName;
	private String password;
	private String tokenId;
	private String authId;

	public Token() {
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public void setTokenId(String tokenId) {
		this.tokenId = tokenId;
	}

	public String getTokenId() {
		return tokenId;
	}

	public String getAuthId() {
		return authId;
	}

	public void setAuthId(String authId) {
		this.authId = authId;
	}

	@Override
	public String toString() {
		return "Token [userName=" + userName + ", password=" + "*MASKED*" + ", tokenId=" + tokenId + ", authId=" + authId + "]";
	}
}
