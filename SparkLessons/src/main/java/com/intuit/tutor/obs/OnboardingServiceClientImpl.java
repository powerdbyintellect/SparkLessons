package com.intuit.tutor.obs;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.ws.rs.BadRequestException;
import javax.ws.rs.core.Response.Status;
import javax.xml.bind.JAXBElement;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;

import com.intuit.psd.cdm.v1.AccountNumber;
import com.intuit.psd.cdm.v1.ApplicationChannelTypeEnum;
import com.intuit.psd.cdm.v1.ApplicationSourceEnum;
import com.intuit.psd.cdm.v1.ApplyOptionEnum;
import com.intuit.psd.cdm.v1.BusinessInfo;
import com.intuit.psd.cdm.v1.BusinessInfoContact;
import com.intuit.psd.cdm.v1.BusinessOwner;
import com.intuit.psd.cdm.v1.CdmComplexBase;
import com.intuit.psd.cdm.v1.CheckSubAccount;
import com.intuit.psd.cdm.v1.CheckSubscription;
import com.intuit.psd.cdm.v1.CreditCardApplyOption;
import com.intuit.psd.cdm.v1.CreditCardSubAccount;
import com.intuit.psd.cdm.v1.CreditCardSubscription;
import com.intuit.psd.cdm.v1.DecisionEnum;
import com.intuit.psd.cdm.v1.DepositAccount;
import com.intuit.psd.cdm.v1.EmailAddress;
import com.intuit.psd.cdm.v1.EmailTypeEnum;
import com.intuit.psd.cdm.v1.EntitlementEnum;
import com.intuit.psd.cdm.v1.ErrorDetail;
import com.intuit.psd.cdm.v1.ErrorResponse;
import com.intuit.psd.cdm.v1.MasterAccount;
import com.intuit.psd.cdm.v1.MasterAccountStatusEnum;
import com.intuit.psd.cdm.v1.MasterAccounts;
import com.intuit.psd.cdm.v1.MerchantOrder;
import com.intuit.psd.cdm.v1.ObjectFactory;
import com.intuit.psd.cdm.v1.OfferDetail;
import com.intuit.psd.cdm.v1.PartyTypeEnum;
import com.intuit.psd.cdm.v1.PhysicalAddress;
import com.intuit.psd.cdm.v1.ProductChannelTypeEnum;
import com.intuit.psd.cdm.v1.ProductIdentifierTypeEnum;
import com.intuit.psd.cdm.v1.RestResponse;
import com.intuit.psd.cdm.v1.ServiceTypeEnum;
import com.intuit.psd.cdm.v1.SrcDomainEnum;
import com.intuit.psd.cdm.v1.SubAccount;
import com.intuit.psd.cdm.v1.SubscriptionAccountStatusEnum;
import com.intuit.psd.cdm.v1.SubscriptionBase;
import com.intuit.psd.cdm.v1.SuccessResponse;
import com.intuit.psd.cdm.v1.SwiperApplyOption;
import com.intuit.psd.cdm.v1.TelephoneNumber;
import com.intuit.tutor.security.Token;

public class OnboardingServiceClientImpl implements OnboardingServiceClient {

	private final static String IAM_HEADER = "Intuit_IAM_Authentication ";
	private final static String IAM_INTUIT_APP_ID = "intuit_appid";
	private final static String IAM_INTUIT_APP_SECRET = "intuit_app_secret";
	private final static  String IAM_AUTH_ID_HEADER = "x_intuit_authid";
	private final static  String IAM_TICKET_ID_HEADER = "x_intuit_ticket";
	private final static String FIELD_DELIMITER = ",";
	private final static String KEY_VALUE_DELIMITER = "=";
	private static final ApplicationChannelTypeEnum DEFAULT_APPLICATION_CHANNEL_ENUM = ApplicationChannelTypeEnum.QBO_SPA;
	private static final ApplicationSourceEnum DEFAULT_APPLICATION_SOURCE_ENUM = ApplicationSourceEnum.UAE;
	private static final Logger logger = Logger.getLogger(OnboardingServiceClientImpl.class);
	private static final String DEFAULT_DESCRIPTION = "SparkRent landlord.";
	
