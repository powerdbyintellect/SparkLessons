package com.intuit.tutor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerController {
	  @RequestMapping(value="/login",  method = RequestMethod.GET)
	    public String printWelcome(ModelMap model) {
	        System.out.println("Inside Customer controller");     //dbaName, Address (street, city, state, zipcode, phonenumber), businessdescription
	        model.addAttribute("message", "Welcome to Spark Lessons");
	        return "index";
	    }
}
