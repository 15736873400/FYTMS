package fytms.bean;

import java.util.Date;

public class superList {
	private String passportNo;
	private String trName;
	private String travelName;
	private String tickNo;
	private Date tickDate;
	private String shiptimeNo;
	
	private float price;
	private String shipNo;
	
	private String shipName;
	
	private String guide;
    private String trPort;
    
    private String state;

	

	public String getTrPort() {
		return trPort;
	}
	public void setTrPort(String trPort) {
		this.trPort = trPort;
	}
	public String getGuide() {
		return guide;
	}
	public void setGuide(String guide) {
		this.guide = guide;
	}
	private Date startTime;
	private String startPort;
	private Date arrTime;
	private String arrPort;
	private int isGuide;
	public String getPassportNo() {
		return passportNo;
	}
	public void setPassportNo(String passportNo) {
		this.passportNo = passportNo;
	}
	public String getTrName() {
		return trName;
	}
	public void setTrName(String trName) {
		this.trName = trName;
	}
	public String getTravelName() {
		return travelName;
	}
	public void setTravelName(String travelName) {
		this.travelName = travelName;
	}
	public String getTickNo() {
		return tickNo;
	}
	public void setTickNo(String tickNo) {
		this.tickNo = tickNo;
	}
	public Date getTickDate() {
		return tickDate;
	}
	public void setTickDate(Date tickDate) {
		this.tickDate = tickDate;
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
	public int getIsGuide() {
		return isGuide;
	}
	public void setIsGuide(int isGuide) {
		this.isGuide = isGuide;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "superList [passportNo=" + passportNo + ", trName=" + trName + ", travelName=" + travelName + ", tickNo="
				+ tickNo + ", tickDate=" + tickDate + ", shiptimeNo=" + shiptimeNo + ", price=" + price + ", shipNo="
				+ shipNo + ", shipName=" + shipName + ", guide=" + guide + ", trPort=" + trPort + ", state=" + state
				+ ", startTime=" + startTime + ", startPort=" + startPort + ", arrTime=" + arrTime + ", arrPort="
				+ arrPort + ", isGuide=" + isGuide + "]";
	}
	
	

	

	
	
	
	
	
	
	
}