	private static ApplicationChannelTypeEnum applicationChannelEnum = DEFAULT_APPLICATION_CHANNEL_ENUM;
	private static ApplicationSourceEnum applicationSourceEnum = DEFAULT_APPLICATION_SOURCE_ENUM;
	
	private OnboardingServiceRestClient onboardingServiceRestClient;
	
	@Value("${obs.secret}")
	private String sparkrentServiceGatewaySecret;
	@Value("${obs.appid}")
	private String sparkrentServiceGatewayAppId;

	private static String applicationChannel = "QBO_SPA";
	private static String applicationSource = "SRT";
	private static String countryCode ="USA";
	private static String description = DEFAULT_DESCRIPTION;
	private static String offerId = "qboh_mm_n-3111-20287";
	private static String brandId = "qbo_spa";
	private static String sicCode = "6513";
	private static OfferDetail offerDetails;
	
	//test method. To be removed before we go to prod. 
	/*@Override
	public MerchantOrder submitMerchantApplication(MerchantOrder merchantOrder, 
			String clientIPAddr, UUID requestId, String iamTicketId, String iamAuthId) throws OnBoardingException {

		String authHeader = createAuthHeader(iamTicketId, iamAuthId);
		ClientResponse<RestResponse> response = onboardingServiceRestClient.createOrUpdateOrder(merchantOrder, authHeader, clientIPAddr, requestId);
		try {
			int status = response.getStatus();

			if (200 == status) {
				return response.getEntity(MerchantOrder.class);
			} else {
				handleRestError(response);
			}
		} finally {
			response.releaseConnection();
		}
		return null;
	}*/
	
	private String createAuthHeader(String iamTicketId, String iamAuthId) {
		StringBuilder sb = new StringBuilder();
		sb.append(IAM_HEADER).append(IAM_INTUIT_APP_ID)
		.append(KEY_VALUE_DELIMITER).append(sparkrentServiceGatewayAppId)
		.append(FIELD_DELIMITER).append(IAM_INTUIT_APP_SECRET)
		.append(KEY_VALUE_DELIMITER).append(sparkrentServiceGatewaySecret)
		.append(FIELD_DELIMITER).append(IAM_AUTH_ID_HEADER)
		.append(KEY_VALUE_DELIMITER).append(iamAuthId)
		.append(FIELD_DELIMITER).append(IAM_TICKET_ID_HEADER)
		.append(KEY_VALUE_DELIMITER).append(iamTicketId);
		
		return sb.toString();
	}

	private void handleRestError(RestResponse response) throws OnBoardingException{
		try{
			if(response == null)
				throw new OnBoardingException(OnBoardingException.UNEXPECTED_STATUS_CODE);
			
			if ( response.getSystemResponse().getValue() instanceof com.intuit.psd.cdm.v1.ErrorResponse) {
				logger.warn("Error calling the onboarding service.");
				// lets check if there is invalid postal code.
				ErrorResponse responseData = null;
				if(response != null) 
					responseData = (ErrorResponse) response.getSystemResponse().getValue();
				if (responseData != null && responseData.getProblem() != null && responseData.getProblem().size() > 0) {
					if (logger.isDebugEnabled()) {
						for (ErrorDetail anError : responseData.getProblem())
							logger.debug("Error : " + anError.getMessage());
					}
					ErrorDetail error = responseData.getProblem().get(0);
					throw new OnBoardingException("" + error.getCode() + ": " + error.getDesc());
				} else {
					throw new OnBoardingException(OnBoardingException.UNEXPECTED_STATUS_CODE);
				}
			}
		}
		finally{
		}
	}


	public OnboardingServiceRestClient getOnboardingServiceRestClient() {
		return onboardingServiceRestClient;
	}

