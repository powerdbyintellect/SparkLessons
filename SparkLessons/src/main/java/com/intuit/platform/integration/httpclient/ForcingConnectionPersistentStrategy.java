package com.intuit.platform.integration.httpclient;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.HttpResponse;
import org.apache.http.impl.client.DefaultConnectionKeepAliveStrategy;
import org.apache.http.protocol.HttpContext;

/**
 * This class forcing connection persistent on the client side when the server
 * doesn't have any preference on keeping connection alive or the Keep-Alive
 * header is not present in the response.
 */
class ForcingConnectionPersistentStrategy extends
		DefaultConnectionKeepAliveStrategy {
	private static final Log sLogger = LogFactory
			.getLog(ForcingConnectionPersistentStrategy.class);

	private int mDefaultKeepAliveMillis;

	public ForcingConnectionPersistentStrategy(int durationSeconds) {
		this.mDefaultKeepAliveMillis = durationSeconds * 1000;
	}

	/**
	 * Returns the duration of time the connection can be safely kept alive. If
	 * the Keep-Alive header is not present in the response, HttpClient assumes
	 * the connection can be kept alive indefinitely. The server will; however,
	 * very likely close idle connections after a short period of time. If we
	 * don't close the connections on the client side, we end up with a bunch of
	 * stale connections in the pool. So set it to a realistic value to reduce
	 * the number of stale connections we have in the pool.
	 * 
	 * @see org.apache.http.impl.client.DefaultConnectionKeepAliveStrategy#getKeepAliveDuration(org.apache.http.HttpResponse,
	 *      org.apache.http.protocol.HttpContext)
	 */
	@Override
	public long getKeepAliveDuration(HttpResponse response, HttpContext context) {
		// Must be thread-safe
		// The default strategy uses the timeout value in the Keep-Alive header
		// Keep-Alive: timeout=15, max=100
		long keepAliveMilliSeconds = super.getKeepAliveDuration(response,
				context);
		if (keepAliveMilliSeconds <= 0) {
			keepAliveMilliSeconds = mDefaultKeepAliveMillis;
		}
		if (sLogger.isDebugEnabled()) {
			sLogger.debug("Returning keepAliveMilliSeconds="
					+ keepAliveMilliSeconds);
		}
		return keepAliveMilliSeconds;
	}
}
