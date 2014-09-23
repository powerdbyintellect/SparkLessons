package com.intuit.tutor.entity.dao;

import com.intuit.tutor.entity.UserEntity;

public interface UserEntityDAO {

	public UserEntity getUser(String emailAddress);
	public UserEntity getUserByLoginId(String username);
	public UserEntity saveUser(UserEntity user);
	public UserEntity getById(Long id);
}