	public void setOnboardingServiceRestClient(
			OnboardingServiceRestClient onboardingServiceRestClient) {
		this.onboardingServiceRestClient = onboardingServiceRestClient;
	}

	@Override
	public MerchantApplicationResponse submitMerchantApplication(
			MerchantApplicationRequest merchantApplication, Token token, String clientIPAddress, 
			UUID requestId, String userEmail)
			throws OnBoardingException {
		String authHeader = createAuthHeader(token.getTokenId(), token.getAuthId());
		MerchantOrder merchantOrder = createMerchantOrder(merchantApplication, userEmail);
		ObjectFactory objectFactory = new ObjectFactory();
		RestResponse response = onboardingServiceRestClient.createOrUpdateOrder(objectFactory.createMerchantOrder(merchantOrder), authHeader, clientIPAddress, requestId);
		
		
		try {
			handleRestError(response);
			if (response != null) {
				MerchantOrder order =  (MerchantOrder) ((SuccessResponse) response.getSystemResponse()
						.getValue()).getCDMObject().getValue();
				return createMerchantApplicationResponse(order);
			}
		 } catch(BadRequestException ex) {
			 ErrorResponse responseData = null;
			  if(response!=null && response.getSystemResponse().getValue() instanceof com.intuit.psd.cdm.v1.ErrorResponse)
				  responseData = (ErrorResponse) response.getSystemResponse().getValue();
			  ex.printStackTrace();
		 } catch (Exception e) {
			 logger.error("Error in OBS call : "+e.getMessage());
		 } finally {
		 
		 }

		return null;
	}

	private MerchantApplicationResponse createMerchantApplicationResponse(MerchantOrder order) throws OnBoardingException {
		if (order == null)
			throw new OnBoardingException("Received merchant order " + order);
		MerchantApplicationResponse response = new MerchantApplicationResponse();
		response.setMasterAccountId(order.getMasterAccountId());
		response.setRealmId(order.getRealmId());
		DecisionEnum status = order.getStatus();
		if ((status == DecisionEnum.APPROVED) || (status == DecisionEnum.COMPLETE)
				|| (status == DecisionEnum.IN_REVIEW) || (status == DecisionEnum.DECLINED)) {
			response.setOnboardingStatus(OnboardingStatus.valueOf(order.getStatus().name()));
		} else {
			response.setOnboardingStatus(OnboardingStatus.UNKNOWN);
		}
		return response;
	}

	private MerchantOrder createMerchantOrder(
			MerchantApplicationRequest merchantApplication, String userEmail) {
		/*
		 * Create a merchant Order now.
		 */
		MerchantOrder order = new MerchantOrder();
		order.setAcceptedTermsAndConditions(true);
		order.setApplicationChannel(applicationChannelEnum);
		order.setApplicationSource(applicationSourceEnum);
		order.setOfferDetail(offerDetails);
		order.setBusinessInfo(createNewBusinessInfo(merchantApplication, userEmail));
		order.setDepositAccount(createDepositAccount(merchantApplication));
		order.getSubAccountItem().add(getCheckSubAccountItem());
		order.getSubAccountItem().add(getCreditCardSubAccountItem());
		order.setOfferDetail(createOfferDetails());
		return order;
	}
	
	private static OfferDetail createOfferDetails() {
		OfferDetail offerDetail = new OfferDetail();
		offerDetail.setOfferId(offerId);
		offerDetail.setBrandId(brandId);
		offerDetail.setPSDChannel(ProductChannelTypeEnum.WEB);
		offerDetail.setPSDProduct(ProductIdentifierTypeEnum.SPARK_RENT);
		return offerDetail;
	}

