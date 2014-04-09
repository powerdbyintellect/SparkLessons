package com.intuit.platform.integration.httpclient;

import java.io.IOException;
import java.io.InputStream;
import java.util.Map;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.NotImplementedException;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.HttpDelete;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpPut;
import org.apache.http.client.methods.HttpRequestBase;
import org.apache.http.conn.params.ConnManagerPNames;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.CoreConnectionPNames;
import org.apache.http.params.HttpParams;

import com.intuit.platform.integration.iface.IHttpClient;
import com.intuit.platform.integration.iface.IntuitHeader;
import com.intuit.platform.integration.rest.exceptions.RESTClientInvocationException;

public class ApacheHttpClient implements IHttpClient {

    public static final String CONNECTION_KEEP_ALIVE_SECONDS = "restclient.connection.keepalive.time";
    
	private static final int MAX_TOTAL_CONNECTIONS_VALUE = 200;
	private static final int MAX_CONNECTIONS_PER_ROUTE_VALUE = 100;
	private static final int DEFAULT_KEEP_ALIVE_VALUE = 15;  // 15 seconds is the default
												             // timeout returned by the F5
												             // LTM in QDC PROD.
	private static final int CONNECTION_TIMEOUT_VALUE = 5000;
	private static final int SO_TIMEOUT_VALUE = 60000;
	private static final boolean STALE_CONNECTION_CHECK_VALUE = false;

	private final DefaultHttpClient httpClient; //HttpClient httpclient = HttpClientBuilder.create().build();
	private final int maxAttempts;

	/*
	 * Construct a http client object for sending request. 
     * http://hc.apache.org/httpcomponents-client-ga/httpclient/apidocs/org/apache/http/impl/client/DefaultHttpClient.html
     * http://hc.apache.org/httpcomponents-client-ga/httpclient/apidocs/constant-values.html
	 */
	public ApacheHttpClient(HttpParams params, int maxRetries) {
		if (params == null) {
			params = createDefaultHttpParams();
		}
		httpClient = createHttpClient(params);
		maxAttempts = maxRetries;
	}
	
	@Override
	public HttpResponse execute(String requestUrl, HttpMethod requestMethod,
			Map<String, String> headers, String cType,
			String requestBody) {
		
		HttpRequestBase request = null;
		if (requestMethod == HttpMethod.POST) {
			HttpPost post = new HttpPost(requestUrl);
			setRequestBody(post, requestBody, getContentType(cType));
			request = post;
		} else if (requestMethod == HttpMethod.PUT) {
			HttpPut put = new HttpPut(requestUrl);
			setRequestBody(put, requestBody, getContentType(cType));
			request = put;
		} else if (requestMethod == HttpMethod.GET) {
			request = new HttpGet(requestUrl);
		} else if (requestMethod == HttpMethod.DELETE) {
			request = new HttpDelete(requestUrl);	
		} else {
			throw new NotImplementedException("HTTP method not implemented - "+requestMethod);
		}
		addHeaders(request, headers);
		return execute(request);
	}

