package com.intuit.platform.integration.consumer;

import java.io.ByteArrayInputStream;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.DeserializationConfig.Feature;

import com.intuit.platform.integration.iface.IMarshaller;

public class JSONMarshaller implements IMarshaller 
{
	private static final ObjectMapper objMapper;
	static {
		objMapper = new ObjectMapper();
		objMapper.configure(Feature.FAIL_ON_UNKNOWN_PROPERTIES, false);
	}
	
	@Override
	public String marshall(Object object) {
		
		String jsonRep = null;
		try {
			jsonRep = objMapper.writeValueAsString(object);
		} catch (Throwable t) {
			throw new RuntimeException("Unexpected exception in JSONMarshaller.marshall()", t);
		}
	
		return jsonRep;
	}

	@Override
	public <T> T unmarshall(byte[] xml, Class<T> expectedType) {
		
		T obj = null;
		try {
			obj = objMapper.readValue(new ByteArrayInputStream(xml), expectedType);
		} catch (Throwable t) {
			throw new RuntimeException("Unexpected exception in JSONMarshaller.marshall()", t);
		}
		
		return obj;
	}

	@Override
	public String getContentType() {
		return "application/json";
	}
}
