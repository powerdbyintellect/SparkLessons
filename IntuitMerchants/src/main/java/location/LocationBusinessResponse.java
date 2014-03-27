package location;


import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
import java.util.ArrayList;

@XmlRootElement
@XmlType(name = "locationBusinessResponse", propOrder = {"businesses"})
public class LocationBusinessResponse {
   
	/**
	 * 
	 */
	private static final long serialVersionUID = -4898686724053949811L;
	private ArrayList<LocationBusinessInfo> businesses;
	public ArrayList<LocationBusinessInfo> getBusinesses() {
		return businesses;
	}
	public void setBusinesses(ArrayList<LocationBusinessInfo> businesses) {
		this.businesses = businesses;
	}
}