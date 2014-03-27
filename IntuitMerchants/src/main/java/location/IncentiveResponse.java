package location;


import java.util.ArrayList;

import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;

@XmlRootElement
@XmlType(name = "incentiveResponse", propOrder = {"coupons"})
public class IncentiveResponse  {
   
	private ArrayList<CouponInfo> coupons;
	public ArrayList<CouponInfo> getCoupons() {
		return coupons;
	}
	public void setCoupons(ArrayList<CouponInfo> coupons) {
		this.coupons = coupons;
	}
	
}