package com.springapp.mvc;

import location.IncentiveResponse;
import location.LocationBusinessResponse;
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

public class LocationController {
	
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
		  LocationSearch locationSearch = new LocationSearch();
	      ModelAndView mav = new ModelAndView("locationSearch") ;
	      mav.addObject("locationSearch", locationSearch);
//	      ArrayList businessCategory = new ArrayList();
//	      mav.addObject("busCategoryList", businessCategory);
    	return "search";
    }
    
    @RequestMapping(value="/merchant", method = RequestMethod.GET)
    public String merchantRequest(ModelMap model) throws Exception {
    	  System.out.println("Inside merchant request");  
    	  CouponInfo couponInfo = new CouponInfo();
	      ModelAndView mav = new ModelAndView("couponInfo") ;
	      mav.addObject("couponinfo", couponInfo);
    	return "merchant";
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
    
    @RequestMapping(value="/barcode", method = RequestMethod.GET)
    public String customerBarCodeRequest(ModelMap model) throws Exception {
    	//String id = (String) model.getAttribute("id");
    	return "barcode";
    }
    
    @RequestMapping(value="/couponSearch",  method = RequestMethod.POST)
    public String couponSearch(ModelMap model, CouponInfo couponInfo) {
    	 try {
         	 
    	 	   String merchantname = couponInfo.getMerchantname()!=null?couponInfo.getMerchantname():"";
        	   String merchantaccount = couponInfo.getMerchantaccount()!=null ? couponInfo.getMerchantaccount() : "";
        	   String expirationdate = couponInfo.getExpirationdate()!= null ? couponInfo.getExpirationdate() : "";
        	   BigDecimal mintransactionamount = couponInfo.getMintransactionamount()!= null ? couponInfo.getMintransactionamount() : BigDecimal.ZERO;
        	   String startdate = couponInfo.getStartdate() != null ? couponInfo.getStartdate() : "";
        	   Integer couponcount = couponInfo.getCouponcount() != null ? couponInfo.getCouponcount() : new Integer(0);
        	   BigDecimal discountpercent = couponInfo.getDiscountpercent() !=null ? couponInfo.getDiscountpercent() : BigDecimal.ZERO;
        	   
	   	       ClientRequest request = new ClientRequest(
                    "http://localhost:8080/LocationService/SendRequest");
               
               // Replace value for ZipCode in the request XML
               String originalLocationString = createLocationRequestFromXml(FILE_NAME_2);
               String newLocationString = originalLocationString.replaceFirst("\\<ns2:merchantname\\>.*\\</ns2:merchantname\\>", "<ns2:merchantname>"+merchantname+"</ns2:merchantname>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:merchantaccount\\>.*\\</ns2:merchantaccount\\>", "<ns2:merchantaccount>"+merchantaccount+"</ns2:merchantaccount>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:mintransactionamount\\>.*\\</ns2:mintransactionamount\\>", "<ns2:mintransactionamount>"+mintransactionamount+"</ns2:mintransactionamount>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:expirationdate\\>.*\\</ns2:expirationdate\\>", "<ns2:expirationdate>"+expirationdate+"</ns2:expirationdate>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:startdate\\>.*\\</ns2:startdate\\>", "<ns2:startdate>"+startdate+"</ns2:startdate>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:couponcount\\>.*\\</ns2:couponcount\\>", "<ns2:couponcount>"+couponcount+"</ns2:couponcount>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:discountpercent\\>.*\\</ns2:discountpercent\\>", "<ns2:discountpercent>"+discountpercent+"</ns2:discountpercent>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:channel\\>.*\\</ns2:channel\\>", "<ns2:channel>UI</ns2:channel>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:submitter\\>.*\\</ns2:submitter\\>", "<ns2:submitter>TEST</ns2:submitter>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:transactionId\\>.*\\</ns2:transactionId\\>", "<ns2:transactionId>"+UUID.randomUUID().toString()+"</ns2:transactionId>");

               request.accept("application/xml");
               request.body("application/xml", newLocationString.toString());
               ClientResponse<String> response = request.post(String.class);
               if (response.getStatus() != 200) {
                   throw new RuntimeException("Failed : HTTP error code : "
                           + response.getStatus());
               }
               BufferedReader br = new BufferedReader(new InputStreamReader(
                       new ByteArrayInputStream(response.getEntity().getBytes())));
               String output;
               while ((output = br.readLine()) != null) {
//                   System.out.println(output);
               }
               InputStream is = new ByteArrayInputStream( response.getEntity().getBytes() );
               JAXBContext jaxbContext = JAXBContext.newInstance(IncentiveResponse.class);
               Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();
               IncentiveResponse couponResponse = (IncentiveResponse) unmarshaller.unmarshal(is);
               model.addAttribute("couponList", couponResponse.getCoupons());
    		 
//    		 
//    		 ArrayList couponList = new ArrayList();
//    		 MerchantCouponInfo mc  = new MerchantCouponInfo();
//    		 mc.setMerchantname("TEST MERCHANT");
//    		 mc.setCouponcode(UUID.randomUUID().toString());
//    		 mc.setExpirationdate("12/30/2013");
//    		 mc.setMintransactionamount(new BigDecimal("100"));
//    		 mc.setDiscountpercent(new BigDecimal("10"));
//    		 couponList.add(mc);
//    		 
//    		 MerchantCouponInfo mc1  = new MerchantCouponInfo();
//    		 mc1.setMerchantname("TEST MERCHANT");
//    		 mc1.setCouponcode(UUID.randomUUID().toString());
//    		 mc1.setExpirationdate("1/30/2013");
//    		 mc1.setMintransactionamount(new BigDecimal("75"));
//    		 mc1.setDiscountpercent(new BigDecimal("5"));
//    		 couponList.add(mc1);
//    		 
//             model.addAttribute("couponList", couponList);
      	
      } catch (Exception e) {
          e.printStackTrace();
      }
      return "customer";
    }
    
    @RequestMapping(value="/couponGenerate", method = RequestMethod.POST)
    public String couponRequest(ModelMap model, CouponInfo couponInfo) throws Exception {
        try {
        	   String merchantname = couponInfo.getMerchantname()!=null?couponInfo.getMerchantname():"";
        	   String merchantaccount = couponInfo.getMerchantaccount()!=null ? couponInfo.getMerchantaccount() : "";
        	   String expirationdate = couponInfo.getExpirationdate()!= null ? couponInfo.getExpirationdate() : "";
        	   BigDecimal mintransactionamount = couponInfo.getMintransactionamount()!= null ? couponInfo.getMintransactionamount() : BigDecimal.ZERO;
        	   String startdate = couponInfo.getStartdate() != null ? couponInfo.getStartdate() : "";
        	   Integer couponcount = couponInfo.getCouponcount() != null ? couponInfo.getCouponcount() : new Integer(0);
        	   BigDecimal discountpercent = couponInfo.getDiscountpercent() !=null ? couponInfo.getDiscountpercent() : BigDecimal.ZERO;
        	   
	   	       ClientRequest request = new ClientRequest(
                    "http://localhost:8080/LocationService/SendRequest");
               
               // Replace value for ZipCode in the request XML
               String originalLocationString = createLocationRequestFromXml(FILE_NAME_2);
               String newLocationString = originalLocationString.replaceFirst("\\<ns2:merchantname\\>.*\\</ns2:merchantname\\>", "<ns2:merchantname>"+merchantname+"</ns2:merchantname>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:merchantaccount\\>.*\\</ns2:merchantaccount\\>", "<ns2:merchantaccount>"+merchantaccount+"</ns2:merchantaccount>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:mintransactionamount\\>.*\\</ns2:mintransactionamount\\>", "<ns2:mintransactionamount>"+mintransactionamount+"</ns2:mintransactionamount>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:expirationdate\\>.*\\</ns2:expirationdate\\>", "<ns2:expirationdate>"+expirationdate+"</ns2:expirationdate>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:startdate\\>.*\\</ns2:startdate\\>", "<ns2:startdate>"+startdate+"</ns2:startdate>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:couponcount\\>.*\\</ns2:couponcount\\>", "<ns2:couponcount>"+couponcount+"</ns2:couponcount>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:discountpercent\\>.*\\</ns2:discountpercent\\>", "<ns2:discountpercent>"+discountpercent+"</ns2:discountpercent>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:channel\\>.*\\</ns2:channel\\>", "<ns2:channel>UI</ns2:channel>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:submitter\\>.*\\</ns2:submitter\\>", "<ns2:submitter>TEST</ns2:submitter>");
               newLocationString = newLocationString.replaceFirst("\\<ns2:transactionId\\>.*\\</ns2:transactionId\\>", "<ns2:transactionId>"+UUID.randomUUID().toString()+"</ns2:transactionId>");

               request.accept("application/xml");
               request.body("application/xml", newLocationString.toString());
               ClientResponse<String> response = request.post(String.class);
               if (response.getStatus() != 200) {
                   throw new RuntimeException("Failed : HTTP error code : "
                           + response.getStatus());
               }
               BufferedReader br = new BufferedReader(new InputStreamReader(
                       new ByteArrayInputStream(response.getEntity().getBytes())));
               String output;
               while ((output = br.readLine()) != null) {
//                   System.out.println(output);
               }
               InputStream is = new ByteArrayInputStream( response.getEntity().getBytes() );
               JAXBContext jaxbContext = JAXBContext.newInstance(IncentiveResponse.class);
               Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();
               IncentiveResponse couponResponse = (IncentiveResponse) unmarshaller.unmarshal(is);
               model.addAttribute("couponList", couponResponse.getCoupons());
        	
        	
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "merchant";
    }
    
    @RequestMapping(value="/sendRequest", method = RequestMethod.POST)
    public String sendRequest(ModelMap model, LocationSearch locationSearch) throws Exception {
        try {
            ClientRequest request = new ClientRequest(
                    "http://localhost:8090/LocationService/SendRequest");
            
            String zipcode = locationSearch.getZipcode()!=null?locationSearch.getZipcode():"";
	        String city = locationSearch.getCity()!=null?locationSearch.getCity():"";
	        String state = locationSearch.getState()!=null?locationSearch.getState():"";
	        String latitude = locationSearch.getLatitude()!=null?locationSearch.getLatitude():"";
	        String longitude = locationSearch.getLongitude()!=null?locationSearch.getLongitude():"";
	        
            
            // Replace value for ZipCode in the request XML
            String originalLocationString = createLocationRequestFromXml(FILE_NAME_1);
            String newLocationString = originalLocationString.replaceFirst("\\<ns2:zipcode\\>.*\\</ns2:zipcode\\>", "<ns2:zipcode>"+zipcode+"</ns2:zipcode>");
            newLocationString = newLocationString.replaceFirst("\\<ns2:city\\>.*\\</ns2:city\\>", "<ns2:city>"+city+"</ns2:city>");
            newLocationString = newLocationString.replaceFirst("\\<ns2:state\\>.*\\</ns2:state\\>", "<ns2:state>"+state+"</ns2:state>");
            newLocationString = newLocationString.replaceFirst("\\<ns2:latitude\\>.*\\</ns2:latitude\\>", "<ns2:latitude>"+latitude+"</ns2:latitude>");
            newLocationString = newLocationString.replaceFirst("\\<ns2:longitude\\>.*\\</ns2:longitude\\>", "<ns2:longitude>"+longitude+"</ns2:longitude>");
            newLocationString = newLocationString.replaceFirst("\\<ns2:channel\\>.*\\</ns2:channel\\>", "<ns2:channel>UI</ns2:channel>");
            newLocationString = newLocationString.replaceFirst("\\<ns2:submitter\\>.*\\</ns2:submitter\\>", "<ns2:submitter>TEST</ns2:submitter>");
            newLocationString = newLocationString.replaceFirst("\\<ns2:transactionId\\>.*\\</ns2:transactionId\\>", "<ns2:transactionId>"+UUID.randomUUID().toString()+"</ns2:transactionId>");
//            System.out.println("Request XML: " + newLocationString.toString());
            request.accept("application/xml");
            request.body("application/xml", newLocationString.toString());
            ClientResponse<String> response = request.post(String.class);
            if (response.getStatus() != 200) {
                throw new RuntimeException("Failed : HTTP error code : "
                        + response.getStatus());
            }
            BufferedReader br = new BufferedReader(new InputStreamReader(
                    new ByteArrayInputStream(response.getEntity().getBytes())));
            String output;
            while ((output = br.readLine()) != null) {
//                System.out.println(output);
            }
            InputStream is = new ByteArrayInputStream( response.getEntity().getBytes() );
            JAXBContext jaxbContext = JAXBContext.newInstance(LocationBusinessResponse.class);
            Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();
            LocationBusinessResponse response1 = (LocationBusinessResponse) unmarshaller.unmarshal(is);
            model.addAttribute("businessList", response1.getBusinesses());
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "search";
    }
    
    private String createLocationRequestFromXml(String fileName) {

        try {
            InputStream fileStream = LocationController.class.getResourceAsStream(XML_FILE_PATH + fileName);
            StringWriter writer = new StringWriter();
            IOUtils.copy(fileStream, writer);
            String merchOrderMaterials = writer.toString();
            merchOrderMaterials = merchOrderMaterials.replaceFirst("TESTAPS-000002", ""+new Random().nextInt());
            return merchOrderMaterials;
        } catch (Exception e) { }

        return null;
    }
}