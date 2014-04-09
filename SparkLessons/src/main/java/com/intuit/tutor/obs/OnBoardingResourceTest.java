///*
// * Copyright 2012 Intuit Inc. All rights reserved. Unauthorized reproduction
// * is a violation of applicable law. This material contains certain
// * confidential or proprietary information and trade secrets of Intuit Inc.
// */
//
//package com.intuit.integration.ims.onboarding;
//
//import static org.junit.Assert.assertEquals;
//import static org.junit.Assert.assertFalse;
//import static org.junit.Assert.assertNotNull;
//import static org.junit.Assert.assertNull;
//import static org.junit.Assert.assertTrue;
//
//import java.io.InputStream;
//import java.io.StringReader;
//import java.io.StringWriter;
//import java.net.InetAddress;
//import java.util.HashMap;
//import java.util.Locale;
//import java.util.Map;
//
//import javax.annotation.PostConstruct;
//import javax.security.auth.login.FailedLoginException;
//import javax.ws.rs.core.MediaType;
//import javax.xml.bind.JAXBException;
//import javax.xml.bind.Marshaller;
//import javax.xml.bind.Unmarshaller;
//
//import org.apache.commons.httpclient.methods.PostMethod;
//import org.apache.commons.httpclient.methods.StringRequestEntity;
//import org.apache.commons.io.IOUtils;
//import org.apache.commons.lang.StringUtils;
//import org.apache.log4j.Logger;
//import org.eclipse.persistence.jaxb.JAXBContextFactory;
//import org.eclipse.persistence.jaxb.MarshallerProperties;
//import org.eclipse.persistence.jaxb.UnmarshallerProperties;
//import org.junit.Before;
//import org.junit.Ignore;
//import org.junit.Test;
//import org.mule.transport.http.HttpConstants;
//
//import com.intuit.ims.onboarding.OnBoardingFunctionalTestBase;
//import com.intuit.ims.onboarding.OnBoardingMockConstants;
//import com.intuit.ims.shared.account.IPSAccount;
//import com.intuit.ims.shared.account.IPSAccountConstants;
//import com.intuit.ims.shared.account.IPSAccountUtil;
//import com.intuit.integration.ims.onboarding.components.JAXBUtils;
//import com.intuit.payments.jaxb.util.LocaleAdapter;
//import com.intuit.payments.services.common.mule.v1.rest.MOXyJsonProvider;
//import com.intuit.payments.services.onboarding.utils.OnBoardingConstants;
//import com.intuit.psd.cdm.v1.ApplicationChannelTypeEnum;
//import com.intuit.psd.cdm.v1.BusinessInfo;
//import com.intuit.psd.cdm.v1.MasterAccount;
//import com.intuit.psd.cdm.v1.MerchantOrder;
//import com.intuit.psd.cdm.v1.ObjectBase;
//import com.intuit.psd.cdm.v1.RestResponse;
//import com.intuit.psd.cdm.v1.SuccessResponse;
//import com.intuit.spc.bhp.service.authentication.Identity;
//import com.intuit.spc.bhp.serviceapi.authentication.IBHPPrincipal;
//import com.intuit.spc.bhp.serviceapi.entity.IIdentity;
//import com.intuit.spc.bhp.serviceapi.entity.TicketCredential;
//import com.intuit.spc.idmanager.access.AccessManager;
//import com.intuit.spc.idmanager.access.messages.AccountSessionMsg;
//import com.intuit.spc.idmanager.access.messages.AuthenticateByAuthIdMsg;
//import com.intuit.spc.idmanager.provision.ProvisionManager;
//import com.intuit.spc.idmanager.provision.messages.CreateGlobalProvisionalIdentityRequestMsg;
//import com.intuit.spc.idmanager.provision.messages.CreateGlobalProvisionalIdentityResponseMsg;
//
///**
// * OnBoardingResourceTest - Test case class for testing flows
// * 
// * $DateTime: 2014/03/27 16:33:54 $
// * 
// * @version $Header: //IMS/DomainServices/OnBoardingService/onboarding-endpoints/ src/test/
// *          java/com/intuit/integration/ims/onboarding/OnBoardingResourceTest .java#62 $
// * @author $Author: ryee1 $
// */
//public class OnBoardingResourceTest {
//
//    private static final Logger LOGGER = Logger.getLogger(OnBoardingResourceTest.class);
//
//    private final String TEST_PASSWORD = "sunflower";
//
//    private String port;
//    private String contextRoot;
//    javax.xml.bind.JAXBContext moxyJaxbContext = null;
//
//    @PostConstruct
//    public void setUpMoxy() throws JAXBException {
//        moxyJaxbContext = JAXBContextFactory.createContext(ObjectBase.class.getPackage().getName(), null);
//    }
//
//    @Before
//    public void setUp() throws Exception {
//        port = props.getPort();
//        contextRoot = props.getContextRoot();
//    }
//
//    // Change this value to run as JSON or XML
//    // private static final String MEDIA_TYPE = MOXyJsonProvider.MOXY_MEDIA_TYPE;
//    private static final String MEDIA_TYPE = MediaType.APPLICATION_XML;
//    private Map<String, String> defaultHeaders = new HashMap<String, String>();
//    {
//        defaultHeaders.put("Accept", MEDIA_TYPE);
//        defaultHeaders.put("Content-Type", MEDIA_TYPE);
//    }
//
//    // uncomment to use QA server instead of local instance
//    private final String ONBOARDING_HOST = "https://onboarding-qa.payments.intuit.net";
//
//    //private final String ONBOARDING_HOST = "http://localhost";
//
//    private String makeRequestPath(String path) {
//        return makeRequestPath(contextRoot, path);
//    }
//
//    private String makeRequestPath(String contextRoot, String path) {
//        String requestPath = ONBOARDING_HOST.contains("localhost") ? String.format("%s:%s/%s%s", ONBOARDING_HOST, port,
//                contextRoot, path) : String.format("%s/%s%s", ONBOARDING_HOST, contextRoot, path);
//        return requestPath;
//    }
//
//    private static abstract class AuthenticationScheme {
//        String generateAuthHeader(IIdentity identity) {
//            return generateAuthHeader(identity.getAuthId(), identity.getCredential().getCredential(),
//                    identity.getCurrentRealmId());
//        }
//
//        abstract String generateAuthHeader(String authId, String ticket, String realmId);
//    }
//
//    private static final AuthenticationScheme INTUIT_IAM = new AuthenticationScheme() {
//        @Override
//        String generateAuthHeader(String authId, String ticket, String realmId) {
//            StringBuffer buffer = new StringBuffer("INTUIT_IAM ");
//            buffer.append("x_intuit_authid=");
//            buffer.append(authId);
//            buffer.append(',');
//            buffer.append("x_intuit_ticket=");
//            buffer.append(ticket);
//
//            if (!StringUtils.isEmpty(realmId)) {
//                buffer.append(',');
//                buffer.append("x_intuit_realmid=");
//                buffer.append(realmId);
//            }
//
//            LOGGER.debug("Authorization: " + buffer);
//            return buffer.toString();
//        }
//    };
//
//    private static final AuthenticationScheme Intuit_IAM_Authentication = new AuthenticationScheme() {
//        @Override
//        String generateAuthHeader(String authId, String ticket, String realmId) {
//            StringBuffer buffer = new StringBuffer("Intuit_IAM_Authentication ");
//            buffer.append("intuit_appid=\"Intuit.sbg.payments.onboarding.test\",");
//            buffer.append("intuit_app_secret=\"6M50GN0AHsITfe6fkSYAtE\",");
//            buffer.append("intuit_version=\"1.0\",");
//            buffer.append("intuit_app_token=\"\",");
//            buffer.append("intuit_token_type=\"IAM-Ticket\",");
//
//            buffer.append("intuit_userid=");
//            buffer.append('"');
//            buffer.append(authId);
//            buffer.append('"');
//            buffer.append(',');
//
//            buffer.append("intuit_token=");
//            buffer.append('"');
//            buffer.append(ticket);
//            buffer.append('"');
//
//            if (!StringUtils.isEmpty(realmId)) {
//                buffer.append(',');
//                buffer.append("intuit_realmid=");
//                buffer.append('"');
//                buffer.append(realmId);
//                buffer.append('"');
//            }
//
//            LOGGER.debug("Authorization: " + buffer);
//            return buffer.toString();
//        }
//    };
//
//    private void setMockHeaders(PostMethod request) {
//        // request.setRequestHeader(OnBoardingMockConstants.MOCK_TS3, MockTS3Service.TS3_SUCCESS);
//        // request.setRequestHeader("onboarding_decision", "Approved");
//        // request.setRequestHeader("onboarding_decision", "RequestTimeOut");
//        // request.setRequestHeader("intuit_originatingip", "199.16.140.24");
//        request.setRequestHeader(OnBoardingMockConstants.MOCK_MAXMIND, "US");
//         request.setRequestHeader("onboarding_mock_oasis", "Socket Timeout");
//    }
//
//    private String postApplication(MerchantOrder app, String authId, String realmId, String ticket, int expectedStatus,
//            Map<String, String> headers, AuthenticationScheme scheme) throws Exception {
//        PostMethod request = null;
//
//        try {
//            StringWriter appWriter = new StringWriter();
//            Marshaller marshaller = moxyJaxbContext.createMarshaller();
//            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
//            marshaller.setProperty(MarshallerProperties.JSON_INCLUDE_ROOT, false);
//            // If json, change MOXy marshaller property
//            if (MEDIA_TYPE.equals(MOXyJsonProvider.MOXY_MEDIA_TYPE)) {
//                marshaller.setProperty(MarshallerProperties.MEDIA_TYPE, MediaType.APPLICATION_JSON);
//            }
//
//            marshaller.marshal(objectFactory.createMerchantOrder(app), appWriter);
//            LOGGER.debug("Sending:" + appWriter.toString());
//
//            String url = makeRequestPath("/orders");
//            LOGGER.debug("Posting request to : " + url);
//            request = new PostMethod(url);
//            request.getParams().setParameter("http.socket.timeout", Integer.valueOf(120000));
//            String credential = scheme.generateAuthHeader(authId, ticket, realmId);
//            request.setRequestHeader("Authorization", credential);
//            request.setRequestHeader("intuit_originatingip", "199.16.140.24");
//
//            if ("dev".equals(System.getProperty("qbmsenv"))) {
//                setMockHeaders(request);
//            }
//
//            request.setRequestHeader("X-FORWARDED-FOR", "127.0.0.1");
//
//            request.setRequestEntity(new StringRequestEntity(appWriter.toString(), MEDIA_TYPE, null));
//            if (app != null && app.getLocale() != null)
//                request.setRequestHeader(OnBoardingConstants.INTUIT_LOCALE, LocaleAdapter.toString(app.getLocale()));
//
//            if (headers != null) {
//                for (Map.Entry<String, String> entry : headers.entrySet()) {
//                    request.setRequestHeader(entry.getKey(), entry.getValue());
//                }
//            }
//            long t0 = System.nanoTime();
//            int status = httpClient.executeMethod(request);
//            String response = request.getResponseBodyAsString(1024 * 16);
//            LOGGER.debug("Received: " + response);
//            long elapsed = (System.nanoTime() - t0) / 1000000;
//            LOGGER.debug("response time = " + elapsed + "ms.");
//            assertEquals(expectedStatus, status);
//
//            return response;
//        } finally {
//            if (request != null) {
//                request.releaseConnection();
//            }
//        }
//    }
//
//    private String postApplication(String xml, Locale locale, String authId, String realmId, String ticket,
//            int expectedStatus, Map<String, String> headers, AuthenticationScheme scheme) throws Exception {
//        PostMethod request = null;
//
//        try {
//            Marshaller marshaller = moxyJaxbContext.createMarshaller();
//            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, Boolean.TRUE);
//            marshaller.setProperty(MarshallerProperties.JSON_INCLUDE_ROOT, false);
//            // If json, change MOXy marshaller property
//            if (MEDIA_TYPE.equals(MOXyJsonProvider.MOXY_MEDIA_TYPE)) {
//                marshaller.setProperty(MarshallerProperties.MEDIA_TYPE, MediaType.APPLICATION_JSON);
//            }
//
//            LOGGER.debug("Sending:" + xml);
//
//            String url = makeRequestPath("/orders");
//            LOGGER.debug("Posting request to : " + url);
//            request = new PostMethod(url);
//            request.getParams().setParameter("http.socket.timeout", Integer.valueOf(120000));
//            String credential = scheme.generateAuthHeader(authId, ticket, realmId);
//            request.setRequestHeader("Authorization", credential);
//            request.setRequestHeader("intuit_originatingip", "199.16.140.24");
//
//            if ("dev".equals(System.getProperty("qbmsenv"))) {
//                setMockHeaders(request);
//            }
//
//            request.setRequestHeader("X-FORWARDED-FOR", "127.0.0.1");
//
//            request.setRequestEntity(new StringRequestEntity(xml, MEDIA_TYPE, null));
//            request.setRequestHeader(OnBoardingConstants.INTUIT_LOCALE, LocaleAdapter.toString(locale));
//
//            if (headers != null) {
//                for (Map.Entry<String, String> entry : headers.entrySet()) {
//                    request.setRequestHeader(entry.getKey(), entry.getValue());
//                }
//            }
//            long t0 = System.nanoTime();
//            int status = httpClient.executeMethod(request);
//            String response = request.getResponseBodyAsString(1024 * 16);
//            LOGGER.debug("Received: " + response);
//            long elapsed = (System.nanoTime() - t0) / 1000000;
//            LOGGER.debug("response time = " + elapsed + "ms.");
//            assertEquals(expectedStatus, status);
//
//            return response;
//        } finally {
//            if (request != null) {
//                request.releaseConnection();
//            }
//        }
//    }
//
//    private String postApplication(MerchantOrder app, String authId, String realmId, String ticket, int expectedStatus,
//            Map<String, String> headers) throws Exception {
//        return postApplication(app, authId, realmId, ticket, expectedStatus, headers, INTUIT_IAM);
//    }
//
//    private String makeGETRequest(String path, int expectedStatus, AuthenticationScheme scheme) throws Exception {
//        return makeGETRequest(path, expectedStatus, null, scheme);
//    }
//
//    private String makeGETRequest(String path, int expectedStatus) throws Exception {
//        return makeGETRequest(path, expectedStatus, null, INTUIT_IAM);
//    }
//
//    private String makeGETRequest(String path, int expectedStatus, Map<String, String> headers) throws Exception {
//        return makeGETRequest(path, expectedStatus, headers, INTUIT_IAM);
//    }
//
//    private String makeGETRequest(String path, int expectedStatus, Map<String, String> headers,
//            AuthenticationScheme scheme) throws Exception {
//        GetMethod request = null;
//        try {
//            String url = makeRequestPath(path);
//            LOGGER.debug("GET request to: " + url);
//            request = new GetMethod(makeRequestPath(path));
//
//            Identity identity = createTestGlobalIdentity();
//            IBHPPrincipal principal = loginSource.authenticate(identity.getLoginName(), TEST_PASSWORD, null);
//            String credential = scheme.generateAuthHeader(principal.getIdentity());
//            request.setRequestHeader("Authorization", credential);
//
//            if (headers != null) {
//                for (Map.Entry<String, String> entry : headers.entrySet()) {
//                    request.setRequestHeader(entry.getKey(), entry.getValue());
//                }
//            }
//
//            long t0 = System.nanoTime();
//            int status = httpClient.executeMethod(request);
//            String response = request.getResponseBodyAsString(8192);
//            LOGGER.debug("Received response: status=" + status + ", response=" + response);
//            long elapsed = (System.nanoTime() - t0) / 1000000;
//            LOGGER.debug("response time = " + elapsed + "ms.");
//            assertEquals(expectedStatus, status);
//            return response;
//        } finally {
//            if (request != null) {
//                request.releaseConnection();
//            }
//        }
//    }
//
//    private String makePOSTRequest(IIdentity identity, String path, int expectedStatus) throws Exception {
//        return makePOSTRequest(identity, path, expectedStatus, INTUIT_IAM);
//    }
//
//    private String makePOSTRequest(IIdentity identity, String path, int expectedStatus, AuthenticationScheme scheme)
//            throws Exception {
//        PostMethod request = null;
//        try {
//            String url = makeRequestPath(path);
//            LOGGER.debug("Posting request to : " + url);
//            request = new PostMethod(url);
//
//            String credential = scheme.generateAuthHeader(identity);
//            request.setRequestHeader("Authorization", credential);
//
//            long t0 = System.nanoTime();
//            int status = httpClient.executeMethod(request);
//            String response = request.getResponseBodyAsString(8192);
//            LOGGER.debug("response status = " + status + ", response body = " + response);
//            long elapsed = (System.nanoTime() - t0) / 1000000;
//            LOGGER.debug("response time = " + elapsed + "ms.");
//            assertEquals(expectedStatus, status);
//            return response;
//        } finally {
//            if (request != null) {
//                request.releaseConnection();
//            }
//        }
//    }
//
//    private String postApplication(MerchantOrder app, int expectedStatus, Map<String, String> headers) throws Exception {
//        return postApplication(app, expectedStatus, headers, INTUIT_IAM);
//    }
//
//    private String postApplication(MerchantOrder app, int expectedStatus, Map<String, String> headers,
//            AuthenticationScheme scheme) throws Exception {
//        return postApplication(app, null, expectedStatus, headers, scheme);
//    }
//
//    private String postApplication(MerchantOrder app, Identity identity, int expectedStatus, Map<String, String> headers)
//            throws Exception {
//        return postApplication(app, identity, expectedStatus, headers, INTUIT_IAM);
//    }
//
//    private String postApplication(MerchantOrder app, Identity identity, int expectedStatus,
//            Map<String, String> headers, AuthenticationScheme scheme) throws Exception {
//        if (identity == null) {
//            identity = createTestGlobalIdentity();
//        }
//        IBHPPrincipal principal = loginSource.authenticate(identity.getLoginName(), TEST_PASSWORD, null);
//
//        // set the email address in the MerchantOrder to the email address in the Identity to pass validation
//        if (app != null && app.getBusinessInfo() != null) {
//            app.getBusinessInfo().getBusinessEmail().setAddress(identity.getEmail());
//        }
//
//        return postApplication(app, identity.getAuthId(), identity.getCurrentRealmId(), principal.getIdentity()
//                .getCredential().getCredential(), expectedStatus, headers, scheme);
//    }
//
//    private String postApplication(String xml, Locale locale, Identity identity, int expectedStatus,
//            Map<String, String> headers, AuthenticationScheme scheme) throws Exception {
//        if (identity == null) {
//            identity = createTestGlobalIdentity();
//        }
//        IBHPPrincipal principal = loginSource.authenticate(identity.getLoginName(), TEST_PASSWORD, null);
//
//        xml.replace("$$email$$", identity.getEmail());
//        // set the email address placeholder to the email address in the Identity to pass validation
//
//        return postApplication(xml, locale, identity.getAuthId(), identity.getCurrentRealmId(), principal.getIdentity()
//                .getCredential().getCredential(), expectedStatus, headers, scheme);
//    }
//    /**
//     * createMerchantOrder - creates a merchantOrder for testing.
//     *
//     * @return a MerchantOrder
//     * @throws Exception
//     */
//    private MerchantOrder createMerchantOrder() throws Exception {
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitUSAppOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.US);
//
//        String response = postApplication(app, HttpConstants.SC_OK, null);
//        return unmarshalCDMObjectFromResponse(response, MerchantOrder.class);
//    }
//
//    private Identity createTestGlobalIdentity() throws Exception {
//        Identity identity = new Identity();
//        String email = "ud+obsvc" + Math.random() + "@qbn.intuit.com";
//        identity.setLoginName(email);
//        identity.setPassword(TEST_PASSWORD);
//        identity.setEmail(email);
//        identity.setSecurityQuestion("What was the name of your first pet?");
//        identity.setSecurityAnswer("husky");
//        identity = (Identity) identityManager.createIdentity(identity);
//        return identity;
//
//    }
//
//    private Identity createTestProvisionalIdentity() throws Exception {
//        ProvisionManager pm = iamServiceFactory.getProvisionService();
//        CreateGlobalProvisionalIdentityRequestMsg createRequest = new CreateGlobalProvisionalIdentityRequestMsg();
//        String email = "ud+obsvc" + Math.random() + "@qbn.intuit.com";
//        createRequest.setEmailAddress(email);
//        createRequest.setPin(TEST_PASSWORD);
//        createRequest.setExpiryInMinutes("10");
//
//        CreateGlobalProvisionalIdentityResponseMsg createResponse = pm.createGlobalProvisionalIdentity(createRequest);
//
//        Identity identity = new Identity();
//        identity.setAuthId(createResponse.getProvisionalUserId());
//        identity.setPassword(TEST_PASSWORD + TEST_PASSWORD);
//        identity.setEmail(email);
//
//        return identity;
//    }
//
//    private AccountSessionMsg authenticateProvisionalUser(Identity pi) throws Exception {
//        AccessManager am = iamServiceFactory.getAccessService();
//        AuthenticateByAuthIdMsg authenticateRequest = new AuthenticateByAuthIdMsg();
//
//        LOGGER.debug("provisionalUserId=" + pi.getAuthId());
//        authenticateRequest.setAuthId(pi.getAuthId());
//        authenticateRequest.setPassword(TEST_PASSWORD + TEST_PASSWORD);
//        authenticateRequest.setIp(InetAddress.getLocalHost().getHostAddress());
//        AccountSessionMsg sessionResponse = am.authenticateByAuthId(authenticateRequest);
//        if (Integer.parseInt(sessionResponse.getErrorCode()) != 0) {
//            throw new FailedLoginException(sessionResponse.getErrorMessage());
//        }
//        TicketCredential ticket = new TicketCredential();
//        ticket.setCredential(sessionResponse.getTicket());
//        pi.setCredential(ticket);
//
//        LOGGER.debug("provisional session ticket=" + sessionResponse.getTicket());
//
//        return sessionResponse;
//    }
//
//    private MerchantOrder createUSAccountWithProvisionalUser(Identity pi) throws Exception {
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitUSAppOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.US);
//
//        if (pi == null) {
//            pi = createTestProvisionalIdentity();
//        }
//
//        // set the generated email id from the provisional identity to the businessEmail in order to pass validation
//        app.getBusinessInfo().getBusinessEmail().setAddress((pi.getEmail()));
//
//        AccountSessionMsg authResponse = authenticateProvisionalUser(pi);
//        String responseStr = postApplication(app, authResponse.getAuthId(), null, authResponse.getTicket(),
//                HttpConstants.SC_OK, null);
//
//        return unmarshalCDMObjectFromResponse(responseStr, MerchantOrder.class);
//    }
//
//    @SuppressWarnings("unchecked")
//    private <T> T unmarshalCDMObjectFromResponse(String responseStr, Class<T> type) throws Exception {
//        Unmarshaller unmarshaller = moxyJaxbContext.createUnmarshaller();
//        if (MEDIA_TYPE.equals(MediaType.APPLICATION_JSON)) {
//            unmarshaller.setProperty(UnmarshallerProperties.MEDIA_TYPE, MEDIA_TYPE);
//        }
//
//        RestResponse response = (RestResponse) unmarshaller.unmarshal(new StringReader(responseStr));
//        assertEquals("Success", response.getSystemResponse().getName().getLocalPart());
//        return (T) ((SuccessResponse) response.getSystemResponse().getValue()).getCDMObject().getValue();
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testCreateUKAccount() throws Exception {
//        LOGGER.debug("testCreateUKAccount");
//
//        MerchantOrder app = new MerchantOrder();
//
//        app.setApplicationChannel(ApplicationChannelTypeEnum.MOBILE_APP);
//        app.setLocale(Locale.UK);
//
//        postApplication(app, HttpConstants.SC_OK, null);
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testCreateUKAccountNoRealm() throws Exception {
//        LOGGER.debug("testCreateUKAccountNoRealm");
//
//        MerchantOrder app = new MerchantOrder();
//
//        app.setApplicationChannel(ApplicationChannelTypeEnum.MOBILE_APP);
//        app.setLocale(Locale.UK);
//
//        postApplication(app, HttpConstants.SC_OK, null);
//    }
//
//    @Test
//    public void testCreateUSAccountWithProvisionalUser() throws Exception {
//        LOGGER.debug("testCreateUSAccountWithProvisionalUser");
//
//        createUSAccountWithProvisionalUser(null);
//    }
//
//    @Test
//    public void testMapToRealm() throws Exception {
//        LOGGER.debug("testMapToRealm");
//
//        MerchantOrder app = createUSAccountWithProvisionalUser(null);
//        assertNull(app.getRealmId());
//
//        Identity identity = createTestGlobalIdentity();
//        IBHPPrincipal principal = loginSource.authenticate(identity.getLoginName(), TEST_PASSWORD, null);
//
//        String responseStr = makePOSTRequest(principal.getIdentity(), "/accounts/" + app.getMasterAccountId()
//                + "/realm", HttpConstants.SC_OK);
//        MasterAccount account = unmarshalCDMObjectFromResponse(responseStr, MasterAccount.class);
//        assertNotNull(account.getRealmId());
//    }
//
//    @Test
//    public void testMapToRealmWithProvisionalUser() throws Exception {
//        LOGGER.debug("testMapToRealmWithProvisionalUser");
//
//        Identity pi = createTestProvisionalIdentity();
//        MerchantOrder app = createUSAccountWithProvisionalUser(pi);
//        assertNull(app.getRealmId());
//
//        makePOSTRequest(pi, "/accounts/" + app.getMasterAccountId() + "/realm", HttpConstants.SC_UNAUTHORIZED);
//    }
//
//    @Test
//    public void testMapToExistingRealm() throws Exception {
//        LOGGER.debug("testMapToExistingRealm");
//
//        MerchantOrder app = createUSAccountWithProvisionalUser(null);
//        assertNull(app.getRealmId());
//
//        Identity identity = createTestGlobalIdentity();
//        IBHPPrincipal principal = loginSource.authenticate(identity.getLoginName(), TEST_PASSWORD, null);
//
//        String realmId = identityUtil.createRealm(principal, identity.getLoginName());
//
//        String responseStr = makePOSTRequest(principal.getIdentity(), "/accounts/" + app.getMasterAccountId()
//                + "/realm", HttpConstants.SC_OK);
//        MasterAccount account = unmarshalCDMObjectFromResponse(responseStr, MasterAccount.class);
//        assertNotNull(account.getRealmId());
//        assertEquals(realmId, account.getRealmId());
//    }
//
//    @Test
//    public void testMapToExistingRealmWithRealmIdParam() throws Exception {
//        LOGGER.debug("testMapToExistingRealmWithRealmIdParam");
//
//        MerchantOrder app = createUSAccountWithProvisionalUser(null);
//        assertNull(app.getRealmId());
//
//        Identity identity = createTestGlobalIdentity();
//        IBHPPrincipal principal = loginSource.authenticate(identity.getLoginName(), TEST_PASSWORD, null);
//
//        String realmId = identityUtil.createRealm(principal, identity.getLoginName());
//
//        String responseStr = makePOSTRequest(principal.getIdentity(), "/accounts/" + app.getMasterAccountId()
//                + "/realm/" + realmId, HttpConstants.SC_OK);
//        MasterAccount account = unmarshalCDMObjectFromResponse(responseStr, MasterAccount.class);
//        assertNotNull(account.getRealmId());
//        assertEquals(realmId, account.getRealmId());
//    }
//
//    @Test
//    public void testMapToRealmWithUserInMultipleRealms() throws Exception {
//        LOGGER.debug("testMapToRealmWithUserInMultipleRealms");
//
//        MerchantOrder app = createUSAccountWithProvisionalUser(null);
//        assertNull(app.getRealmId());
//
//        Identity identity = createTestGlobalIdentity();
//        IBHPPrincipal principal = loginSource.authenticate(identity.getLoginName(), TEST_PASSWORD, null);
//
//        String realmId1 = identityUtil.createRealm(principal, identity.getLoginName());
//        String realmId2 = identityUtil.createRealm(principal, identity.getLoginName());
//
//        String responseStr = makePOSTRequest(principal.getIdentity(), "/accounts/" + app.getMasterAccountId()
//                + "/realm", HttpConstants.SC_OK);
//        MasterAccount account = unmarshalCDMObjectFromResponse(responseStr, MasterAccount.class);
//        assertNotNull(account.getRealmId());
//        // can't use existing realm since more than one exists
//        assertFalse(account.getRealmId().equals(realmId1));
//        assertFalse(account.getRealmId().equals(realmId2));
//    }
//
//    @Test
//    public void testSubmitUKApp() throws Exception {
//        LOGGER.debug("testSubmitUKApp");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitAppOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.UK);
//
//        postApplication(app, HttpConstants.SC_OK, null);
//    }
//
//    @Test
//    public void testSubmitUSApp() throws Exception {
//        LOGGER.debug("testSubmitUSApp");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitUSAppOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.US);
//
//        postApplication(app, HttpConstants.SC_OK, defaultHeaders);
//    }
//
//    @Test
//    public void testSubmitUSAppWithSchemaError() throws Exception {
//        LOGGER.debug("testSubmitUSAppWithSchemaError");
//
//        InputStream inStream = this.getClass().getClassLoader()
//                .getResourceAsStream("application/SubmitUSAppOrderWithSchemaError.xml");
//        StringWriter writer = new StringWriter();
//        IOUtils.copy(inStream, writer);
//        postApplication(writer.toString(), Locale.US, createTestGlobalIdentity(), HttpConstants.SC_NOT_ACCEPTABLE,
//                defaultHeaders, INTUIT_IAM);
//    }
//
//    @Test
//    @Ignore
//    public void testSubmitUSAppWithValidNAICS() throws Exception {
//        LOGGER.debug("testSubmitUSAppWithValidNAICS");
//        String validNAICS = "443142";
//        String matchingSIC = "5732";
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitUSAppOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.US);
//        app.getBusinessInfo().setSIC(null);
//        app.getBusinessInfo().setNAICS(validNAICS);
//
//        String response = postApplication(app, HttpConstants.SC_OK, defaultHeaders);
//        LOGGER.debug("Jaxbcontext not null: " + jaxbContext != null);
//        LOGGER.debug("response not null: " + response != null);
//        logger.debug("REsponse: " + ((response != null) ? response : "is null" ));
//        app = (MerchantOrder) ((SuccessResponse)JAXBUtils.unmarshalFragment(response,jaxbContext,  RestResponse.class).getSystemResponse().getValue()).getCDMObject().getValue();
//
//        assertTrue("Returned app should return matching SIC code.", app.getBusinessInfo().getSIC().equals(matchingSIC));
//    }
//
//    @Test
//    @Ignore
//    public void testSubmitUSAppWithInvalidNAICS() throws Exception {
//        LOGGER.debug("testSubmitUSAppWithInvalidNAICS");
//        String INVALID_NAICS = "000";
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitUSAppOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.US);
//        app.getBusinessInfo().setSIC("");
//        app.getBusinessInfo().setNAICS(INVALID_NAICS);
//
//        postApplication(app, HttpConstants.SC_BAD_REQUEST, defaultHeaders);
//    }
//
//    @Test
//    public void testSubmitUSAppWithValidationError() throws Exception {
//        LOGGER.debug("testSubmitUSAppWithValidationError");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitUSAppOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.US);
//        app.setApplicationChannel(null);
//        postApplication(app, HttpConstants.SC_BAD_REQUEST, defaultHeaders);
//    }
//
//    @Test
//    public void testSubmitUSAppWithIntuit_IAM_Authentication() throws Exception {
//        LOGGER.debug("testSubmitUSApp");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitUSAppOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.US);
//
//        postApplication(app, HttpConstants.SC_OK, defaultHeaders, Intuit_IAM_Authentication);
//    }
//
//    @Test
//    public void testSubmitUSAppWithCheck() throws Exception {
//        LOGGER.debug("testSubmitUSAppWithCheck");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitQBOSPAAppOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.US);
//
//        postApplication(app, HttpConstants.SC_OK, defaultHeaders);
//    }
//
//    @Test
//    public void testTwoPartUSSubmit() throws Exception {
//        LOGGER.debug("testTwoPartUSSubmit: create Cash ACcount");
//
//        MerchantOrder cashOrder = JAXBUtils.unmarshal("/application/USCashAccountOrder.xml", MerchantOrder.class);
//
//        String response = postApplication(cashOrder, HttpConstants.SC_OK, defaultHeaders);
//
//        cashOrder = unmarshalCDMObjectFromResponse(response, MerchantOrder.class);
//
//        LOGGER.debug("testTwoPartUSSubmit: submit full order");
//
//        MerchantOrder fullOrder = JAXBUtils.unmarshal("/application/SubmitUSAppOrder.xml", MerchantOrder.class);
//
//        fullOrder.setId(cashOrder.getId());
//        fullOrder.setMasterAccountId(cashOrder.getMasterAccountId());
//        fullOrder.setLocale(Locale.US);
//
//        postApplication(fullOrder, HttpConstants.SC_OK, defaultHeaders);
//    }
//
//    @Test
//    public void testSubmitUSAppWithCheckAndIPN() throws Exception {
//        LOGGER.debug("testSubmitUSAppWithCheckAndIPN");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitQBDTSPAAppOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.US);
//
//        postApplication(app, HttpConstants.SC_OK, defaultHeaders);
//    }
//
//    @Test
//    public void testSubmitUSSparkRentApp() throws Exception {
//        LOGGER.debug("testSubmitUSSparkRentApp");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitSparkRentOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.US);
//
//        postApplication(app, HttpConstants.SC_OK, defaultHeaders);
//    }
//
//    @Test
//    public void testSubmitUSPOSApp() throws Exception {
//        LOGGER.debug("testSubmitUSPOSApp");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitPOSAppOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.US);
//
//        postApplication(app, HttpConstants.SC_OK, defaultHeaders);
//    }
//
//    @Test
//    public void testSubmitUSIPNSPAApp() throws Exception {
//        LOGGER.debug("testSubmitUSIPNSPAApp");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitIPNSPAOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.US);
//
//        postApplication(app, HttpConstants.SC_OK, defaultHeaders);
//    }
//
//    @Test
//    public void testSubmitUSQBOC2HSPAApp() throws Exception {
//        LOGGER.debug("testSubmitUSQBOC2HSPAApp");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitQBOC2HSPAOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.US);
//
//        postApplication(app, HttpConstants.SC_OK, defaultHeaders);
//    }
//
//    @Test
//    public void testSubmitInvalidPartialSSNApp() throws Exception {
//        LOGGER.debug("testSubmitInvalidPartialSSNApp");
//        MerchantOrder app = JAXBUtils.unmarshal("/idanalytics/InvalidPartialSSN.xml", MerchantOrder.class);
//        postApplication(app, HttpConstants.SC_BAD_REQUEST, defaultHeaders);
//    }
//
//    @Test(timeout = 120000)
//    public void testSubmitValidPartialSSNApp() throws Exception {
//        LOGGER.debug("testSubmitValidPartialSSNApp");
//        MerchantOrder app = JAXBUtils.unmarshal("/idanalytics/ValidPartialSSN.xml", MerchantOrder.class);
//        postApplication(app, HttpConstants.SC_OK, defaultHeaders);
//    }
//
//    @Test
//    public void testCreateUKCashAccount() throws Exception {
//        LOGGER.debug("testCreateUKCashAccount");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/CashAccountOrder.xml", MerchantOrder.class);
//
//        postApplication(app, HttpConstants.SC_OK, defaultHeaders);
//    }
//
//    @Test
//    public void testCreateUSCashAccount() throws Exception {
//        LOGGER.debug("testCreateUSCashAccount");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/USCashAccountOrder.xml", MerchantOrder.class);
//
//        postApplication(app, HttpConstants.SC_OK, defaultHeaders);
//    }
//
//    @Test
//    public void testSubmitUKFullApp() throws Exception {
//        LOGGER.debug("testSubmitUKFullApp");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitFullOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.UK);
//
//        postApplication(app, HttpConstants.SC_OK, defaultHeaders);
//    }
//
//    @Test
//    public void testSubmitUKWithInvalidLocale() throws Exception {
//        LOGGER.debug("testSubmitUKWithInvalidLocale");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitFullOrder.xml", MerchantOrder.class);
//        app.setLocale(new Locale("xx", "XX"));
//
//        postApplication(app, HttpConstants.SC_BAD_REQUEST, defaultHeaders);
//    }
//
//    @Test
//    public void testSwiperSubmission() throws Exception {
//        LOGGER.debug("testSwiperSubmission");
//        for (int i = 0; i < 3; i++) {
//            MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitSwiperFullOrder.xml", MerchantOrder.class);
//            app.setLocale(Locale.UK);
//
//            postApplication(app, HttpConstants.SC_OK, defaultHeaders);
//        }
//    }
//
//    @Test
//    public void testTS3AccountCreation() throws Exception {
//        LOGGER.debug("testTS3AccountCreation");
//        MerchantOrder app = JAXBUtils.unmarshal("/ts3/MerchantOrderUKWithDepositAccount.xml", MerchantOrder.class);
//        app.setLocale(Locale.UK);
//
//        postApplication(app, HttpConstants.SC_OK, new HashMap<String, String>() {
//            private static final long serialVersionUID = 1L;
//            {
//                put("intuit_test", "true");
//                putAll(defaultHeaders);
//            }
//        });
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testGetAccount() throws Exception {
//        LOGGER.debug("testGetAccount");
//        makeGETRequest("/accounts/220155092", HttpConstants.SC_OK);
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testGetAccountWithIntuit_IAM_Authentication() throws Exception {
//        LOGGER.debug("testGetAccount");
//        String response = makeGETRequest("/accounts/220155092", HttpConstants.SC_OK, Intuit_IAM_Authentication);
//        LOGGER.debug("Received: " + response);
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testGetAccountWithInvalidParam() throws Exception {
//        LOGGER.debug("testGetAccountWithInvalidParam");
//        makeGETRequest("/accounts/2201550", HttpConstants.SC_NOT_FOUND);
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testGetCreditCardAccount() throws Exception {
//        LOGGER.debug("testGetCreditCardAccount");
//        makeGETRequest("/accounts/260744012/creditcard", HttpConstants.SC_OK);
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testGetCreditCardAccountWithInvalidParam() throws Exception {
//        LOGGER.debug("testGetCreditCardAccountWithInvalidParam");
//        makeGETRequest("/accounts/2230958/creditcard", HttpConstants.SC_NOT_FOUND);
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testGetCheckAccount() throws Exception {
//        LOGGER.debug("testGetCheckAccount");
//        makeGETRequest("/accounts/266767280/check", HttpConstants.SC_OK);
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testGetCheckAccountWithInvalidParam() throws Exception {
//        LOGGER.debug("testGetCheckAccountWithInvalidParam");
//        makeGETRequest("/accounts/2230958/check", HttpConstants.SC_NOT_FOUND);
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testGetAccountByRealm() throws Exception {
//        LOGGER.debug("testGetAccountByRealm");
//        makeGETRequest("/accounts/257862332/realm", HttpConstants.SC_OK);
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testGetAccountByRealmWithInActiveId() throws Exception {
//        LOGGER.debug("testGetAccountByRealmWithInvalidId");
//        makeGETRequest("/accounts/45465614/realm", HttpConstants.SC_NOT_FOUND);
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testGetAccountByRealmWithInvalidId() throws Exception {
//        LOGGER.debug("testGetAccountByRealmWithInvalidId");
//        makeGETRequest("/accounts/2767621/realm", HttpConstants.SC_NOT_FOUND);
//    }
//
//    @Test
//    public void testGetAccountByRealmWithInvalidParam() throws Exception {
//        LOGGER.debug("testGetAccountByRealmWithInvalidParam");
//        makeGETRequest("/accounts/jmo8784/realm", HttpConstants.SC_BAD_REQUEST);
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testGetBankDetailsWithInvalidSortCode() throws Exception {
//        LOGGER.debug("testGetBankDetailsWithInvalidSortCode");
//        Map<String, String> headers = new HashMap<String, String>();
//        headers.put(OnBoardingMockConstants.MOCK_BANK_LOOKUP, OnBoardingMockConstants.BANK_LOOKUP_INVALID_SORT_CODE);
//        makeGETRequest("/banks?routingNumber=309&bankAccountNumber=123456", HttpConstants.SC_BAD_REQUEST);
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testGetBankDetailsWithInvalidAccountNum() throws Exception {
//        LOGGER.debug("testGetBankDetailsWithInvalidAccountNum");
//        Map<String, String> headers = new HashMap<String, String>();
//        headers.put(OnBoardingMockConstants.MOCK_BANK_LOOKUP,
//                OnBoardingMockConstants.BANK_LOOKUP_INVALID_ACCOUNT_NUMBER);
//        makeGETRequest("/banks?routingNumber=309394&bankAccountNumber=123456456", HttpConstants.SC_BAD_REQUEST, headers);
//    }
//
//    @Test
//    // (timeout = 120000)
//    public void testGetBankDetails() throws Exception {
//        LOGGER.debug("testGetBankDetails");
//        Map<String, String> headers = new HashMap<String, String>();
//        headers.put(OnBoardingMockConstants.MOCK_BANK_LOOKUP, OnBoardingMockConstants.BANK_LOOKUP_SUCCESS);
//        makeGETRequest("/banks?routingNumber=309394&bankAccountNumber=123456", HttpConstants.SC_OK, headers);
//    }
//
//    @Test
//    @Ignore
//    public void testGetMockBankDetailsWithInvalidSortCode() throws Exception {
//        LOGGER.debug("testGetMockBankDetailsWithInvalidSortCode");
//        makeGETRequest("/banks?routingNumber=309&bankAccountNumber=123456", HttpConstants.SC_BAD_REQUEST,
//                new HashMap<String, String>() {
//                    private static final long serialVersionUID = 1L;
//                    {
//                        put("onboarding_mock_bankLookup", "0");
//                        putAll(defaultHeaders);
//                    }
//                });
//    }
//
//    @Test
//    @Ignore
//    public void testGetMockBankDetailsWithInvalidAccountNumber() throws Exception {
//        LOGGER.debug("testGetMockBankDetailsWithInvalidAccountNumber");
//        makeGETRequest("/banks?routingNumber=309394&bankAccountNumber=123456456", HttpConstants.SC_BAD_REQUEST,
//                new HashMap<String, String>() {
//                    private static final long serialVersionUID = 1L;
//                    {
//                        put("onboarding_mock_bankLookup", "1");
//                        putAll(defaultHeaders);
//                    }
//                });
//    }
//
//    @Test
//    // (timeout = 120000)
//    @Ignore
//    public void testGetAddressListWithInvalidParams() throws Exception {
//        LOGGER.debug("testGetAddressListWithInvalidParams");
//        makeGETRequest("/addresses?postalCode=12345&houseNumber=12", HttpConstants.SC_BAD_REQUEST);
//    }
//
//    @Test
//    // (timeout = 120000)
//    @Ignore
//    public void testGetAddressList() throws Exception {
//        LOGGER.debug("testGetAddressList");
//        makeGETRequest("/addresses?postalCode=BA133BN&houseNumber=103", HttpConstants.SC_OK);
//    }
//
//    @Test
//    // (timeout=10000)
//    public void testCreateUSAccountWithInvalidLocale() throws Exception {
//        LOGGER.debug("testCreateUSAccountWithInvalidLocale");
//
//        MerchantOrder app = new MerchantOrder();
//
//        app.setApplicationChannel(ApplicationChannelTypeEnum.MOBILE_APP);
//        app.setLocale(Locale.CHINA);
//        // FIXME: while GP_US flow is not yet planned, expect BAD_REQUEST
//        postApplication(app, HttpConstants.SC_BAD_REQUEST, defaultHeaders);
//    }
//
//    @Test
//    // (timeout=10000)
//    public void testCreateUnknownSourceAccount() throws Exception {
//        LOGGER.debug("testCreateUnknownSourceAccount");
//
//        MerchantOrder app = new MerchantOrder();
//
//        postApplication(app, HttpConstants.SC_BAD_REQUEST, defaultHeaders);
//    }
//
//    @Test
//    // (timeout=10000)
//    public void testBadCredentials() throws Exception {
//        LOGGER.debug("testBadCredentials");
//
//        MerchantOrder app = new MerchantOrder();
//
//        app.setApplicationChannel(ApplicationChannelTypeEnum.MOBILE_APP);
//
//        postApplication(app, "123456", "4534545", null, HttpConstants.SC_UNAUTHORIZED, defaultHeaders);
//    }
//
//    @Test
//    public void testGetMerchantOrderForNotificationReturnsOKResponse() throws Exception {
//        LOGGER.debug("testFindMerchantOrderById");
//        MerchantOrder merchantOrder = createMerchantOrder();
//        makeGETRequest("/notifications/" + merchantOrder.getMasterAccountId(), HttpConstants.SC_OK);
//    }
//
//    @Test
//    public void testGetMerchantOrderForNotificationReturnsNotFoundResponse()
//            throws Exception {
//        LOGGER.debug("testGetMerchantOrderForNotificationReturnsNotFoundResponse");
//        makeGETRequest("/notifications/111111111",
//// for now we can't distinguish between invalid authid (not found) and transient IDX errors;
//// need a fix from PA team
////                HttpConstants.SC_NOT_FOUND);
//                HttpConstants.SC_INTERNAL_SERVER_ERROR);
//    }
//
//    @Test
//    public void testSendNotificationReturnsOKResponse() throws Exception {
//        LOGGER.debug("testSendNotificationReturnsOKResponse");
//        Identity pi = createTestProvisionalIdentity();
//        authenticateProvisionalUser(pi);
//
//        MerchantOrder merchantOrder = createMerchantOrder();
//        LOGGER.debug("MerchantOrder masterAccountId:" + merchantOrder.getMasterAccountId());
//        makePOSTRequest(pi, "/notifications/" + merchantOrder.getMasterAccountId() + "/resendemail",
//                HttpConstants.SC_OK);
//    }
//
//    @Test
//    public void testSendNotificationReturnsNotFoundResponse() throws Exception {
//        LOGGER.debug("testSendNotificationReturnsNotFoundResponse");
//        Identity pi = createTestProvisionalIdentity();
//        authenticateProvisionalUser(pi);
//
//        makePOSTRequest(pi, "/notifications/111111111/resendemail", HttpConstants.SC_NOT_FOUND);
//    }
//
//    /**
//     * Just gets <server>/health/check and ensures response isn't null.
//     * @throws Exception
//     */
//    @Test
//    public void testHealthCheckEndpoint() throws Exception {
//        LOGGER.debug("testHealthCheckEndpoint");
//        GetMethod request = null;
//        try {
//            String url = makeRequestPath("health", "/check");
//            LOGGER.debug("GET request to: " + url);
//            request = new GetMethod(url);
//            httpClient.executeMethod(request);
//            String result = request.getResponseBodyAsString();
//            assertNotNull(result);
//            LOGGER.debug("Result was: " + result);
//            // result should be a "Health Check Ok"
//        } finally {
//            if (request != null) {
//                request.releaseConnection();
//            }
//        }
//    }
//
//    @Test
//    public void testAutoPopulationOfMasterMerchantAttributes() throws Exception {
//        LOGGER.debug("testAutoPopulationOfMasterMerchantAttributes");
//
//        MerchantOrder app = JAXBUtils.unmarshal("/application/SubmitQBOSPAAppOrder.xml", MerchantOrder.class);
//        app.setLocale(Locale.US);
//
//        BusinessInfo businessInfo = app.getBusinessInfo();
//        assertNull(businessInfo.getDBA());
//        assertNull(businessInfo.getBusinessAddress().getCountry());
//
//        String response = postApplication(app, HttpConstants.SC_OK, defaultHeaders);
//
//        MerchantOrder responseOrder = unmarshalCDMObjectFromResponse(response, MerchantOrder.class);
//        assertNotNull(responseOrder);
//        int masterAcctId = Integer.parseInt(responseOrder.getMasterAccountId());
//        IPSAccount ipsAccount = IPSAccountUtil.getIPSAccountManager().getIPSAccount(masterAcctId);
//        assertNotNull(ipsAccount);
//        assertNotNull(ipsAccount.getAttribute(IPSAccountConstants.ATTR_DBA));
//        assertNotNull(ipsAccount.getAttribute(IPSAccountConstants.ATTR_BUSINESS_ADDR_COUNTRY));
//    }
//
//}
