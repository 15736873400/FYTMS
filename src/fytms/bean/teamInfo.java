package fytms.bean;

import java.util.Date;

public class teamInfo {
	private Date startDate;
	private Date returnDate;
	private String tickNo;
	private Date tickDate;
	private String passportNo;
	private String trName;
	private String dSex;
	private String dTicketType;
	private String tickTime;
	private int isGuide;
	private String state;
	private float tickCost;
	private float tickRefund;
    private Date checkDate;
    private String fCheckDate;
	private String fDate;
	private String fGuide;
	private String fStartDate;
	private String fReturnDate;
	
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getReturnDate() {
		return returnDate;
	}
	public void setReturnDate(Date returnDate) {
		this.returnDate = returnDate;
	}
	public String getfStartDate() {
		return fStartDate;
	}
	public void setfStartDate(String fStartDate) {
		this.fStartDate = fStartDate;
	}
	public String getfReturnDate() {
		return fReturnDate;
	}
	public void setfReturnDate(String fReturnDate) {
		this.fReturnDate = fReturnDate;
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
	public String getdSex() {
		return dSex;
	}
	public void setdSex(String dSex) {
		this.dSex = dSex;
	}
	public String getdTicketType() {
		return dTicketType;
	}
	public void setdTicketType(String dTicketType) {
		this.dTicketType = dTicketType;
	}
	public String getTickTime() {
		return tickTime;
	}
	public void setTickTime(String tickTime) {
		this.tickTime = tickTime;
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
	public float getTickCost() {
		return tickCost;
	}
	public void setTickCost(float tickCost) {
		this.tickCost = tickCost;
	}
	public float getTickRefund() {
		return tickRefund;
	}
	public void setTickRefund(float tickRefund) {
		this.tickRefund = tickRefund;
	}
	public Date getCheckDate() {
		return checkDate;
	}
	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}
	public String getfCheckDate() {
		return fCheckDate;
	}
	public void setfCheckDate(String fCheckDate) {
		this.fCheckDate = fCheckDate;
	}
	public String getfDate() {
		return fDate;
	}
	public void setfDate(String fDate) {
		this.fDate = fDate;
	}
	public String getfGuide() {
		return fGuide;
	}
	public void setfGuide(String fGuide) {
		this.fGuide = fGuide;
	}
	@Override
	public String toString() {
		return "teamInfo [startDate=" + startDate + ", returnDate=" + returnDate + ", tickNo=" + tickNo + ", tickDate="
				+ tickDate + ", passportNo=" + passportNo + ", trName=" + trName + ", dSex=" + dSex + ", dTicketType="
				+ dTicketType + ", tickTime=" + tickTime + ", isGuide=" + isGuide + ", state=" + state + ", tickCost="
				+ tickCost + ", tickRefund=" + tickRefund + ", checkDate=" + checkDate + ", fCheckDate=" + fCheckDate
				+ ", fDate=" + fDate + ", fGuide=" + fGuide + ", fStartDate=" + fStartDate + ", fReturnDate="
				+ fReturnDate + "]";
	}

	
}