	private BusinessInfoContact createNewBusinessInfo(MerchantApplicationRequest application, String userEmail) {
		BusinessInfoContact businessInfo = new BusinessInfoContact();
		businessInfo.setBusinessType(PartyTypeEnum.BUSINESS);
		businessInfo.setLegalName(application.getFirstName() + " " + application.getLastName());
		businessInfo.setBusinessAddress(createPhysicalAddress(application));
		businessInfo.setBusinessPhone(createTelephoneNumber(application.getPhone()));
		//TODO: Industry code needs to be modified. We will also inject it externally once its data type is finalized
		//businessInfo.setIndustryCode(BigInteger.valueOf(7229));
		businessInfo.setSIC(sicCode);
		businessInfo.setBusinessOwner(createBusinessOwner(application));
		businessInfo.setBusinessEmail(createEmailAddress(userEmail));
		businessInfo.setDescription(description);
		businessInfo.setOwnershipType("Sole Proprietorship");
		businessInfo.setDBA(application.getDbaName());
		return businessInfo;
	}
	
	private PhysicalAddress createPhysicalAddress(MerchantApplicationRequest application) {
		PhysicalAddress physicalAddress = new PhysicalAddress();
		physicalAddress.setLine1(application.getStreet());
		physicalAddress.setCity(application.getCity());
		physicalAddress.setCountrySubDivisionCode(application.getState());
		physicalAddress.setCountry(countryCode);
		physicalAddress.setPostalCode(application.getZip());
		return physicalAddress;
	}
	
	private DepositAccount createDepositAccount(MerchantApplicationRequest bankAccount) {
		DepositAccount depositAccount = new DepositAccount();
		depositAccount.setRoutingNumber(bankAccount.getRoutingNumber());
		depositAccount.setAccountNumber(bankAccount.getAccountNumber());
		depositAccount.setBankName(bankAccount.getBankName());
		return depositAccount;
	}


	private EmailAddress createEmailAddress(String userEmail) {
		EmailAddress email = new EmailAddress();
		email.setAddress(userEmail);
		email.setType(EmailTypeEnum.BUSINESS);
		return email;
	}

	private List<BusinessOwner> createBusinessOwner(MerchantApplicationRequest application) {
		List<BusinessOwner> businessOwners = new ArrayList<BusinessOwner>(1);
		BusinessOwner owner = new BusinessOwner();
		owner.setFirstName(application.getFirstName());
		owner.setLastName(application.getLastName());
		// TODO: make sure the date of birth is YYYY/mm/dd formatted.
		owner.setDOB(new Date(application.getBirthDate()));
		owner.setOwnerPhone(createTelephoneNumber(application.getPhone()));
		owner.setSSN(application.getSsn());
		owner.setOwnerAddress(createPhysicalAddress(application));
		businessOwners.add(owner);
		return businessOwners;
	}

	private TelephoneNumber createTelephoneNumber(String phoneNumber) {
		TelephoneNumber telephoneNumber = new TelephoneNumber();
		telephoneNumber.setFreeFormNumber(phoneNumber);
		return telephoneNumber;
	}
	
	private JAXBElement<? extends SubscriptionBase> getCreditCardSubAccountItem() {
		com.intuit.psd.cdm.v1.ObjectFactory factory  = new com.intuit.psd.cdm.v1.ObjectFactory();
		CreditCardSubscription creditCardSubscription = new CreditCardSubscription();
		List<EntitlementEnum> processingOptions = new ArrayList<EntitlementEnum>();
		processingOptions.add(EntitlementEnum.NON_QUICKBOOKS);
		//processingOptions.add(EntitlementEnum.CHECK);
		creditCardSubscription.setProcessingOption(processingOptions);
		creditCardSubscription.getOption().add(createSwiperOption(factory));
		creditCardSubscription.getOption().add(createAMEXOption(factory));

		return factory.createCreditCardSubscription(creditCardSubscription);
	}

	private JAXBElement<?> createSwiperOption(ObjectFactory factory) {
		SwiperApplyOption swiperOption = factory.createSwiperApplyOption();
		swiperOption.setOrder(ApplyOptionEnum.DONT_APPLY);
		return factory.createSwiper(swiperOption);
	}

