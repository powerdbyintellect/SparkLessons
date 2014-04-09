package com.intuit.tutor;

import java.io.InputStream;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.xml.bind.JAXBElement;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.intuit.tutor.entity.Address;
import com.intuit.tutor.entity.Customer;
import com.intuit.tutor.obs.OnboardingServiceClient;
import com.intuit.platform.integration.consumer.GSONMarshaller;
import com.intuit.platform.integration.consumer.JAXBXMLMarshaller;
import com.intuit.platform.integration.consumer.JSONMarshaller;
import com.intuit.platform.integration.httpclient.ApacheHttpClient;
import com.intuit.platform.integration.httpclient.OIIRequestHeaderHandler;
import com.intuit.platform.integration.iface.IHttpClient;
import com.intuit.platform.integration.iface.IMarshaller;
import com.intuit.platform.integration.iface.ISecurity;
import com.intuit.platform.integration.iface.IntuitHeader;
import com.intuit.platform.integration.iface.ISecurity.APIAuthMethod;
import com.intuit.platform.integration.ius.common.types.ChallengeQuestionAnswer;
import com.intuit.platform.integration.ius.common.types.Email;
import com.intuit.platform.integration.ius.common.types.FullName;
import com.intuit.platform.integration.ius.common.types.IAMTicket;
import com.intuit.platform.integration.ius.common.types.User;
import com.intuit.platform.integration.rest.client.IUSRestClient;
import com.intuit.psd.cdm.v1.*;

@Controller
public class CustomerController {
	private static final String XML_FILE_PATH = "/";
	private String authHeader;
	private String offeringId = "Intuit.payments.pcsactivation.sparklessons";

	// @Autowired
	// private OnboardingServiceClient onboardingServiceClient;

	public void setAuthHeader(String authHeader) {
		this.authHeader = authHeader;
	}
	
	@SuppressWarnings("serial")
	protected static final Map<IntuitHeader, String> headers = new HashMap<IntuitHeader, String>() {{
	    put(IntuitHeader.APPID, "Intuit.cto.iam.ius.tests");
	    put(IntuitHeader.APPSECRET, "F3MVISrnOmHsz7Y1Fzwvb7");
	    put(IntuitHeader.OFFERINGID, "Intuit.cto.iam.ius.tests");
	    put(IntuitHeader.ORIGINATINGIP, "172.18.33.10");   // 123.45.67.89
	}};

	protected static final String baseUrl = "https://accounts-e2e.platform.intuit.com/";
	//protected static final String baseUrl = "http://localhost:8080/ius/";

//	private static final IMarshaller marshaller = new GSONMarshaller();
	private static final IMarshaller marshaller = new JSONMarshaller();
//	private static final IMarshaller marshaller = new JAXBXMLMarshaller();
	
