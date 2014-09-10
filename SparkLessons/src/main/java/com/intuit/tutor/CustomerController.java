package com.intuit.tutor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXBElement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.intuit.platform.integration.consumer.JSONMarshaller;
import com.intuit.platform.integration.iface.IMarshaller;
import com.intuit.platform.integration.iface.IntuitHeader;
import com.intuit.platform.integration.ius.common.types.ChallengeQuestionAnswer;
import com.intuit.platform.integration.ius.common.types.Email;
import com.intuit.platform.integration.ius.common.types.FullName;
import com.intuit.platform.integration.ius.common.types.IAMTicket;
import com.intuit.platform.integration.ius.common.types.ObjectFactory;
import com.intuit.platform.integration.ius.common.types.User;
import com.intuit.tutor.entity.Address;
import com.intuit.tutor.entity.BankAccount;
import com.intuit.tutor.entity.CreditCard;
import com.intuit.tutor.entity.Customer;
import com.intuit.tutor.entity.UserEntity;
import com.intuit.tutor.entity.dao.UserEntityDAO;
import com.intuit.tutor.obs.MerchantApplicationRequest;
import com.intuit.tutor.obs.MerchantApplicationResponse;
import com.intuit.tutor.obs.OnboardingServiceClient;
import com.intuit.tutor.security.Token;

import facebook4j.Facebook;

@Controller
public class CustomerController {
	
	@Autowired
	private IamRESTInterface iamRESTClient;
	
	@Autowired
	private UserEntityDAO userEntityDAO;

	private static final String XML_FILE_PATH = "/";
	private String authHeader;
	private String offeringId = "Intuit.payments.pcsactivation.sparklessons";
	private static final UUID TEST_REQUEST_ID = UUID.randomUUID();
	private static final String TEST_IP_ADDRESS = "199.16.140.27";
	private static final String TEST_PASSWORD = "123test";
	private static final String TEST_GLOBAL_NAMESPACE = "50000003";
	
	@Autowired
	private OnboardingServiceClient onboardingServiceClient;

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
//	private static final IMarshaller marshaller = new GSONMarshaller();
//	private static final IMarshaller marshaller = new JAXBXMLMarshaller();
	private static final IMarshaller marshaller = new JSONMarshaller();
	
	private ObjectFactory objectFactory = new ObjectFactory();
	
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
	public String initializePage(ModelMap model, HttpServletRequest request) {
		
		Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
		
		if(facebook != null) {
			UserEntity user = null;
			try {
				user = userEntityDAO.getUserByLoginId(facebook.getMe().getId());
			} catch (Exception e) {
				
			}
			if(user != null) {
				model.put("realmId", user.getRealmid());
				return "makepayment";
			}	
		}
		String lessonType = (String) request.getAttribute("type");
		lessonType = (lessonType == null) ? "piano" : lessonType;
		System.out.println("Inside Customer Controller");
		Customer customer = new Customer();
		Address address = new Address();
		ModelAndView mav = new ModelAndView("customer");
		mav.addObject("customer", customer);
		mav.addObject("address", address);
		mav.addObject("type",lessonType);
		return "order";
	}
	
	@RequestMapping(value = "/makepayment", method = RequestMethod.GET)
	public String makepaymentPage(ModelMap model, HttpServletRequest request) {
		try {
			Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
			UserEntity user = userEntityDAO.getUser(facebook.getMe().getEmail());
			model.put("realmId", user.getRealmid());
		} catch (Exception e) {
			return "makepayment"; 
		}
		return "makepayment";
			
	}

