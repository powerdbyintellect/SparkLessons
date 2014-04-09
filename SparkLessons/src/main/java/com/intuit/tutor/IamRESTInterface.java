package com.intuit.tutor;

import java.util.ArrayList;

import javax.ws.rs.BeanParam;
import javax.ws.rs.Consumes;
import javax.ws.rs.FormParam;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.MultivaluedMap;
import javax.xml.bind.JAXBElement;

import org.apache.http.NameValuePair;

import com.intuit.platform.integration.ius.common.types.IAMTicket;
import com.intuit.platform.integration.ius.common.types.IAMTicketSignInRequest;
import com.intuit.platform.integration.ius.common.types.User;

@Path("/v1")
public interface IamRESTInterface {


	@Path("/users")
	@POST
	@Consumes(MediaType.APPLICATION_XML)
    @Produces(MediaType.APPLICATION_XML)
	public JAXBElement<User> signup(@HeaderParam("intuit_tid") String intuit_tid, JAXBElement<User> user);
	
	@Path("/iamtickets")
	@POST
	@Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_XML)
	public JAXBElement<IAMTicket> signin(@HeaderParam("intuit_tid") String intuit_tid, String body);
}