	private static final ISecurity security = new OIIRequestHeaderHandler(headers, null, APIAuthMethod.IAMTicket, true, "iusc");
	private static final IHttpClient httpClient = new ApacheHttpClient(null, 0);
	private static final IUSRestClient iusClient = new IUSRestClient(baseUrl, marshaller, httpClient, security);
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		System.out.println("Inside Customer controller"); // dbaName, Address
															// (street, city,
															// state, zipcode,
															// phonenumber),
															// businessdescription
		model.addAttribute("message", "Welcome to Spark Lessons");
		return "index";
	}

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String initializePage(ModelMap model) {
		System.out.println("Inside Customer Controller");
		Customer customer = new Customer();
		Address address = new Address();
		ModelAndView mav = new ModelAndView("customer");
		mav.addObject("customer", customer);
		mav.addObject("address", address);
		return "order";
	}

	@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
	public String addCustomer(ModelMap model, Customer customer, Address address)
			throws Exception {
		System.out.println("F: " + customer.getFirstname() + "\nL: "
				+ customer.getLastname() + "\nAddr: "
				+ address.getStreetAddress1() + " " + address.getCity() + " "
				+ address.getState() + " " + address.getZipCode());

		
		// RequestSenderCXF client = new RequestSenderCXF();
		// String sampleMerchantOrderMaterialsFromXml =
		// createSampleMerchantOrderMaterialsFromXml("");
		// HashMap<String, String> headers = new HashMap<String, String>();
		// headers.put("intuit_tid", "" + UUID.randomUUID());
		// headers.put("intuit_originatingip", "10.10.21.121");
		// headers.put("activation_partner_code", "Foo");
		// headers.put("activation_source", "Foo");
		// headers.put("activation_transaction_id", "" +
		// System.currentTimeMillis());
		// headers.put("activation_subscriber_id", "Foo");
		// headers.put("activation_originating_ip", "Foo");
		// headers.put("fail_on_processor", "CrmStateChangeProcessor");
		//
		// //String newMomString =
		// sampleMerchantOrderMaterialsFromXml.replaceFirst("(?i)\\<ApplicationChannel\\>.*\\</ApplicationChannel\\>",
		// "<ApplicationChannel>QBDT_IPD</ApplicationChannel>");
		// String newMomString =
		// sampleMerchantOrderMaterialsFromXml.replaceFirst("(?i)\\<Id\\>.*\\</Id\\>",
		// "<Id>" + System.currentTimeMillis() + "</Id>");
		// newMomString =
		// newMomString.replaceFirst("(?i)\\<MasterAccountId\\>.*\\</MasterAccountId\\>",
		// "<MasterAccountId>" + generateRandomMasterAccountId() +
		// "</MasterAccountId>");
		// // System.out.println("request = " + newMomString);
		//
		// //qa1
		// String response = (String)
		// client.send("https://onboarding-qa.payments.intuit.net/v1/orders",
		// newMomString, String.class, headers);

		
		
		createIAMUser(customer, address);

		// Send create account request

		// String str = iam.signup(id, "127.0.0.1", getAuthHeader(),
		// getOfferingId());
		// System.out.println(str);

		return "order";
	}

	private User createIAMUser(Customer customer, Address customerAddress)
			throws Exception {
		User user = new User();
		String guuid = UUID.randomUUID().toString().replace("-", "");
		user.setUsername("iustestuser" + guuid);
		user.setPassword("testiususer");
		user.setSecurityLevel("HIGH");
		ChallengeQuestionAnswer qa = new ChallengeQuestionAnswer();
		qa.setQuestion("Who is your all-time favorite movie character?");
		qa.setAnswer("Elmo");
		user.getChallengeQuestionAnswer().add(qa);
		Email email = new Email();
		email.setAddress("tester" + guuid + "@test.intuit.com");
		email.setPrimary(Boolean.TRUE);
		user.setEmail(email);
		com.intuit.platform.integration.ius.common.types.Address address = new com.intuit.platform.integration.ius.common.types.Address();
		address.setType("MAIN");
		address.setAddress1("12345 Wonder Lane");
		address.setCityOrLocality("Hollywood");
		address.setPostalCode("90210");
		address.setStateOrProvince("CA");
		address.setCountry("US");
		user.getAddress().add(address);
		FullName fullName = new FullName();
		fullName.setGivenName("O'neil");
		fullName.setMiddleName("O'reilly");
		fullName.setSalutation("Jr'");
		fullName.setSuffix("O'");
		fullName.setSurName("O'neil");
		user.getFullName().add(fullName);
		iusClient.signup(user);

		// validate user is created
		IAMTicket ticket = iusClient.signin(user.getUsername(),
				user.getPassword());
		System.out.println("UserId :" + ticket.getUserId());
		System.out.println("Ticket :" + ticket.getTicket());

		User retUser = iusClient.getUserByUserId(ticket.getTicket(),
				ticket.getUserId());
		System.out.println("  Email :" + retUser.getEmail().getAddress());

		return retUser;
	}

	private String createSampleMerchantOrderMaterialsFromXml(String fileName) {

		try {
			InputStream fileStream = CustomerController.class
					.getResourceAsStream(XML_FILE_PATH + fileName);
			StringWriter writer = new StringWriter();
			IOUtils.copy(fileStream, writer);
			String merchOrderMaterials = writer.toString();
			merchOrderMaterials = merchOrderMaterials.replaceFirst(
					"TESTAPS-000002", "" + new Random().nextInt());
			return merchOrderMaterials;
		} catch (Exception e) {
		}

		return null;
	}

	@RequestMapping(value = "/updateCustomer", method = RequestMethod.POST)
	public String updateCustomer(ModelMap model, Customer customer)
			throws Exception {
		return "index";
	}

	@RequestMapping(value = "/getCustomer", method = RequestMethod.POST)
	public String getCustomer(ModelMap model, Customer customer)
			throws Exception {
		return "index";
	}

	@RequestMapping(value = "/deleteCustomer", method = RequestMethod.POST)
	public String deleteCustomer(ModelMap model, Customer customer)
			throws Exception {
		return "index";
	}

	public String getOfferingId() {
		return offeringId;
	}

	public void setOfferingId(String offeringId) {
		this.offeringId = offeringId;
	}

	public String getAuthHeader() {
		return authHeader;
	}

	public IUSRestClient getIusClient() {
		return iusClient;
	}

}
