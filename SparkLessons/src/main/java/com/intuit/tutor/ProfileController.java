package com.intuit.tutor;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletRequest;

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

import com.intuit.tutor.entity.UserEntity;
import com.intuit.tutor.entity.dao.UserEntityDAO;

import facebook4j.Facebook;

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
		return "profile";
	}

	@Transactional
	@RequestMapping(value = "/updateprofile", method = RequestMethod.POST)
	public String savePage(@ModelAttribute UserEntity user, Model model, @RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception{
		
		UserEntity savedUser = getUserAndCreate(request);
		if(savedUser == null) {
			return "home";
		}
		savedUser.setFirstname(user.getFirstname());
		savedUser.setLastname(user.getLastname());
		savedUser.setDescription(user.getDescription());
		savedUser.setRate(user.getRate());
		
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
		return "viewprofile";
		
	}
	
	@Transactional
	@RequestMapping(value = "/viewprofile/{id}", method = RequestMethod.GET)
	public String viewProfile(Model model, HttpServletRequest request, @PathVariable("id") String userId ) throws Exception{
		UserEntity user = null;
		if(userId != null) {
			user = userEntityDAO.getUserByLoginId(userId);
		} else {
			user = getUserAndCreate(request);
		}
		model.addAttribute("user", user);
		return "viewprofile";
		
	}
}