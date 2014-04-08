package com.intuit.tutor;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.intuit.tutor.transaction.CreditCardAuth;
import com.intuit.tutor.transaction.CreditCardCharge;

@Path("/sdk")
public interface PaymentsRESTInterface {

	@Path("/v7/company/{realmid}/creditcard/charge")
	@POST
	@Consumes(MediaType.APPLICATION_XML)
    @Produces(MediaType.APPLICATION_XML)
	public CreditCardAuth chargeCreditCard(@PathParam("realmid") String realmId, CreditCardCharge creditCardCharge);
}
