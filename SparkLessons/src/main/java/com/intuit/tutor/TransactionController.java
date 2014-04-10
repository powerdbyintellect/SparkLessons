package com.intuit.tutor;

import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.OutputStream;
import java.io.StringWriter;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Map;
import java.util.UUID;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.namespace.QName;
import javax.xml.transform.Result;
import javax.xml.transform.stream.StreamResult;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.oxm.XmlMappingException;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.intuit.payments.sdk.jaxb.types.CreditCard;
import com.intuit.payments.sdk.jaxb.types.CreditCardCharge;
import com.intuit.payments.sdk.jaxb.types.CreditCardResponse;
import com.intuit.payments.sdk.jaxb.types.ObjectFactory;

@Controller
public class TransactionController {
	
	@Autowired
	private PaymentsRESTInterface restClient;
	
	@Autowired
	private Jaxb2Marshaller jaxbMarshaller;
	
	private ObjectFactory objectFactory = new ObjectFactory();
	
	
	//accept card
	@RequestMapping(value="/charge", method = RequestMethod.POST)
	public ModelAndView ownerHandler(@RequestParam("cc_number") String ccNumber, @RequestParam("cc_exp_year") String expYear, @RequestParam("cc_exp_month") String expMonth, 
			@RequestParam("cc_cvc") String cvc, @RequestParam("cc_name") String ccName, @RequestParam("realmId") String realmId, @RequestParam("chargeamount") String chargeAmount ) {
		
		
		
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
		
		JAXBElement<CreditCardResponse> response = restClient.chargeCreditCard(realmId, UUID.randomUUID().toString(), objectFactory.createCreditCardCharge(charge));
		//model.put("creditCardResponse", response.getValue());
		return new ModelAndView("charge", "creditCardResponse", response.getValue());
        //return new ModelMap(response.getValue());
		//return "charge";
    }
	
	//authorize charge
	//deposit payment
	//error condition
}
