package com.intuit.tutor;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.intuit.platform.integration.ius.common.types.IAMTicket;
import com.intuit.tutor.entity.UserEntity;
import com.intuit.tutor.entity.dao.UserEntityDAO;

@Controller
public class BaseCustomerController {

	@Autowired
	private UserEntityDAO userEntityDAO;
	
	private static final Logger logger = LoggerFactory.getLogger(BaseCustomerController.class);;
	
	public UserEntity getUserAndCreate(HttpServletRequest request)  {
		IAMTicket ticket = (IAMTicket) request.getSession().getAttribute("ticket");
		
		UserEntity user = null;
		if(ticket != null) {
			user = userEntityDAO.getUserByRealmId(ticket.getRealmId());
		}
	
		return user;
	}
	
	public IAMTicket getTicket(HttpServletRequest request) {
		IAMTicket ticket = (IAMTicket) request.getSession().getAttribute("ticket");
		return ticket;
	}
}
