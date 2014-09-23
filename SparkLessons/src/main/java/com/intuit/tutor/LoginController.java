package com.intuit.tutor;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXBElement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.intuit.platform.integration.ius.common.types.IAMTicket;
import com.intuit.tutor.entity.UserEntity;
import com.intuit.tutor.entity.dao.UserEntityDAO;

@Controller
public class LoginController {

	@Autowired
	private IamRESTInterface iamRESTClient;
	
	@Autowired
	private UserEntityDAO userEntityDAO;
	
	@Transactional
	@RequestMapping(value = "/sign-in", method = RequestMethod.POST)
	public String signin( @RequestParam(value="email", required=true) String email, @RequestParam(value="password", required=true) String password, HttpServletRequest request, Model model) {
		
		JAXBElement<IAMTicket> existingUserTicket = iamRESTClient.signin( UUID.randomUUID().toString().replace("-", ""),  "{\"username\":\"" + email + "\",\"password\":\"" +  password + "\"}");
		if(existingUserTicket!=null) {
			IAMTicket ticket = existingUserTicket.getValue();
			request.getSession().setAttribute("ticket", ticket);
			UserEntity userEntity = userEntityDAO.getUserByRealmId(ticket.getRealmId());
			if(userEntity == null) {
				userEntity = new UserEntity();
				userEntity.setEmail(email);
				userEntity.setRealmid(ticket.getRealmId());
				userEntity.setUserid(ticket.getUserId());
				userEntityDAO.saveUser(userEntity);
			}
			model.addAttribute("user", userEntity);
		}
		return "create-profile";
	}
	
	@RequestMapping(value="/sign-in", method = RequestMethod.GET) 
	public String sign() {
		return "sign-in";
	}
}