	private HttpParams createDefaultHttpParams() {
		HttpParams params = new BasicHttpParams();
		params.setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT,
				Integer.valueOf(CONNECTION_TIMEOUT_VALUE));
		params.setParameter(CoreConnectionPNames.SO_TIMEOUT,
				Integer.valueOf(SO_TIMEOUT_VALUE));
		params.setParameter(CoreConnectionPNames.STALE_CONNECTION_CHECK,
				Boolean.valueOf(STALE_CONNECTION_CHECK_VALUE));
		params.setParameter(ConnManagerPNames.MAX_CONNECTIONS_PER_ROUTE, 
				Integer.valueOf(MAX_CONNECTIONS_PER_ROUTE_VALUE));
		params.setParameter(ConnManagerPNames.MAX_TOTAL_CONNECTIONS, 
				Integer.valueOf(MAX_TOTAL_CONNECTIONS_VALUE));	
		params.setParameter(CONNECTION_KEEP_ALIVE_SECONDS, 
				Integer.valueOf(DEFAULT_KEEP_ALIVE_VALUE));	
		return params;
	}
	
	private DefaultHttpClient createHttpClient(HttpParams params) {
		SchemeRegistry schemeRegistry = new SchemeRegistry();
		Scheme https = new Scheme("https", 443, SSLSocketFactory.getSocketFactory());
		Scheme http = new Scheme("http", 80, PlainSocketFactory.getSocketFactory());
		schemeRegistry.register(https);
		schemeRegistry.register(http);
		
		ThreadSafeClientConnManager connManager = new ThreadSafeClientConnManager(schemeRegistry);				
		connManager.setMaxTotal(params.getIntParameter(ConnManagerPNames.MAX_TOTAL_CONNECTIONS, MAX_TOTAL_CONNECTIONS_VALUE));
		connManager.setDefaultMaxPerRoute(params.getIntParameter(ConnManagerPNames.MAX_CONNECTIONS_PER_ROUTE, MAX_CONNECTIONS_PER_ROUTE_VALUE));
		
		DefaultHttpClient client = new DefaultHttpClient(connManager, params);
		client.setKeepAliveStrategy(new ForcingConnectionPersistentStrategy(
				params.getIntParameter(CONNECTION_KEEP_ALIVE_SECONDS, DEFAULT_KEEP_ALIVE_VALUE)));		
		return client;
	}
	
	private void addHeaders(HttpRequestBase request, Map<String, String> headers) {
		if (headers != null) {
			for (String hdr : headers.keySet()) {
				if (!hdr.equalsIgnoreCase(IntuitHeader.APPSECRET.toString())) {
					request.addHeader(hdr, headers.get(hdr));
				}
			}
		}
	}
	
	private HttpResponse execute(HttpRequestBase request) {
		HttpResponse response = null;
		int attempts = 0;
		boolean retry;
		
		do {
			try {
				retry = false;
				org.apache.http.HttpResponse httpResponse = httpClient.execute(request);
				response = getResponseContent(httpResponse);
				if (response.getStatusCode() == HttpStatusCode.STATUS_504_REQUEST_TIMEOUT) {
					retry = true; // only retry on request timeout
				}
			} catch (Throwable t) {
				throw new RESTClientInvocationException("Unexpected exception occurred", t);
			}
		} while (retry && (++attempts < maxAttempts));
		
		return response;
	}
	
	protected void setRequestBody(HttpPost request, String body, ContentType cType) {
		if (body != null && !body.isEmpty()) {
			StringEntity postBody = new StringEntity(body, cType);
			request.setEntity(postBody);
		} else {
			StringEntity postBody = new StringEntity("", cType);
			request.setEntity(postBody);
		}
	}
	
	protected void setRequestBody(HttpPut request, String body, ContentType cType) {
		if (body != null && !body.isEmpty()) {
			StringEntity putBody = new StringEntity(body, cType);
			request.setEntity(putBody);
		} else {
			StringEntity putBody = new StringEntity("", cType);
			request.setEntity(putBody);
		}
	}
	
	protected ContentType getContentType(String txt) {
		if ("application/json".equalsIgnoreCase(txt)) {
			return ContentType.APPLICATION_JSON;
		} else if ("application/xml".equalsIgnoreCase(txt)) {
			return ContentType.APPLICATION_XML;
		} else {
			throw new NotImplementedException("Unsupported content type - "+txt);
		}
	}
	
	private HttpResponse getResponseContent(org.apache.http.HttpResponse httpResponse) throws IllegalStateException, IOException  {
		HttpResponse response = new HttpResponse();
		response.setReason(httpResponse.getStatusLine().getReasonPhrase());
		response.setStatusCode(httpResponse.getStatusLine().getStatusCode());
		byte[] body = null;
		HttpEntity entity = httpResponse.getEntity();

		// If the response does not enclose an entity, there is no need
		// to worry about connection release
		if (entity != null) {
			InputStream instream = null;
			try {
				instream = entity.getContent();
				body = IOUtils.toByteArray(instream);
			} finally {
				// Closing the input stream will trigger connection release
				IOUtils.closeQuietly(instream);
			}
		}
		response.setBody(body);

		return response;	
	}
}
