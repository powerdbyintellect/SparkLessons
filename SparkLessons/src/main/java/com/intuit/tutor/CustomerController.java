package com.intuit.tutor;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXBElement;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
public class CustomerController extends BaseCustomerController {
	
	private static final Logger logger = LoggerFactory.getLogger(CustomerController.class);;
	
	@Autowired
	private IamRESTInterface iamRESTClient;
	
	@Autowired
	private UserEntityDAO userEntityDAO;

	private static final UUID TEST_REQUEST_ID = UUID.randomUUID();
	private static final String TEST_IP_ADDRESS = "199.16.140.27";
	
	@Autowired
	private OnboardingServiceClient onboardingServiceClient;
	
	private ObjectFactory objectFactory = new ObjectFactory();
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String printWelcome(ModelMap model) {
		System.out.println("Inside Customer controller"); 
		model.addAttribute("message", "Welcome to Spark Lessons");
		return "index";
	}

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String initializePage(ModelMap model, HttpServletRequest request) {
		
		Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
		String returnPage = null;
		ModelAndView mav = new ModelAndView("customer");
		
		String lessonType = (String) request.getParameter("type");
		lessonType = (lessonType == null) ? "piano" : lessonType;
		System.out.println("Inside Initialize in CustomerController "+lessonType);
		logger.debug("d Inside Initialize in CustomerController");
		logger.info("i Inside Initialize in CustomerController");
		
		if(facebook != null) {
			UserEntity user = null;
			IAMTicket ticket = null; 
			MerchantApplicationResponse applicationResult = null;
			try {
				user = userEntityDAO.getUserByLoginId(facebook.getMe().getId());
				
				JAXBElement<IAMTicket> existingUserTicket = iamRESTClient.signin( UUID.randomUUID().toString().replace("-", ""),  "{\"username\":\"" + facebook.getMe().getEmail() + "\",\"password\":\"" +  "testiususer" + "\"}");
				if(existingUserTicket!=null) {
					ticket = existingUserTicket.getValue();
					Token token = new Token();
					token.setAuthId(ticket.getUserId());
					token.setTokenId(ticket.getTicket());
					applicationResult = onboardingServiceClient.getMerchantInformationByAuthId(token, UUID.randomUUID()) ;
					
//					logger.info(" Master Account "+applicationResult.getMasterAccountId());
//					logger.info(" RealmId "+applicationResult.getRealmId());
//					logger.info(" MID "+ applicationResult.getMID());
//					
					System.out.println(" Master Account "+applicationResult.getMasterAccountId());
					System.out.println(" RealmId "+applicationResult.getRealmId());
					System.out.println(" MID "+ applicationResult.getMID());
					

					if(applicationResult.getMasterAccountId() !=null && applicationResult.getMID()!=null){
						CreditCard cc = new CreditCard();
						cc.setRealmId(applicationResult.getRealmId());
						//cc.setCreditCardNumber("5174554122715233");
						model.put("realmId", applicationResult.getRealmId());
						mav.addObject("realmId", applicationResult.getRealmId());
						model.put("type", lessonType);
						mav.addObject("type", lessonType);
						returnPage = "makepayment";
					}	//end result
				}	//End If 
			}catch (Exception e) {
				System.out.println("Exception !! "+e.getMessage());
			}
		}
		
	
		Customer customer = new Customer();
		Address address = new Address();
		mav.addObject("customer", customer);
		mav.addObject("address", address);
		mav.addObject("type",lessonType);
		if(null == returnPage)
			returnPage = "order";
		
		return returnPage;
	}
	
	@RequestMapping(value = "/portfolio", method = RequestMethod.GET)
	public String getPortfolio(ModelMap model, HttpServletRequest request) {
		try {
			Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
			UserEntity user = userEntityDAO.getUser(facebook.getMe().getEmail());
			model.put("realmId", user.getRealmid());
		} catch (Exception e) {
			return "portfolio"; 
		}
		return "portfolio";
			
	}

    @RequestMapping(value = "/error", method = RequestMethod.GET)
    public String getErrorPage(ModelMap model, HttpServletRequest request) {
        return "error";

    }
	
