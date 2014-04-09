package com.intuit.platform.integration.consumer;

import com.google.gson.Gson;
import com.intuit.platform.integration.iface.IMarshaller;

public class GSONMarshaller implements IMarshaller {

	private static final Gson gsonObj = new Gson();

	@Override
	public String marshall(Object object) {
		return gsonObj.toJson(object);
	}

	@Override
	public <T> T unmarshall(byte[] xml, Class<T> expectedType) {
		return gsonObj.fromJson(new String(xml), expectedType);
	}

	@Override
	public String getContentType() {
		return "application/json";
	}
}
