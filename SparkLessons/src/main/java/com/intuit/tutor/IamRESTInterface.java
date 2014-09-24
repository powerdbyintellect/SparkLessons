package com.intuit.tutor;

import javax.ws.rs.Consumes;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.xml.bind.JAXBElement;

import com.intuit.platform.integration.ius.common.types.IAMTicket;
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
	
	@Path("/users")
	@Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_XML)
	public JAXBElement<User> findUser(@HeaderParam("intuit_tid") String intuit_tid, @QueryParam("username") String username);
	
}
