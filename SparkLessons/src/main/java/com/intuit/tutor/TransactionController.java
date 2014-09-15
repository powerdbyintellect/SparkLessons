package com.intuit.tutor;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.namespace.QName;
import javax.xml.transform.Result;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.oxm.XmlMappingException;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import twitter4j.Status;
import twitter4j.Twitter;
import twitter4j.TwitterException;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;
import twitter4j.conf.ConfigurationBuilder;

import com.intuit.payments.sdk.jaxb.types.CreditCard;
import com.intuit.payments.sdk.jaxb.types.CreditCardCharge;
import com.intuit.payments.sdk.jaxb.types.CreditCardResponse;
import com.intuit.payments.sdk.jaxb.types.ObjectFactory;

import facebook4j.Facebook;
import facebook4j.FacebookException;

@Controller
public class TransactionController {
	
	private static Logger log = Logger.getLogger(TransactionController.class);
	
	@Autowired
	private PaymentsRESTInterface restClient;
	
	@Autowired
	private Jaxb2Marshaller jaxbMarshaller;
	
	private ObjectFactory objectFactory = new ObjectFactory();
	
	
	//accept card
	@RequestMapping(value="/charge", method = RequestMethod.POST)
	public ModelAndView ownerHandler(@RequestParam("cc_number") String ccNumber, @RequestParam("cc_exp_year") String expYear, @RequestParam("cc_exp_month") String expMonth, 
			@RequestParam("cc_cvc") String cvc, @RequestParam("cc_name") String ccName, @RequestParam("realmId") String realmId, @RequestParam("chargeamount") String chargeAmount, 
			HttpServletRequest request) {
		
		
		
		CreditCardCharge charge = objectFactory.createCreditCardCharge();
		CreditCard creditCard = new CreditCard();
		creditCard.setCreditCardNumber(ccNumber);
		//creditCard.setCreditCardPostalCode(userCreditCard.getPostalCode());
		creditCard.setExpirationMonth(new Integer(expMonth));
		creditCard.setExpirationYear(new BigInteger(expYear));
		creditCard.setNameOnCard(ccName);
		charge.setCreditCard(creditCard );
		if(StringUtils.isEmpty(chargeAmount)) {
			charge.setAmount(new BigDecimal("25.00"));
		} else {
			charge.setAmount(new BigDecimal(chargeAmount));
		}
		charge.setCardSecurityCode(cvc);
		
		if(StringUtils.isEmpty(realmId)) {
			realmId = "1003729781";
		}
		JAXBElement<CreditCardResponse> response = restClient.chargeCreditCard(realmId, UUID.randomUUID().toString(), objectFactory.createCreditCardCharge(charge));
		//model.put("creditCardResponse", response.getValue());
		ModelAndView mav = new ModelAndView("charge");
		mav.addObject("creditCardResponse", response.getValue());
		mav.addObject("amount", charge.getAmount());
		String lessonType = "";
		Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
		if(null!=facebook) {
			lessonType = request.getAttribute("type") == null?"": (String) request.getAttribute("type");
			String ref = response!=null&& response.getValue()!=null && response.getValue().getClientTransID()!=null?"Ref: "+response.getValue().getClientTransID() : "";
			try {
				facebook.postStatusMessage("I just got paid $"+charge.getAmount()+" for giving "+lessonType+" Lessons !!! ");
			} catch (FacebookException e) {
				e.printStackTrace();
			}
		}
		//Twitter Integration 
//		https://apps.twitter.com/app/6866796/keys
		// The factory instance is re-useable and thread safe.
	    /*TwitterFactory factory = new TwitterFactory();
	    AccessToken accessToken = null;
	    Twitter twitter = factory.getInstance();
	    twitter.setOAuthConsumer("CdU4znJoWKeylArzs5dHsZPhb", "ZhNAuzC4cYxPkkYwlj9A32cm35E2v8a7SolkzGUk73hysDBqZv");
	    twitter.setOAuthAccessToken(accessToken);*/
		Twitter twitter = TwitterFactory.getSingleton();
	     // The factory instance is re-useable and thread safe.
	    Status status;
		try {
			//RequestToken requestToken = twitter.getOAuthRequestToken();
            //log.debug(requestToken.getAuthorizationURL());
            //accessToken = twitter.getOAuthAccessToken(requestToken);
    		status = twitter.updateStatus("I just got paid $"+charge.getAmount()+" for giving "+lessonType+" Lessons !!! ");
    		log.debug("Got access token.");
            //log.debug("Access token: " + accessToken.getToken());
            //log.debug("Access token secret: " + accessToken.getTokenSecret());
			log.debug("Successfully updated the status to [" + status.getText() + "].");
		} catch (TwitterException e) {
			// TODO Auto-generated catch block
			log.error(e);
		}
	    
		return mav; //new ModelAndView("charge", "creditCardResponse", response.getValue());
        //return new ModelMap(response.getValue());
		//return "charge";
    }
	
	
	
	//authorize charge
	//deposit payment
	//error condition
}