	private JAXBElement<?> createAMEXOption(com.intuit.psd.cdm.v1.ObjectFactory factory) {
		CreditCardApplyOption creditCardOption = factory.createCreditCardApplyOption();
		creditCardOption.setOrder(ApplyOptionEnum.DONT_APPLY);
		return factory.createAMEX(creditCardOption);
	}

	private JAXBElement<? extends SubscriptionBase> getCheckSubAccountItem() {
		com.intuit.psd.cdm.v1.ObjectFactory factory  = new com.intuit.psd.cdm.v1.ObjectFactory();
		CheckSubscription checkSubscription = new CheckSubscription();;
		List<EntitlementEnum> processingOptions = new ArrayList<EntitlementEnum>();
		// EntitlementEnum.CHECK for processingOptions not supported yet.
		processingOptions.add(EntitlementEnum.NON_QUICKBOOKS);
		processingOptions.add(EntitlementEnum.SCAN);
		checkSubscription.setProcessingOption(processingOptions);
		return factory.createCheckSubscription(checkSubscription);
	}
	
	public void initialize() {
		if ((applicationChannel != null) && (!applicationChannel.isEmpty()))
			applicationChannelEnum = ApplicationChannelTypeEnum.valueOf(applicationChannel);
		if (applicationSource != null && !applicationSource.isEmpty())
			applicationSourceEnum = ApplicationSourceEnum.valueOf(applicationSource);
		offerDetails = createOfferDetails();
	}

	public String getApplicationChannel() {
		return applicationChannel;
	}

	public void setApplicationChannel(String applicationChannel) {
		this.applicationChannel = applicationChannel;
	}

	public String getApplicationSource() {
		return applicationSource;
	}

	public void setApplicationSource(String applicationSource) {
		this.applicationSource = applicationSource;
	}

	public String getCountryCode() {
		return countryCode;
	}

