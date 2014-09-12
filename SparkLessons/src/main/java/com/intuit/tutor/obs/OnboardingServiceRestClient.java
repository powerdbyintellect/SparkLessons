package com.intuit.tutor.obs;

import java.util.UUID;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.HeaderParam;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.Response;
import javax.xml.bind.JAXBElement;
import javax.ws.rs.core.MediaType;
import com.intuit.psd.cdm.v1.MerchantOrder;
import com.intuit.psd.cdm.v1.RestResponse;

@Path("/v1")
@Produces({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
@Consumes({ MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON })
public interface OnboardingServiceRestClient {
	static final String AUTHORIZATION_PARAM = "Authorization";

	/**
	 * Retrieves status of the MasterAccountApplication for a given condition
	 * <li>If <b>masterAccountApplicationId</b> parameter is specified, then it
	 * is used to find application object</li> <li>If <b>requestId</b> parameter
	 * is specified, then it is used to find the application object</li> <li>If
	 * no parameters are specified, the <b>userAuthId</b> associated with the
	 * caller's Principal is used</li>
	 * 
	 * @param masterAccountId
	 *            MasterAccount Id associated with application(s) to lookup
	 * @param requestId
	 *            client generated request Id used when the application was
	 *            submitted
	 * @return default view of MasterAccountApplication(s) (account status
	 *         element <b>must</b> be populated)
	 * @throws WebApplicationException
	 *             Response.Status.NOT_FOUND account not found for the given
	 *             input arguments Response.Status.UNAUTHORIZED invalid
	 *             credentials in the request
	 */
	@GET
	Response findOrders(
			@QueryParam("master_account_id") String masterAccountId,
			@QueryParam("intuit_tid") UUID requestId) throws Exception;

	/**
	 * Retrieves status of MasterAccountApplication specified by its <b>Id</b>
	 * 
	 * @param id
	 *            MasterAccountApplication Id
	 * @return default view of MasterAccountApplication (account status element
	 *         <b>must</b> be populated)
	 * @throws WebApplicationException
	 *             Response.Status.NOT_FOUND account not found for the given
	 *             input arguments Response.Status.UNAUTHORIZED invalid
	 *             credentials in the request
	 */
	@GET
	@Path("{id}")
	RestResponse findOrderById(@PathParam("id") String id);

	@GET
	@Path("/accounts/{ipsAccountId}")
	@Produces(MediaType.APPLICATION_XML)
	@Consumes(MediaType.APPLICATION_XML)
	public RestResponse getAccount(
			@HeaderParam(AUTHORIZATION_PARAM) String authHeader,
			@HeaderParam("intuit_tid") UUID requestId,
			@PathParam("ipsAccountId") String ipsAccount);

	/**
	 * Updates the existing application with the data sent in the form of the
	 * MasterAccountApplication The service performs "sparse" update, meaning
	 * that the specified MerchantOrder data is merged with the existing one.
	 * 
	 * This operation <b>must</b> respond in less than a second. If the business
	 * process cannot be completed within this interval, it has to complete its
	 * work asynchronously and satisfy 1 second latency. In the later case the
	 * client will periodically call checkStatus or checkStatusById operation to
	 * get the results of this operation.
	 * 
	 * @param id
	 *            MasterAccountApplication Id to update
	 * @param order
	 *            Merchant Application data
	 * @param clientIPAddr
	 *            Client IP address
	 * @param requestId
	 *            client specified transaction (request) id for this update
	 *            operation
	 * @return default view of MasterAccountApplication
	 * @throws WebApplicationException
	 *             Response.Status.NOT_FOUND account not found for the given
	 *             input arguments Response.Status.UNAUTHORIZED invalid
	 *             credentials in the request
	 */
	@PUT
	@Path("{id}")
	Response updateOrder(@PathParam("id") String id,
			JAXBElement<MerchantOrder> order,
			@HeaderParam("intuit_originatingip") String clientIPAddr,
			@HeaderParam("intuit_tid") UUID requestId) throws Exception;

	/**
	 * Submits a MasterAccountApplication for processing Uses REST convention to
	 * determine the actual operation: <li>if the application does <b>not</b>
	 * have MasterAccount Id it is referring to <b>new</b> account</li> <li>if
	 * the application does have MasterAccount Id it is referring to
	 * <b>existing</b> account</li>
	 * 
	 * This operation <b>must</b> respond in less than a second. If the business
	 * process cannot be completed within this interval, it has to complete its
	 * work asynchronously and satisfy 1 second latency. In the later case the
	 * client will periodically call checkStatus or checkStatusById operation to
	 * get the results of this operation.
	 * 
	 * @param order
	 *            Merchant Application data
	 * @param clientIPAddr
	 *            Client IP address
	 * @param requestId
	 *            client generated transaction (request) id for this
	 *            update/create operation
	 * @return default view of MasterAccountApplication
	 * @throws WebApplicationException
	 *             Response.Status.NOT_FOUND account not found for the given
	 *             input arguments Response.Status.UNAUTHORIZED invalid
	 *             credentials in the request
	 */
	@POST
	@Path("/orders")
	RestResponse createOrUpdateOrder(JAXBElement<MerchantOrder> order,
			@HeaderParam(AUTHORIZATION_PARAM) String authHeader,
			@HeaderParam("intuit_originatingip") String clientIPAddr,
			@HeaderParam("intuit_tid") UUID requestId);
	
	@GET
	@Path("/accounts")
	@Produces(MediaType.APPLICATION_XML)
	@Consumes(MediaType.APPLICATION_XML)
	public RestResponse getAccountByUserId(
			@HeaderParam(AUTHORIZATION_PARAM) String authHeader,
			@HeaderParam("intuit_tid") UUID requestId);
}
