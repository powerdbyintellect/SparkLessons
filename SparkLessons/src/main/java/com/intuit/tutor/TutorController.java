package com.intuit.tutor;

import org.apache.commons.io.IOUtils;
import org.apache.http.client.ClientProtocolException;
import org.jboss.resteasy.client.ClientRequest;
import org.jboss.resteasy.client.ClientResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.Unmarshaller;
import java.io.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Random;
import java.util.UUID;

@Controller

public class TutorController {
	
	private static final String XML_FILE_PATH = "/";
    private static final String FILE_NAME_1 = "locationServiceRequest.xml";
    private static final String FILE_NAME_2 = "couponServiceRequest.xml";
    
    @RequestMapping(value="/",  method = RequestMethod.GET)
    public String printWelcome(ModelMap model) {
        System.out.println("Inside location controller");     //dbaName, Address (street, city, state, zipcode, phonenumber), businessdescription
        model.addAttribute("message", "Welcome to Intuit Discounts!");
        return "index";
    }

    
    @RequestMapping(value="/search", method = RequestMethod.GET)
    public String searchRequest(ModelMap model) throws Exception {
    	  System.out.println("Inside search request");  
	      ModelAndView mav = new ModelAndView("locationSearch") ;
//	      mav.addObject("locationSearch", locationSearch);
//	      ArrayList businessCategory = new ArrayList();
//	      mav.addObject("busCategoryList", businessCategory);
    	return "search";
    }
    
    
    @RequestMapping(value="/customer", method = RequestMethod.GET)
    public String customerCouponRequest(ModelMap model) throws Exception {
    	//String id = (String) model.getAttribute("id");
    	return "customer";
    }
    
    @RequestMapping(value="/about", method = RequestMethod.GET)
    public String aboutRequest(ModelMap model) throws Exception {
    	//String id = (String) model.getAttribute("id");
    	return "about";
    }
    
    @RequestMapping(value="/contact", method = RequestMethod.GET)
    public String contactRequest(ModelMap model) throws Exception {
    	//String id = (String) model.getAttribute("id");
    	return "contact";
    }
}