	public void setCountryCode(String countryCode) {
		this.countryCode = countryCode;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public static String getOfferId() {
		return offerId;
	}

	public static void setOfferId(String offerId) {
		OnboardingServiceClientImpl.offerId = offerId;
	}

	public static String getBrandId() {
		return brandId;
	}

	public static void setBrandId(String brandId) {
		OnboardingServiceClientImpl.brandId = brandId;
	}

	@Override
	public MerchantApplicationResponse getMerchantApplicationStatus(
			String masterAccountId, Token token, UUID requestId)
			throws OnBoardingException {
		if (masterAccountId == null || token == null || requestId == null)
			throw new IllegalArgumentException(" Required paramters are missing for onboarding service invocation ");
		String authHeader = createAuthHeader(token.getTokenId(), token.getAuthId());
		
		RestResponse clientResponse = onboardingServiceRestClient.getAccount(authHeader, requestId, masterAccountId); //This method if you know master accountid
		MerchantApplicationResponse result = null;
		try {
			result = new MerchantApplicationResponse();
			if (clientResponse.toString().contains("MasterAccount")) {
				JAXBElement<? extends CdmComplexBase> subscriptionsEl = clientResponse.getSystemResponse();
				if(subscriptionsEl == null || subscriptionsEl.getValue() == null || ((MasterAccounts)subscriptionsEl.getValue()).getMasterAccount().size() == 0){
					//There may not be any status. Make sure that the application is in the created state.
					logger.debug("Not application status returned for " + masterAccountId);
				}
				else{
					MasterAccounts masterAccounts = (MasterAccounts) subscriptionsEl.getValue();
					/*
					 * Currently there is only one master account for the user. But in future we may
					 * have multiple master accounts and in that case we will augment the code below.
					 */
					MasterAccount masterAccount = masterAccounts.getMasterAccount().get(0);
					String orderId = masterAccount.getMerchantOrderId();
					masterAccount.getStatus();
					//MasterAccountStatusEnum.
					if(orderId!=null && !orderId.equalsIgnoreCase("")){
						if(MasterAccountStatusEnum.CLOSED == masterAccount.getStatus() || MasterAccountStatusEnum.SUSPENDED == masterAccount.getStatus()){
							result.setOnboardingStatus(OnboardingStatus.DECLINED);
							
						} 
						
						/*
						 * There could be multiple subaccounts for credit card and checks. For now, we are interested only
						 * in the check account.
						 */
						for(JAXBElement<? extends SubAccount>  subAccountEl : masterAccount.getSubscriptionService()){
							SubAccount acct = subAccountEl.getValue();
							
							if(ServiceTypeEnum.CHECK == acct.getServiceType()){ //get the credit card subscription
								
								CheckSubAccount checkAccount = (CheckSubAccount) acct;
								/*
								 * Now let us do the status check. Check for echo merchant ID only if the
								 * subscription status is SUBSCRIBED.
								 */
								SubscriptionAccountStatusEnum subscriptionStatus = checkAccount.getStatus();
								if (subscriptionStatus == SubscriptionAccountStatusEnum.SUBSCRIBED) {
									result.setOnboardingStatus(OnboardingStatus.APPROVED);
									result.setEchoMerchantId(checkAccount.getEchoId());
									result.setDaysTofund(checkAccount.getDaysToFund());
									result.setMID(checkAccount.getMID());
								} else if (subscriptionStatus == SubscriptionAccountStatusEnum.DENIED ||
										subscriptionStatus == SubscriptionAccountStatusEnum.CANCELLED) {
									result.setOnboardingStatus(OnboardingStatus.DECLINED);
								} else if (subscriptionStatus == SubscriptionAccountStatusEnum.PENDING) {
									result.setOnboardingStatus(OnboardingStatus.IN_REVIEW);
								}
							}
							
						}
					}
					else{
						logger.debug("No order ID returned for merchant application: " + masterAccountId);
						throw new OnBoardingException(OnBoardingException.UNEXPECTED_STATUS_CODE);
					}
				}

			}
		} finally {
		}
		return result;
	}
	
	public MerchantApplicationResponse getMerchantInformationByAuthId(Token token, UUID requestId)
			throws OnBoardingException {
		
		String authHeader = createAuthHeader(token.getTokenId(), token.getAuthId());
		
		RestResponse clientResponse = onboardingServiceRestClient.getAccountByUserId(authHeader, requestId);
		MerchantApplicationResponse result = null;
		try {
			result = new MerchantApplicationResponse();
			if (clientResponse.getSystemResponse().getValue()!=null) {
				JAXBElement<? extends CdmComplexBase> subscriptionsEl = clientResponse.getSystemResponse();
				if(subscriptionsEl == null || subscriptionsEl.getValue() == null || ((MasterAccounts)subscriptionsEl.getValue()).getMasterAccount().size() == 0){
					//There may not be any status. Make sure that the application is in the created state.
					logger.debug("Not application status returned for authId " + token.getAuthId());
				}
				else{
					MasterAccounts masterAccounts = (MasterAccounts) subscriptionsEl.getValue();
					/*
					 * Currently there is only one master account for the user. But in future we may
					 * have multiple master accounts and in that case we will augment the code below.
					 */
					MasterAccount masterAccount = masterAccounts.getMasterAccount().get(0);
					String orderId = masterAccount.getMerchantOrderId();
					masterAccount.getStatus();
					result.setMasterAccountId(masterAccount.getId());
					result.setRealmId(masterAccount.getRealmId());
					//MasterAccountStatusEnum.
					if(orderId!=null && !orderId.equalsIgnoreCase("")){
						if(MasterAccountStatusEnum.CLOSED == masterAccount.getStatus() || MasterAccountStatusEnum.SUSPENDED == masterAccount.getStatus()){
							result.setOnboardingStatus(OnboardingStatus.DECLINED);
							
						} 
						
						/*
						 * There could be multiple subaccounts for credit card and checks. For now, we are interested only
						 * in the check account.
						 */
						for(JAXBElement<? extends SubAccount>  subAccountEl : masterAccount.getSubscriptionService()){
							SubAccount acct = subAccountEl.getValue();
							
//							if(ServiceTypeEnum.CHECK == acct.getServiceType())	{ 			//get the credit card subscription
//								CheckSubAccount checkAccount = (CheckSubAccount) acct;
//								SubscriptionAccountStatusEnum subscriptionStatus = checkAccount.getStatus();
//								if (subscriptionStatus == SubscriptionAccountStatusEnum.SUBSCRIBED) {
//									result.setOnboardingStatus(OnboardingStatus.APPROVED);
//									result.setEchoMerchantId(checkAccount.getEchoId());
//									result.setDaysTofund(checkAccount.getDaysToFund());
//									result.setMID(checkAccount.getMID());
//								} else if (subscriptionStatus == SubscriptionAccountStatusEnum.DENIED ||
//										subscriptionStatus == SubscriptionAccountStatusEnum.CANCELLED) {
//									result.setOnboardingStatus(OnboardingStatus.DECLINED);
//								} else if (subscriptionStatus == SubscriptionAccountStatusEnum.PENDING) {
//									result.setOnboardingStatus(OnboardingStatus.IN_REVIEW);
//								}
//							}
							
							if(ServiceTypeEnum.CREDIT_CARD == acct.getServiceType())	{ 	//get the credit card subscription
								CreditCardSubAccount creditCardSubAccount = (CreditCardSubAccount) acct;
								AccountNumber accountNumber = creditCardSubAccount.getAccountNumber();
								result.setMID(accountNumber.getValue());
								
						        List<AccountNumber> additionalAccountNumberList = creditCardSubAccount.getAdditionalAccountNumber(); 
						        if ((additionalAccountNumberList != null) && (additionalAccountNumberList.size() > 0)) {
						            for (AccountNumber additionalAccountNumber : additionalAccountNumberList) {
						                if (additionalAccountNumber.getSourceDomain() == SrcDomainEnum.PTS) {
						                    result.setMID(additionalAccountNumber.getValue());
						                    break;
						                }
						            }
						        }
								SubscriptionAccountStatusEnum subscriptionStatus = creditCardSubAccount.getStatus();
								if (subscriptionStatus == SubscriptionAccountStatusEnum.SUBSCRIBED) {
									result.setOnboardingStatus(OnboardingStatus.APPROVED);
								} else if (subscriptionStatus == SubscriptionAccountStatusEnum.DENIED ||
										subscriptionStatus == SubscriptionAccountStatusEnum.CANCELLED) {
									result.setOnboardingStatus(OnboardingStatus.DECLINED);
								} else if (subscriptionStatus == SubscriptionAccountStatusEnum.PENDING) {
									result.setOnboardingStatus(OnboardingStatus.IN_REVIEW);
								}
							}
							
						}
					}
					else{
						logger.debug("No order ID returned for merchant application with auth id: " + token.getAuthId());
						throw new OnBoardingException(OnBoardingException.UNEXPECTED_STATUS_CODE);
					}
				}

			}
		} finally {
		}
		return result;
	}
	


	public static String getSicCode() {
		return sicCode;
	}

	public static void setSicCode(String sicCode) {
		OnboardingServiceClientImpl.sicCode = sicCode;
	}

	public String getSparkrentServiceGatewaySecret() {
		return sparkrentServiceGatewaySecret;
	}

	public void setSparkrentServiceGatewaySecret(
			String sparkrentServiceGatewaySecret) {
		this.sparkrentServiceGatewaySecret = sparkrentServiceGatewaySecret;
	}

	public String getSparkrentServiceGatewayAppId() {
		return sparkrentServiceGatewayAppId;
	}

	public void setSparkrentServiceGatewayAppId(String sparkrentServiceGatewayAppId) {
		this.sparkrentServiceGatewayAppId = sparkrentServiceGatewayAppId;
	}


}
