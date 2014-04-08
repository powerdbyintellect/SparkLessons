package com.intuit.tutor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import com.intuit.tutor.transaction.CreditCard;
import com.intuit.tutor.transaction.CreditCardCharge;

@Controller
public class TransactionController {
	
	@Autowired
	private PaymentsRESTInterface restClient;
	
	//accept card
	@RequestMapping(value="/charge", method = RequestMethod.GET)
	public ModelMap ownerHandler(@RequestParam("realmid") String realmid) {
		
		
		
		CreditCardCharge charge = new CreditCardCharge();
		CreditCard creditCard = new CreditCard();
		charge.setCreditCard(creditCard );
		
		restClient.chargeCreditCard(realmid, charge);
        return new ModelMap(null);
    }
	
	//authorize charge
	//deposit payment
	//error condition
}
