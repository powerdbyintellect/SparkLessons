package com.intuit.tutor;

import java.io.InputStream;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Random;
import java.util.UUID;

import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.intuit.tutor.entity.Address;
import com.intuit.tutor.entity.Customer;
import com.intuit.psd.cdm.v1.*;

@Controller
public class CustomerController {
	 private static final String XML_FILE_PATH = "/";
	 public static final String QA = "https://onboarding-qa.payments.intuit.net/v1/orders";
     public static final String QA2 = "https://onboarding-qa2.payments.intuit.net/v1/orders";
     public static final String PTC	= "https://onboarding-ptc.payments.intuit.net/v1/orders";
     public static final String PERF =	"https://onboarding-perf.payments.intuit.net/v1/orders";
       
	  @RequestMapping(value="/login",  method = RequestMethod.GET)
	    public String printWelcome(ModelMap model) {
	        System.out.println("Inside Customer controller");     //dbaName, Address (street, city, state, zipcode, phonenumber), businessdescription
	        model.addAttribute("message", "Welcome to Spark Lessons");
	        return "index";
	    }
	  
	   @RequestMapping(value="/order", method = RequestMethod.GET) 
		 public String initializePage(ModelMap model) {
		   System.out.println("Inside Customer Controller");
		   Customer customer = new Customer();
		   Address address = new Address();
		   ModelAndView mav = new ModelAndView("customer") ;
		   mav.addObject("customer", customer);
		   mav.addObject("address", address);
		   return "order";
	   }
	   
	   @RequestMapping(value="/addCustomer", method = RequestMethod.POST)
	    public String addCustomer(ModelMap model, Customer customer, Address address) throws Exception {
		   System.out.println("F: "+customer.getFirstname()+"\nL: "+customer.getLastname()+"\nAddr: "+
				   address.getStreetAddress1()+" "+address.getCity()+" "+address.getState()+" "+address.getZipCode());
		   
//	        RequestSenderCXF client = new RequestSenderCXF();
//	        String sampleMerchantOrderMaterialsFromXml = createSampleMerchantOrderMaterialsFromXml("");
//	        HashMap<String, String> headers = new HashMap<String, String>();
//	        headers.put("intuit_tid", "" + UUID.randomUUID());
//	        headers.put("intuit_originatingip", "10.10.21.121");
//	        headers.put("activation_partner_code", "Foo");
//	        headers.put("activation_source", "Foo");
//	        headers.put("activation_transaction_id", "" + System.currentTimeMillis());
//	        headers.put("activation_subscriber_id", "Foo");
//	        headers.put("activation_originating_ip", "Foo");
//	        headers.put("fail_on_processor", "CrmStateChangeProcessor");
//
//	        //String newMomString = sampleMerchantOrderMaterialsFromXml.replaceFirst("(?i)\\<ApplicationChannel\\>.*\\</ApplicationChannel\\>", "<ApplicationChannel>QBDT_IPD</ApplicationChannel>");
//	        String newMomString = sampleMerchantOrderMaterialsFromXml.replaceFirst("(?i)\\<Id\\>.*\\</Id\\>", "<Id>" + System.currentTimeMillis() + "</Id>");
//	        newMomString =  newMomString.replaceFirst("(?i)\\<MasterAccountId\\>.*\\</MasterAccountId\\>", "<MasterAccountId>" + generateRandomMasterAccountId() + "</MasterAccountId>");
////	        System.out.println("request = " + newMomString);
//
//	        //qa1
//	        String response = (String) client.send("https://onboarding-qa.payments.intuit.net/v1/orders", newMomString, String.class, headers);

	        
		   
		   return "order";
	   }
	   

	    private String createSampleMerchantOrderMaterialsFromXml(String fileName) {

	        try {
	            InputStream fileStream = CustomerController.class.getResourceAsStream(XML_FILE_PATH + fileName);
	            StringWriter writer = new StringWriter();
	            IOUtils.copy(fileStream, writer);
	            String merchOrderMaterials = writer.toString();
	            merchOrderMaterials = merchOrderMaterials.replaceFirst("TESTAPS-000002", ""+new Random().nextInt());
	            return merchOrderMaterials;
	        } catch (Exception e) { }

	        return null;
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
