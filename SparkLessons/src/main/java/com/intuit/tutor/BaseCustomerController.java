package com.intuit.tutor;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.intuit.tutor.entity.UserEntity;
import com.intuit.tutor.entity.dao.UserEntityDAO;

import facebook4j.Facebook;
import facebook4j.FacebookException;
import facebook4j.User;

@Controller
public class BaseCustomerController {

	@Autowired
	private UserEntityDAO userEntityDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(BaseCustomerController.class);;
	
	public UserEntity getUserAndCreate(HttpServletRequest request)  {
		Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
		String emailAddress = null;
		String loginId = null;

		UserEntity user = null;
		if(facebook != null) {
			try {
				User me = facebook.getMe();
				user = userEntityDAO.getUser(me.getEmail());
				emailAddress = me.getEmail();
				loginId = me.getId();
				
				//
				if(user == null) {
					user = new UserEntity();
					//userEntity.setLoginid();
					user.setLoginid(loginId);
					user.setEmail(emailAddress);
					user = userEntityDAO.saveUser(user);
					return user;
				}
			} catch (FacebookException facebookexception) {
				logger.error("could not get facebook user info");
			}
		}
	
		return user;
	}
}
