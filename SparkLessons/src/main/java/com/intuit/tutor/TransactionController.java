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
	public ModelAndView ownerHandler(com.intuit.tutor.entity.CreditCard userCreditCard) {
		
		
		
		CreditCardCharge charge = objectFactory.createCreditCardCharge();
		CreditCard creditCard = new CreditCard();
		creditCard.setCreditCardNumber(userCreditCard.getCreditCardNumber());
		creditCard.setCreditCardPostalCode(userCreditCard.getPostalCode());
		creditCard.setExpirationMonth(userCreditCard.getExperiationMonth());
		creditCard.setExpirationYear(new BigInteger(userCreditCard.getExperiationYear().toString()));
		creditCard.setNameOnCard(userCreditCard.getNameOnCard());
		charge.setCreditCard(creditCard );
		charge.setAmount(userCreditCard.getChargeAmount());
		charge.setCardSecurityCode(userCreditCard.getSecurityCode());
		
		JAXBElement<CreditCardResponse> response = restClient.chargeCreditCard(userCreditCard.getRealmId(), UUID.randomUUID().toString(), objectFactory.createCreditCardCharge(charge));
		return new ModelAndView("charge", "creditCardResponse", response.getValue());
        //return new ModelMap(response.getValue());
    }
	
	//authorize charge
	//deposit payment
	//error condition
}
