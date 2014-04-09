package com.intuit.tutor;

import javax.ws.rs.Consumes;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBElement;

import com.intuit.payments.sdk.jaxb.types.CreditCardCharge;
import com.intuit.payments.sdk.jaxb.types.CreditCardResponse;

@Path("/sdk")
public interface PaymentsRESTInterface {

	@Path("/v7/company/{realmid}/creditcard/charge")
	@POST
	@Consumes(MediaType.APPLICATION_XML)
    @Produces(MediaType.APPLICATION_XML)
	public JAXBElement<CreditCardResponse> chargeCreditCard(@PathParam("realmid") String realmId, @HeaderParam("intuit_tid") String intuit_tid, JAXBElement<CreditCardCharge> creditCardCharge);
}
