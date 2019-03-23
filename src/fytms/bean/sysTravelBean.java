package fytms.bean;

import java.util.Arrays;

public class sysTravelBean {

private String legalNo;
private String travelName;
private byte[] travelPassword;
private String legalName;
private String legalPhone;
private float money;
private String legalState;
private Integer page;
private float refund;

public float getRefund() {
	return refund;
}
public void setRefund(float refund) {
	this.refund = refund;
}
public String getLegalNo() {
	return legalNo;
}
public void setLegalNo(String legalNo) {
	this.legalNo = legalNo;
}
public String getTravelName() {
	return travelName;
}
public void setTravelName(String travelName) {
	this.travelName = travelName;
}
public byte[] getTravelPassword() {
	return travelPassword;
}
public void setTravelPassword(byte[] travelPassword) {
	this.travelPassword = travelPassword;
}
public String getLegalName() {
	return legalName;
}
public void setLegalName(String legalName) {
	this.legalName = legalName;
}
public String getLegalPhone() {
	return legalPhone;
}
public void setLegalPhone(String legalPhone) {
	this.legalPhone = legalPhone;
}
public float getMoney() {
	return money;
}
public void setMoney(float money) {
	this.money = money;
}
public String getLegalState() {
	return legalState;
}
public void setLegalState(String legalState) {
	this.legalState = legalState;
}
public Integer getPage() {
	return page;
}
public void setPage(Integer page) {
	this.page = page;
}
@Override
public String toString() {
	return "sysTravelBean [legalNo=" + legalNo + ", travelName=" + travelName + ", travelPassword="
			+ Arrays.toString(travelPassword) + ", legalName=" + legalName + ", legalPhone=" + legalPhone + ", money="
			+ money + ", legalState=" + legalState + ", page=" + page + ", refund=" + refund + "]";
}




}
