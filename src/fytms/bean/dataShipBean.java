package fytms.bean;

import java.util.Date;

public class dataShipBean {
private String passportNo;
private String shipNo;
private String shipName;
private String seatNum;
private int shipState;


private String shiptimeNo;
private float price;
private Date startTime;
private String startPort;
private Date arrTime;
private String arrPort;
private int sellTime;
private int shiptimeState;
private int sSeat;

private String dShipstate;
private String dShiptimestate;

private int idt_dic_port;
private String dPort;

private String bigDate;
private String startDate;
private String arrDate;
private String sellDate;

private int idt_dic_shipstate;

public String getPassportNo() {
	return passportNo;
}

public void setPassportNo(String passportNo) {
	this.passportNo = passportNo;
}

public String getShipNo() {
	return shipNo;
}

public void setShipNo(String shipNo) {
	this.shipNo = shipNo;
}

public String getShipName() {
	return shipName;
}

public void setShipName(String shipName) {
	this.shipName = shipName;
}

public String getSeatNum() {
	return seatNum;
}

public void setSeatNum(String seatNum) {
	this.seatNum = seatNum;
}

public int getShipState() {
	return shipState;
}

public void setShipState(int shipState) {
	this.shipState = shipState;
}

public String getShiptimeNo() {
	return shiptimeNo;
}

public void setShiptimeNo(String shiptimeNo) {
	this.shiptimeNo = shiptimeNo;
}

public float getPrice() {
	return price;
}

public void setPrice(float price) {
	this.price = price;
}

public Date getStartTime() {
	return startTime;
}

public void setStartTime(Date startTime) {
	this.startTime = startTime;
}

public String getStartPort() {
	return startPort;
}

public void setStartPort(String startPort) {
	this.startPort = startPort;
}

public Date getArrTime() {
	return arrTime;
}

public void setArrTime(Date arrTime) {
	this.arrTime = arrTime;
}

public String getArrPort() {
	return arrPort;
}

public void setArrPort(String arrPort) {
	this.arrPort = arrPort;
}

public int getSellTime() {
	return sellTime;
}

public void setSellTime(int sellTime) {
	this.sellTime = sellTime;
}

public int getShiptimeState() {
	return shiptimeState;
}

public void setShiptimeState(int shiptimeState) {
	this.shiptimeState = shiptimeState;
}

public int getsSeat() {
	return sSeat;
}

public void setsSeat(int sSeat) {
	this.sSeat = sSeat;
}

public String getdShipstate() {
	return dShipstate;
}

public void setdShipstate(String dShipstate) {
	this.dShipstate = dShipstate;
}

public String getdShiptimestate() {
	return dShiptimestate;
}

public void setdShiptimestate(String dShiptimestate) {
	this.dShiptimestate = dShiptimestate;
}

public int getIdt_dic_port() {
	return idt_dic_port;
}

public void setIdt_dic_port(int idt_dic_port) {
	this.idt_dic_port = idt_dic_port;
}

public String getdPort() {
	return dPort;
}

public void setdPort(String dPort) {
	this.dPort = dPort;
}

public String getBigDate() {
	return bigDate;
}

public void setBigDate(String bigDate) {
	this.bigDate = bigDate;
}

public String getStartDate() {
	return startDate;
}

public void setStartDate(String startDate) {
	this.startDate = startDate;
}

public String getArrDate() {
	return arrDate;
}

public void setArrDate(String arrDate) {
	this.arrDate = arrDate;
}

public String getSellDate() {
	return sellDate;
}

public void setSellDate(String sellDate) {
	this.sellDate = sellDate;
}

public int getIdt_dic_shipstate() {
	return idt_dic_shipstate;
}

public void setIdt_dic_shipstate(int idt_dic_shipstate) {
	this.idt_dic_shipstate = idt_dic_shipstate;
}

@Override
public String toString() {
	return "dataShipBean [passportNo=" + passportNo + ", shipNo=" + shipNo + ", shipName=" + shipName + ", seatNum="
			+ seatNum + ", shipState=" + shipState + ", shiptimeNo=" + shiptimeNo + ", price=" + price + ", startTime="
			+ startTime + ", startPort=" + startPort + ", arrTime=" + arrTime + ", arrPort=" + arrPort + ", sellTime="
			+ sellTime + ", shiptimeState=" + shiptimeState + ", sSeat=" + sSeat + ", dShipstate=" + dShipstate
			+ ", dShiptimestate=" + dShiptimestate + ", idt_dic_port=" + idt_dic_port + ", dPort=" + dPort
			+ ", bigDate=" + bigDate + ", startDate=" + startDate + ", arrDate=" + arrDate + ", sellDate=" + sellDate
			+ ", idt_dic_shipstate=" + idt_dic_shipstate + "]";
}








}
