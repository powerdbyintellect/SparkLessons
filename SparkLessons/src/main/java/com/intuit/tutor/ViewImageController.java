package com.intuit.tutor;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.intuit.tutor.entity.UserEntity;
import com.intuit.tutor.entity.dao.UserEntityDAO;

@Controller
public class ViewImageController {

	private static final Logger logger = LoggerFactory.getLogger(ViewImageController.class);
	
	@Value("${logo.path}")
	private String logoPath;
	
	@Autowired
	private UserEntityDAO userEntityDAO;
	
	@RequestMapping(value = "/profileimages/{userid}")
	@ResponseBody
	public byte[] profileImage(@PathVariable Long userid)  {
		try {
			UserEntity user = userEntityDAO.getById(userid);
			return FileUtils.readFileToByteArray(new File(user.getLogoLocation()));
		} catch (IOException ioe) {
			logger.error("could not read file: " + logoPath + userid);
		}
		return null;
	}
}
