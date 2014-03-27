package com.springapp.mvc; /**
 *  @author slolakapuri
 *  gets and sets xpath element value in a xml casted to string  
 */

import org.apache.commons.io.IOUtils;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.StringWriter;

public class XmlXPathUtils  {

	public String setXmlValue(InputStream iStream, String expression,
			String value) throws Exception {
		StringWriter sw = null;
		Document doc = DocumentBuilderFactory.newInstance()
				.newDocumentBuilder().parse(iStream);

		XPath xpath = XPathFactory.newInstance().newXPath();
		NodeList nodes = (NodeList) xpath.evaluate(expression, doc,
				XPathConstants.NODESET);

		for (int idx = 0; idx < nodes.getLength(); idx++) {
			nodes.item(idx).setTextContent(value);
		}

		TransformerFactory tf = TransformerFactory.newInstance();
		Transformer t = tf.newTransformer();
		DOMSource domSource = new DOMSource(doc);
		sw = new StringWriter();
		StreamResult result = new StreamResult(sw);
		t.transform(domSource, result);
		return sw.toString();
	}
	
	public String setXmlValue(String xmlString ,String expression,
			String value) throws Exception {
		return setXmlValue(IOUtils.toInputStream(xmlString), expression, value);
	}
	
	public String getXmlValue(String xmlString, String expression)
			throws Exception {

		InputStream iStream = new ByteArrayInputStream(xmlString.getBytes());
		Document doc = DocumentBuilderFactory.newInstance()
				.newDocumentBuilder().parse(iStream);

		XPath xpath = XPathFactory.newInstance().newXPath();
		NodeList nodes = (NodeList) xpath.evaluate(expression, doc,
				XPathConstants.NODESET);
		return nodes.item(0).getTextContent();

	}

}