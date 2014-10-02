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
import com.intuit.tutor.paymentsv2.Charge;

@Path("")
public interface PaymentsRESTInterface {

	@Path("/v2/charges")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
	public Charge chargeCreditCard(@HeaderParam("Request-Id") String requestid, @HeaderParam("intuit_tid") String intuit_tid, Charge charge);
}
