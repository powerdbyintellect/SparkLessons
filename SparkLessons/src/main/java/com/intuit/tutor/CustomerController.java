package com.intuit.tutor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.intuit.tutor.entity.Customer;


@Controller
public class CustomerController {
	  @RequestMapping(value="/login",  method = RequestMethod.GET)
	    public String printWelcome(ModelMap model) {
	        System.out.println("Inside Customer controller");     //dbaName, Address (street, city, state, zipcode, phonenumber), businessdescription
	        model.addAttribute("message", "Welcome to Spark Lessons");
	        return "index";
	    }
	  
	   @RequestMapping(value="/order", method = RequestMethod.GET) 
		 public String initializePage(ModelMap model) {
		   Customer customer = new Customer();
		   ModelAndView mav = new ModelAndView("customer") ;
		   mav.addObject("customer", customer);
		   return "order";
	   }
	   
	   @RequestMapping(value="/addCustomer", method = RequestMethod.POST)
	    public String addCustomer(ModelMap model, Customer customer) throws Exception {
		   
		   return "order";
	   }
	   
	   @RequestMapping(value="/updateCustomer", method = RequestMethod.POST)
	    public String updateCustomer(ModelMap model, Customer customer) throws Exception {
		   return "index";
	   }
	   @RequestMapping(value="/getCustomer", method = RequestMethod.POST)
	    public String getCustomer(ModelMap model, Customer customer) throws Exception {
		   return "index";
	   }
	   @RequestMapping(value="/deleteCustomer", method = RequestMethod.POST)
	    public String deleteCustomer(ModelMap model, Customer customer) throws Exception {
		   return "index";
	   }
	 
}