	@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
	public String addCustomer(ModelMap model, Customer customer, Address address, HttpServletRequest request)
			throws Exception {
		System.out.println("F: " + customer.getFirstname() + "\nL: "
				+ customer.getLastname() + "\nAddr: "
				+ address.getStreetAddress1() + " " + address.getCity() + " "
				+ address.getState() + " " + address.getZipCode());

		Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
		
		customer.setPhone("8188188818");
		customer.setPassword("testiususer");
		BankAccount bankAccount = new BankAccount();
		bankAccount.setAccountNumber("9876543210");
		bankAccount.setRoutingNumber("122000661");
		bankAccount.setBankName("Bank of America");
		
		if(customer.getEmail() == null) {
			String guuid = UUID.randomUUID().toString().replace("-", "");
			//customer.setEmail("tester60af3c9852b94db6a6cc1e4b7f73e3e1@test.intuit.com");
			customer.setEmail("tester" + guuid + "@test.intuit.com");
		}

		
		IAMTicket iamticket = createIAMUser(customer, address);

		// Send create account request
		// String str = iam.signup(id, "127.0.0.1", getAuthHeader(),
		// getOfferingId());
		// System.out.println(str);
//		IAMToken iamToken = new IAMToken();
		String ticket = iamticket.getTicket();//iamToken.getTicket();
		String authId = iamticket.getUserId();//iamToken.getUserId();

		Token token = new Token();
		token.setAuthId(authId);
		token.setTokenId(ticket);
		
		MerchantApplicationRequest merchantApplicationRequest = MerchantApplicationRequest.createFromMerchantApplication(customer, address, bankAccount);
		
		MerchantApplicationResponse applicationResult = onboardingServiceClient.submitMerchantApplication(merchantApplicationRequest, 
				token, TEST_IP_ADDRESS, TEST_REQUEST_ID, customer.getEmail());
		
		System.out.println(" Master Account "+applicationResult.getMasterAccountId());
		System.out.println(" RealmId "+applicationResult.getRealmId());
		System.out.println(" Email "+ customer.getEmail());
		System.out.println(" MID "+ applicationResult.getMID());
		
		
		UserEntity userEntity = new UserEntity();
		//userEntity.setAccountnumber();
		userEntity.setEmail(customer.getEmail());
		userEntity.setFirstname(customer.getFirstname());
		userEntity.setLastname(customer.getLastname());
		//userEntity.setLoginid();
		userEntity.setMasteraccount(applicationResult.getMasterAccountId());
		userEntity.setPassword(customer.getPassword());
		userEntity.setRealmid(applicationResult.getRealmId());
		userEntity.setUserid(authId);
		if(facebook != null) {
			userEntity.setLoginid(facebook.getMe().getId());
		}
		
		userEntityDAO.saveUser(userEntity);


		if(applicationResult.getMasterAccountId() !=null){
			CreditCard cc = new CreditCard();
			cc.setRealmId(applicationResult.getRealmId());
			//cc.setCreditCardNumber("5174554122715233");
			model.put("realmId", applicationResult.getRealmId());
			return "makepayment";
		}else{ 
			return "order";
		}
	}

	private IAMTicket createIAMUser(Customer customer, Address customerAddress)
			throws Exception {
		
		User user = new User();
		String guuid = UUID.randomUUID().toString().replace("-", "");
		user.setUsername(customer.getEmail());
		user.setPassword(customer.getPassword());
		user.setSecurityLevel("HIGH");
		ChallengeQuestionAnswer qa = new ChallengeQuestionAnswer();
		qa.setQuestion("Who is your all-time favorite movie character?");
		qa.setAnswer("Elmo");
		user.getChallengeQuestionAnswer().add(qa);
		Email email = new Email();
		email.setAddress(customer.getEmail());
		email.setPrimary(Boolean.TRUE);
		user.setEmail(email);
		com.intuit.platform.integration.ius.common.types.Address address = new com.intuit.platform.integration.ius.common.types.Address();
		address.setType("MAIN");
		address.setAddress1(customerAddress.getStreetAddress1());
		address.setCityOrLocality(customerAddress.getCity());
		address.setPostalCode(customerAddress.getZipCode());
		address.setStateOrProvince(customerAddress.getState());
		address.setCountry("US");
		user.getAddress().add(address);
		FullName fullName = new FullName();
		fullName.setGivenName(customer.getFirstname());
		//fullName.setMiddleName();
		//fullName.setSalutation("Jr'");
		//fullName.setSuffix("O'");
		fullName.setSurName(customer.getLastname());
		user.getFullName().add(fullName);
		
		JAXBElement<User> createdUserElement = iamRESTClient.signup(guuid, objectFactory.createUser(user));
		User newuser = createdUserElement.getValue();
		newuser.setPassword(user.getPassword());
		// validate user is created
		
		String body = "{\"userId\":\"" + newuser.getUserId() + "\",\"password\":\"" + user.getPassword() + "\"}";
		System.out.println("body: " + body);
		
		JAXBElement<IAMTicket> iamTicketElement = iamRESTClient.signin(guuid, body);
		IAMTicket ticket = iamTicketElement.getValue();
		System.out.println("UserId :" + ticket.getUserId());
		System.out.println("Ticket :" + ticket.getTicket());
		System.out.println("RealmId :" + ticket.getRealmId());

		return ticket;
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

}
