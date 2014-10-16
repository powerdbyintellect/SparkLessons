package com.intuit.tutor;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXBElement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import twitter4j.Twitter;
import twitter4j.TwitterFactory;

import com.intuit.platform.integration.ius.common.types.Address;
import com.intuit.platform.integration.ius.common.types.ChallengeQuestionAnswer;
import com.intuit.platform.integration.ius.common.types.Email;
import com.intuit.platform.integration.ius.common.types.FullName;
import com.intuit.platform.integration.ius.common.types.IAMTicket;
import com.intuit.platform.integration.ius.common.types.ObjectFactory;
import com.intuit.platform.integration.ius.common.types.User;
import com.intuit.tutor.entity.UserEntity;
import com.intuit.tutor.entity.dao.UserEntityDAO;

import facebook4j.Facebook;
import facebook4j.FacebookFactory;


@Controller
public class BaseCustomerController {

	@Autowired
	private UserEntityDAO userEntityDAO;
	
	@Autowired
	private IamRESTInterface iamRESTClient;
	
	private ObjectFactory objectFactory = new ObjectFactory();
	
	private static final Logger logger = LoggerFactory.getLogger(BaseCustomerController.class);;
	
	public UserEntity getUserAndCreate(HttpServletRequest request)  {
		IAMTicket ticket = (IAMTicket) request.getSession().getAttribute("ticket");
		UserEntity user = null;
		if(ticket != null) {
			user = userEntityDAO.getUserByUserId(ticket.getUserId());
		}
	
		return user;
	}
	
	public IAMTicket getTicket(HttpServletRequest request) {
		IAMTicket ticket = (IAMTicket) request.getSession().getAttribute("ticket");
		return ticket;
	}
	
	public Facebook getFacebook(HttpServletRequest request) {
		Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
		if(facebook == null) {
			facebook = new FacebookFactory().getInstance();
			request.getSession().setAttribute("facebook", facebook);
		}
		return facebook;
	}
	
	public Twitter getTwitter(HttpServletRequest request) {
		Twitter twitter = (Twitter) request.getSession().getAttribute("twitter");
		if(twitter == null) {
			twitter = new TwitterFactory().getInstance();
			request.getSession().setAttribute("twitter", twitter);
		}
		return twitter;
	}
	protected IAMTicket createIAMUser(UserEntity sparkRentUser, String password)
			throws Exception {
		
		User user = new User();
		JAXBElement<IAMTicket> existingUserTicket = null;
		IAMTicket ticket = null; 
		String guuid = UUID.randomUUID().toString().replace("-", "");
		user.setUsername(sparkRentUser.getEmail());
		user.setPassword(password);
		Email email = new Email();
		email.setAddress(sparkRentUser.getEmail());
		email.setPrimary(Boolean.TRUE);
		user.setEmail(email);
		
		user.setSecurityLevel("HIGH");
		ChallengeQuestionAnswer qa = new ChallengeQuestionAnswer();
		qa.setQuestion("Who is your all-time favorite movie character?");
		qa.setAnswer("Elmo");
		user.getChallengeQuestionAnswer().add(qa);
		
		FullName fullName = new FullName();
		fullName.setGivenName(sparkRentUser.getFirstname());
		fullName.setSurName(sparkRentUser.getLastname());
		user.getFullName().add(fullName);
		try {
			existingUserTicket = iamRESTClient.signin(guuid,  "{\"username\":\"" + sparkRentUser.getEmail() + "\",\"password\":\"" +  password + "\"}");
		} catch (Exception e) {
			logger.debug("User Already Exits");
		}
		if(null == existingUserTicket) {
			iamRESTClient.signup(guuid, objectFactory.createUser(user));
			String body = "{\"username\":\"" + user.getUsername() + "\",\"password\":\"" +  user.getPassword() + "\"}";
			JAXBElement<IAMTicket> iamTicketElement = iamRESTClient.signin(guuid, body);
			ticket = iamTicketElement.getValue();
			
		} else {
			ticket = existingUserTicket.getValue();
		}

		return ticket;
	}
	
}
