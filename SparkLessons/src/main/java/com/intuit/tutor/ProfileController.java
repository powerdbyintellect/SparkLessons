package com.intuit.tutor;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.GregorianCalendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.codehaus.jackson.map.ser.StdSerializers.UtilDateSerializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import twitter4j.auth.RequestToken;

import com.intuit.platform.integration.ius.common.types.IAMTicket;
import com.intuit.tutor.entity.UserEntity;
import com.intuit.tutor.entity.dao.UserEntityDAO;

import facebook4j.Account;
import facebook4j.Facebook;
import facebook4j.FacebookFactory;
import facebook4j.PostUpdate;
import facebook4j.ResponseList;
import facebook4j.User;
import facebook4j.auth.AccessToken;
import facebook4j.auth.Authorization;

@Controller
public class ProfileController extends BaseCustomerController{

	@Autowired
	private UserEntityDAO userEntityDAO;
	
	@Value("${logo.path}")
	private String logoPath;
	
	private static final Logger logger = LoggerFactory.getLogger(ProfileController.class);;
	
	@Transactional
	@RequestMapping(value = "/profile", method = RequestMethod.GET)
	public String initializePage(Model model, HttpServletRequest request) throws Exception {
	
		UserEntity user = getUserAndCreate(request);
		model.addAttribute("user", user);
		return "project-page";
	}
	
	@Transactional
	@RequestMapping(value = "/create-profile", method = RequestMethod.GET)
	public String createProfilePage(Model model, HttpServletRequest request) throws Exception {
	
		UserEntity user = getUserAndCreate(request);
		model.addAttribute("user", user);
		return "create-profile";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String signUpPage(Model model, HttpServletRequest request) throws Exception {
		UserEntity user = new UserEntity();
		model.addAttribute("user", user);
		model.addAttribute("newuser", true);
		return "create-profile";
	}
	
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String signUpFromHomePage(Model model, @RequestParam(required = false) String email, HttpServletRequest request) throws Exception {
		UserEntity user = new UserEntity();
		user.setEmail(email!=null?email:"");
		model.addAttribute("user", user);
		model.addAttribute("newuser", true);
		return "create-profile";
	}

	@Transactional
	@RequestMapping(value = "/updateprofile", method = RequestMethod.POST)
	public String savePage(@ModelAttribute UserEntity user, Model model, @RequestParam MultipartFile file, @RequestParam(required = false) String password, HttpServletRequest request) throws Exception{
		
		UserEntity savedUser = getUserAndCreate(request);
		if(savedUser == null) {
			savedUser = new UserEntity();
			IAMTicket ticket = createIAMUser(user, password);
			savedUser.setRealmid(ticket.getRealmId());
			request.getSession().setAttribute("ticket", ticket); //Sign them in
			savedUser.setUserid(ticket.getUserId());
			
		}
		savedUser.setFirstname(user.getFirstname());
		savedUser.setLastname(user.getLastname());
		savedUser.setDescription(user.getDescription());
		savedUser.setRate(user.getRate());
		savedUser.setLessoncategory(user.getLessoncategory());
		savedUser.setLessonname(user.getLessonname());
		savedUser.setEmail(user.getEmail());
		
		java.sql.Date date = new java.sql.Date((new GregorianCalendar()).getTimeInMillis());
		savedUser.setCreatedate(date);
		if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
 
                // Create the file on server
                File serverFile = new File(logoPath
                        + File.separator + savedUser.getId());
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
 
                logger.info("Server File Location="
                        + serverFile.getAbsolutePath());
 
               savedUser.setLogoLocation(serverFile.getAbsolutePath());
            } catch (Exception e) {
                logger.error("failed to save file");
            }
        } else {
            logger.debug("No file to upload");
        }
		
		userEntityDAO.saveUser(savedUser);
		model.addAttribute("user", savedUser);
		return "project-page";
		
	}
	
	@Transactional
	@RequestMapping(value = "/viewprofile/{id}", method = RequestMethod.GET)
	public String viewProfile(Model model, HttpServletRequest request, @PathVariable("id") Long userId ) throws Exception{
		UserEntity user = null;
		if(userId != null) {
			user = userEntityDAO.getById(userId);
		} else {
			user = getUserAndCreate(request);
		}
		model.addAttribute("user", user);
		return "project-page";
		
	}
	
	@Transactional
	@RequestMapping(value = "/facebook", method = RequestMethod.GET) 
	public String connectFacebook(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserEntity user = getUserAndCreate(request);
		//Facebook facebook = getFacebook(request);
		String oauthCode = request.getParameter("code");
        user.setFacebookToken(oauthCode);
        //facebook.getOAuthAccessToken(oauthCode);
        //facebook.postStatusMessage("I signed up with spark lessons !!! ");
        userEntityDAO.saveUser(user);
		model.addAttribute("user", user);
		return "project-page";
	}
	
	@Transactional
	@RequestMapping(value = "/twitter", method = RequestMethod.GET) 
	public String connectTwitter(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
		UserEntity user = getUserAndCreate(request);
		
		String verifier = request.getParameter("oauth_verifier");
		user.setTwitterToken(verifier);
	    
        userEntityDAO.saveUser(user);
		model.addAttribute("user", user);
		return "project-page";
	}
				
}
