package com.intuit.platform.integration.httpclient;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import com.intuit.platform.integration.iface.ISecurity;
import com.intuit.platform.integration.iface.IntuitHeader;
import com.intuit.platform.integration.rest.exceptions.RESTClientException;

/*
 * Default OII request headers handler for handling the following OII behaviors:
 *   - Generate Authorization based on selected authentication method. Currently
 *     it only works with IAMTicket
 *   - Inject TID header
 */
public class OIIRequestHeaderHandler implements ISecurity {
	/*
	 * This data is kept per thread.
	 */
	private static class _State {
		Map<String,String> headers;
		APIAuthMethod authMethod;
		boolean tidAutoGen;
		String tidPrefix;
		String preferredTID;
	}
	
	protected ThreadLocal<_State> threadStates = new ThreadLocal<_State>();
	
	private _State getState() {
		_State states = threadStates.get();
		if (states == null) {
			states = new _State();
			threadStates.set(states);
		}
		return states;
	}
	
	/**
	 * Create an instance of the OII request header handler
	 * @param intuitHeaders
	 * @param customHeaders
	 * @param authMethod
	 * @param autoGenTid
	 * @param prefixTid
	 */
	public OIIRequestHeaderHandler(Map<IntuitHeader,String> intuitHeaders, Map<String,String> customHeaders, 
			APIAuthMethod authMethod, boolean autoGenTid, String prefixTid) {
		_State ctx = getState();
		ctx.tidAutoGen = autoGenTid;
		ctx.tidPrefix = new String(prefixTid);
		ctx.authMethod = authMethod;
		ctx.headers = new HashMap<String,String>();
		if (intuitHeaders != null) {
			for (IntuitHeader hdr : intuitHeaders.keySet()) {
				ctx.headers.put(hdr.toString(), intuitHeaders.get(hdr));
			}
		}
		if (customHeaders != null) {
			ctx.headers.putAll(customHeaders);
		}
	}
	
	public void setServiceCredentials(String appId, String appSecret) {
		_State ctx = getState();
		if (ctx.headers == null) {
			throw new RESTClientException(0, "REST headers are not set.", null);								
		}
		if (appId == null || appId.isEmpty()) {
			throw new RESTClientException(0, "AppId is null.", null);								
		}
		if (appSecret == null || appSecret.isEmpty()) {
			throw new RESTClientException(0, "AppSecret is null.", null);								
		}

		ctx.headers.put(IntuitHeader.APPID.toString(), appId);
		ctx.headers.put(IntuitHeader.APPSECRET.toString(), appSecret);
	}
	
	/**
	 * Set preferred TID
	 * @param tid The TID used to send the future http requests. It's effective only once if autoGenTID flag is ON
	 * and will sticks indefinitely if that flag is set to OFF.
	 */
	public void setPreferredTID(String tid) {
		if (tid != null) {
			getState().preferredTID = new String(tid);
		}
	}
	
	public void setAutoGenTID(boolean flag) {
		getState().tidAutoGen = flag;
	}
	
	public void setTIDPrefix(String prefix) {
		if (prefix != null) {
			getState().tidPrefix = new String(prefix);
		}
	}
	
	public void setAuthMethod(APIAuthMethod method) {
		if (method != null) {
			getState().authMethod = method;
		}
	}
	
	@Override
	public synchronized Map<String,String> getHeadersWithIAMTicket(String accessTicket, String userId, String realmId) {
		Map<String,String> retHeaders = null;
		_State ctx = getState();

		if (ctx.headers != null) {

			Set<String> headerKeys = ctx.headers.keySet();
	
			// check for required headers
			if (!headerKeys.contains(IntuitHeader.APPID.toString())) {
				throw new RESTClientException(0, "Missing Intuit Header APPID.", null);
			}
			if (!headerKeys.contains(IntuitHeader.APPSECRET.toString()) && !headerKeys.contains(IntuitHeader.AUTHORIZATION.toString())) {
				throw new RESTClientException(0, "Missing required Intuit Header - either APPSECRET or AUTHORIZATION must be provided.", null);				
			}

			retHeaders = new HashMap<String,String>();

			// Compute AUTHORIZATION header value from APPID and APPSECRET if AUTHORIZATION header is not provided
			if (!headerKeys.contains(IntuitHeader.AUTHORIZATION.toString())) {
				StringBuilder authHdr = new StringBuilder();

				authHdr.append("Intuit_IAM_Authentication intuit_appid=");
				authHdr.append(ctx.headers.get(IntuitHeader.APPID.toString()));
				authHdr.append(",intuit_app_secret=");
				authHdr.append(ctx.headers.get(IntuitHeader.APPSECRET.toString()));

				if (accessTicket != null && !accessTicket.isEmpty()) {
					authHdr.append(",intuit_token_type=IAM-Ticket,intuit_token=");
					authHdr.append(accessTicket);
					if (userId != null && !userId.isEmpty()) {
						authHdr.append(",intuit_userid=");
						authHdr.append(userId);
					}
					if (realmId != null && !realmId.isEmpty()) {
						authHdr.append(",intuit_realmid=");
						authHdr.append(realmId);
					}					
				}
				retHeaders.put(IntuitHeader.AUTHORIZATION.toString(), authHdr.toString());
			}
			for (String hdr : headerKeys) {
				if (!hdr.equalsIgnoreCase(IntuitHeader.APPSECRET.toString())) {
					retHeaders.put(hdr, ctx.headers.get(hdr));
				}
			}
			
			// determine tid value to set
			String currentTid = null;
			if (getState().preferredTID != null) {
				currentTid = getState().preferredTID;
				getState().preferredTID = null;
			}
			if (currentTid == null && getState().tidAutoGen) {
				if (getState().tidPrefix != null) {
					currentTid = getState().tidPrefix;
				}
				currentTid += UUID.randomUUID().toString().replace("-", "");
			}
			if (currentTid != null) {
				retHeaders.put(IntuitHeader.TID.toString(), currentTid);
			}
		}
		
		return retHeaders;
	}
	
}
