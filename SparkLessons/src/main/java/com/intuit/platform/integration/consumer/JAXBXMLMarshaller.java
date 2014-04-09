package com.intuit.platform.integration.consumer;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

import org.apache.commons.lang.Validate;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.intuit.platform.integration.iface.IMarshaller;

public class JAXBXMLMarshaller implements IMarshaller {

	private static Log sLogger = LogFactory.getLog(JAXBXMLMarshaller.class);
	private static final String DOCTYPE_PROLOG = "<!DOCTYPE";
	private final JAXBContext jaxbContext;

	@Override
	public String getContentType() {
		return "application/xml";
	}
	
	public JAXBXMLMarshaller(String packageName) {
		jaxbContext = createJAXBContext(packageName);
	}

	private JAXBContext createJAXBContext(String namespace) {
		JAXBContext jaxbContext = null;
		try {
			jaxbContext = JAXBContext.newInstance(namespace);
		} catch (JAXBException e) {
			String errMsg = "Error creating JAXB context for " + namespace;
			sLogger.error(errMsg, e);
			throw new RuntimeException(errMsg, e);
		}
		return jaxbContext;
	}

	@Override
	public String marshall(Object object) {
		Validate.notNull(object, "Object can not be null.");
		String xml = null;
		try {
			// JAXB marshaller and unmarshaller instances are not thread safe
			Marshaller marshaller = jaxbContext.createMarshaller();
			marshaller.setProperty(Marshaller.JAXB_ENCODING, "UTF-8");
			ByteArrayOutputStream baos = new ByteArrayOutputStream();
			marshaller.marshal(object, baos);
			xml = baos.toString("UTF-8");
		} catch (Exception e) {
			throw new RuntimeException(
					"Failed to marshall response object to xml", e);
		}
		return xml;
	}

	@Override
	@SuppressWarnings("unchecked")
	public <T> T unmarshall(byte[] xml, Class<T> expectedType) {
		Validate.notNull(xml, "xml can not be null.");
		Validate.notNull(expectedType, "expectedType can not be null.");
		// reject DOCTYPE
		if (new String(xml).contains(DOCTYPE_PROLOG)) {
			throw new RuntimeException(DOCTYPE_PROLOG
					+ " declaration not accepted");
		}

		Object object = null;

		try {
			// JAXB marshaller and unmarshaller instances are not thread safe
			Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();			
			ByteArrayInputStream bais = new ByteArrayInputStream(xml);
			object = unmarshaller.unmarshal(bais);
		} catch (JAXBException e) {
			throw new RuntimeException("Unexpected exception in unmarshall "
					+ expectedType.getName(), e);
		}

		if (object instanceof JAXBElement<?>) {
			object = ((JAXBElement<?>) object).getValue();
		}
		if (object.getClass() == expectedType) {
			return (T) object;
		}
		throw new RuntimeException("Invalid xml for " + expectedType
				+ ", xml is of type " + object.getClass(), null);
	}

}
