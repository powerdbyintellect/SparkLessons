package com.intuit.tutor.authentication;

import java.io.Serializable;

public class SparkLessonsImpl implements SparkLessons, Serializable {

	private static final long serialVersionUID = 4274965764055801691L;

	private String tokenId;
	private String realmId;
	
	public SparkLessonsImpl(String tokenId, String realmId) {
		this.tokenId = tokenId;
		this.realmId = realmId;
	}
	
	@Override
	public String getTokenId() {
		return tokenId;
	}

	@Override
	public String getRealmId() {
		return realmId;
	}

	public void setTokenId(String tokenId) {
		this.tokenId = tokenId;
	}

	public void setRealmId(String realmId) {
		this.realmId = realmId;
	}
	
	
	

}