	//@RequestMapping(value = "/sign-in", method = RequestMethod.GET)
	public String getSignInPage(ModelMap model, HttpServletRequest request) {
		try {
			Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
			UserEntity user = userEntityDAO.getUser(facebook.getMe().getEmail());
			model.put("realmId", user.getRealmid());
		} catch (Exception e) {
			return "sign-in"; 
		}
		return "sign-in";
			
	}
	
	//@RequestMapping(value = "/sign-in", method = RequestMethod.POST)
	public String postSignInPage(ModelMap model, HttpServletRequest request) {
		String returnPage = null;
		try {
			Facebook facebook = (Facebook) request.getSession().getAttribute("facebook");
			UserEntity user = new UserEntity();
			String email = (String) request.getParameter("email");
			String pwd = (String) request.getParameter("password");
			if(email!=null) {
				user =  userEntityDAO.getUser(email);
				if(user==null) {
					user = new UserEntity();
					user.setEmail(email);
					user.setRealmid("1234555");
				}
				returnPage = "create-profile";
			} else if(facebook!=null ){
				user = userEntityDAO.getUser(facebook.getMe().getEmail());
				returnPage = "create-profile";
			} else {
				returnPage = "error"; 
			}
			model.put("user", user);
			model.put("realmId", user.getRealmid());
		} catch (Exception e) {
			returnPage = "error"; 
		}
		return returnPage;
			
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
	
	

	//@RequestMapping(value = "/addCustomer", method = RequestMethod.POST)
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

		IAMTicket iamticket = createIAMUser(customer, address);
		String ticket = iamticket.getTicket();//iamToken.getTicket();
		String authId = iamticket.getUserId();//iamToken.getUserId();

		Token token = new Token();
		token.setAuthId(authId);
		token.setTokenId(ticket);
		
		MerchantApplicationResponse applicationResult = null;
		
		//Call to get list of master accounts based on IUS id token
		applicationResult = onboardingServiceClient.getMerchantInformationByAuthId(token, UUID.randomUUID()) ;
		
		if( null == applicationResult || (applicationResult.getMasterAccountId() == null && applicationResult.getRealmId() == null && applicationResult.getMID() == null)) {
			MerchantApplicationRequest merchantApplicationRequest = MerchantApplicationRequest.createFromMerchantApplication(customer, address, bankAccount);
			applicationResult = onboardingServiceClient.submitMerchantApplication(merchantApplicationRequest, 
					token, TEST_IP_ADDRESS, TEST_REQUEST_ID, customer.getEmail());
		}
		
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
		userEntity.setRealmid(applicationResult.getRealmId());
		userEntity.setUserid(authId);
		userEntity.setMasteraccount(applicationResult.getMasterAccountId());
		if(facebook != null) {
			userEntity.setLoginid(facebook.getMe().getId());
		}
		
		userEntityDAO.saveUser(userEntity);


		if(applicationResult.getMasterAccountId() !=null && applicationResult.getMID() !=null){
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
		JAXBElement<IAMTicket> existingUserTicket = null;
		IAMTicket ticket = null; 
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
		try {
			existingUserTicket = iamRESTClient.signin(guuid,  "{\"username\":\"" + customer.getEmail() + "\",\"password\":\"" +  "testiususer" + "\"}");
		} catch (Exception e) {
			existingUserTicket = null;
			System.out.println("Not able to logon "+e.getMessage());
		}
		if(null == existingUserTicket) {
			JAXBElement<User> createdUserElement = iamRESTClient.signup(guuid, objectFactory.createUser(user));
			User newuser = createdUserElement.getValue();
			newuser.setPassword(user.getPassword());
			// validate user is created
			String body = "{\"userId\":\"" + newuser.getUserId() + "\",\"password\":\"" +  newuser.getPassword() + "\"}";
			System.out.println("body: " + body);
			JAXBElement<IAMTicket> iamTicketElement = iamRESTClient.signin(guuid, body);
			ticket = iamTicketElement.getValue();
			
		} else {
			ticket = existingUserTicket.getValue();
		}
		
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

	@Transactional
	@RequestMapping(value = "/submit-payment-information", method = RequestMethod.GET)
	public String returnPaymentPage(ModelMap model, HttpServletRequest request) throws Exception {
		MerchantApplicationResponse applicationResult = null;
		UserEntity user = getUserAndCreate(request);
		IAMTicket existingUserTicket = getTicket(request);
		String returnPage = null;
		
		ModelAndView mav = new ModelAndView("customer");
		if(existingUserTicket !=null) {
			Token token = new Token();
			token.setAuthId(existingUserTicket.getUserId());
			token.setTokenId(existingUserTicket.getTicket());
			 applicationResult = onboardingServiceClient.getMerchantInformationByAuthId(token, UUID.randomUUID()) ;
			 if(user!=null) {
				 user.setPaymentaccountpresent(new Boolean(false));
				 user.setMasteraccount(applicationResult.getMasterAccountId());
				 userEntityDAO.saveUser(user);
			 }
			 if(applicationResult.getMasterAccountId() !=null && applicationResult.getMID() != null)	{
					CreditCard cc = new CreditCard();
					cc.setRealmId(applicationResult.getRealmId());
					//cc.setCreditCardNumber("5174554122715233");
					model.put("realmId", applicationResult.getRealmId());
					mav.addObject("realmId", applicationResult.getRealmId());
					model.put("type", user.getLessonname());
					mav.addObject("type", user.getLessonname());
					returnPage = "makepayment";
					
				}	//end result
			 else {	//Create new Payment Account in OBS
				 returnPage = "submit-payment-information";
			 }
			 
		}
		model.addAttribute("user", user);
		return returnPage;
	}
	
	@Transactional
	@RequestMapping(value = "/submit-payment-information", method = RequestMethod.POST)
	public String createNewPaymentAccount(ModelMap model, Customer customer, Address address, HttpServletRequest request) throws Exception {
		MerchantApplicationResponse applicationResult = null;
		
		BankAccount bankAccount = new BankAccount();
		UserEntity user = getUserAndCreate(request);
		user.setPaymentaccountpresent(new Boolean(false));
		IAMTicket iamticket =  getTicket(request);
		String ticket = iamticket.getTicket();//iamToken.getTicket();
		String authId = iamticket.getUserId();//iamToken.getUserId();

		customer.setPhone("8188188818");
		customer.setEmail(user.getEmail());
		customer.setFirstname(user.getFirstname());
		customer.setLastname(user.getLastname());
		customer.setDbaName(user.getFirstname()+" "+user.getLastname());
		bankAccount.setAccountNumber(customer.getDda());
		bankAccount.setRoutingNumber(customer.getRouting());
		bankAccount.setBankName("Unknown");
		
		Token token = new Token();
		token.setAuthId(authId);
		token.setTokenId(ticket);
		
		
		//Call to get list of master accounts based on IUS id token
		applicationResult = onboardingServiceClient.getMerchantInformationByAuthId(token, UUID.randomUUID()) ;
		
		if( null == applicationResult || (applicationResult.getMasterAccountId() == null && applicationResult.getRealmId() == null && applicationResult.getMID() == null)) {
			MerchantApplicationRequest merchantApplicationRequest = MerchantApplicationRequest.createFromMerchantApplication(customer, address, bankAccount);
			applicationResult = onboardingServiceClient.submitMerchantApplication(merchantApplicationRequest, 
					token, TEST_IP_ADDRESS, TEST_REQUEST_ID, customer.getEmail());
			
			if(null!=applicationResult && applicationResult.getMasterAccountId() !=null && applicationResult.getMID() !=null){
				user.setPaymentaccountpresent(new Boolean(true));
				user.setMasteraccount(applicationResult.getMasterAccountId());
				userEntityDAO.saveUser(user);
				
			} else {
				user.setPaymentaccountpresent(new Boolean(false));
				userEntityDAO.saveUser(user);
			}
			
		} else {
			user.setPaymentaccountpresent(new Boolean(true));
			userEntityDAO.saveUser(user);
		}
		model.addAttribute("user", user);
		return "project-page";
	}
	
	

}
