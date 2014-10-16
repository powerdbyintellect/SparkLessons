package com.intuit.tutor;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXBElement;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;

import com.intuit.payments.sdk.jaxb.types.CreditCard;
import com.intuit.payments.sdk.jaxb.types.CreditCardCharge;
import com.intuit.payments.sdk.jaxb.types.CreditCardResponse;
import com.intuit.payments.sdk.jaxb.types.ObjectFactory;
import com.intuit.tutor.entity.UserEntity;
import com.intuit.tutor.paymentsv2.Address;
import com.intuit.tutor.paymentsv2.Card;
import com.intuit.tutor.paymentsv2.Charge;

import facebook4j.Facebook;
import facebook4j.FacebookException;
import facebook4j.FacebookFactory;

@Controller
public class TransactionController extends BaseCustomerController {
	
	private static Logger log = Logger.getLogger(TransactionController.class);
	
	@Autowired
	private PaymentsRESTInterface restClient;
	
	@Autowired
	private Jaxb2Marshaller jaxbMarshaller;
	
	private ObjectFactory objectFactory = new ObjectFactory();
	
	@RequestMapping(value="/charge", method = RequestMethod.GET) 
	public ModelAndView getChargePage (HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("charge");
		mav.addObject("amount", "0.00");
		return mav;
	}
	
	//accept card
	@RequestMapping(value="/charge", method = RequestMethod.POST)
	public ModelAndView ownerHandler(@RequestParam("cc_number") String ccNumber, @RequestParam("cc_exp_year") String expYear, @RequestParam("cc_exp_month") String expMonth, 
			@RequestParam("cc_cvc") String cvc, @RequestParam("cc_name") String ccName, @RequestParam("realmId") String realmId, @RequestParam("chargeamount") String chargeAmount, 
			HttpServletRequest request) {
		
		UserEntity user = getUserAndCreate(request);
		
//		CreditCardCharge charge = objectFactory.createCreditCardCharge();
//		CreditCard creditCard = new CreditCard();
//		creditCard.setCreditCardNumber(ccNumber);
//		//creditCard.setCreditCardPostalCode(userCreditCard.getPostalCode());
//		creditCard.setExpirationMonth(new Integer(expMonth));
//		creditCard.setExpirationYear(new BigInteger(expYear));
//		creditCard.setNameOnCard(ccName);
//		charge.setCreditCard(creditCard );
//		if(StringUtils.isEmpty(chargeAmount)) {
//			charge.setAmount(new BigDecimal("25.00"));
//		} else {
//			charge.setAmount(new BigDecimal(chargeAmount));
//		}
//		charge.setCardSecurityCode(cvc);
		Charge charge = new Charge();
		Card card = new Card();
		card.setNumber(ccNumber);
		card.setExpMonth(expMonth);
		card.setExpYear(expYear);
		card.setName(ccName);
		card.setCvc(cvc);
		charge.setCard(card );
		if(StringUtils.isEmpty(chargeAmount)) {
			charge.setAmount(new BigDecimal("25.00"));
		} else {
			charge.setAmount(new BigDecimal(chargeAmount));
		}
		
		/*Address address = new Address();
		address.setCity("Sunnyvale");
		address.setRegion("CA");
		address.setPostalCode("94086");
		address.setStreetAddress("1130 Kifer Rd");
		address.setCountry("US");
		card.setAddress(address );*/
		charge.setCurrency("USD");
		
		if(StringUtils.isEmpty(realmId)) {
			realmId = "1003729781";
		}
		
		
		String requestId = UUID.randomUUID().toString();
		
		
		
		Charge response = restClient.chargeCreditCard(requestId, requestId, user.getMasteraccount(), charge);
		//model.put("creditCardResponse", response.getValue());
		ModelAndView mav = new ModelAndView("charge");
		mav.addObject("creditCardResponse", response);
		mav.addObject("amount", charge.getAmount());
		String lessonType = "";
		
		if(user.getFacebookToken() != null) {
			Facebook facebook = getFacebook(request);
			
			try {
				facebook.getOAuthAccessToken(user.getFacebookToken());
				lessonType = request.getAttribute("type") == null?"": (String) request.getAttribute("type");
				facebook.postStatusMessage("I just got paid $"+charge.getAmount()+" for giving "+lessonType+" Lessons !!! ");
			} catch (FacebookException e1) {
				log.error(e1);
			}
		}
		
		if(user.getTwitterToken() != null) {
			Twitter twitter = getTwitter(request);
		    Status status;
			try {
				twitter.getOAuthAccessToken(user.getTwitterToken());
				status = twitter.updateStatus("I just got paid $"+charge.getAmount()+" for giving "+lessonType+" Lessons !!! ");
	    		log.debug("Got access token.");
	        	log.debug("Successfully updated the status to [" + status.getText() + "].");
			} catch (TwitterException e) {
				log.error(e);
			}
		}
	    
		return mav; //new ModelAndView("charge", "creditCardResponse", response.getValue());
        //return new ModelMap(response.getValue());
		//return "charge";
    }
	
	
	
	//authorize charge
	//deposit payment
	//error condition
}