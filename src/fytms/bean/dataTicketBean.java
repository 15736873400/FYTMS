package fytms.bean;

import java.util.Date;

public class dataTicketBean {
private String tickNo;
private Date tickDate;
private String tickTime;
private String passportNo;
private String tickTravel;
private int isGuide;
private String teamNo;
private String state;
private Date checkDate;
private int tickType;
private String dTicketType;
private int idt_dic_ticketType;
private float dPercent;
private float tickCost;
private float tickRefund;
private String startDate;
private String returnDate;
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
public String getTickTime() {
	return tickTime;
}
public void setTickTime(String tickTime) {
	this.tickTime = tickTime;
}
public String getPassportNo() {
	return passportNo;
}
public void setPassportNo(String passportNo) {
	this.passportNo = passportNo;
}
public String getTickTravel() {
	return tickTravel;
}
public void setTickTravel(String tickTravel) {
	this.tickTravel = tickTravel;
}
public int getIsGuide() {
	return isGuide;
}
public void setIsGuide(int isGuide) {
	this.isGuide = isGuide;
}
public String getTeamNo() {
	return teamNo;
}
public void setTeamNo(String teamNo) {
	this.teamNo = teamNo;
}
public String getState() {
	return state;
}
public void setState(String state) {
	this.state = state;
}
public Date getCheckDate() {
	return checkDate;
}
public void setCheckDate(Date checkDate) {
	this.checkDate = checkDate;
}
public int getTickType() {
	return tickType;
}
public void setTickType(int tickType) {
	this.tickType = tickType;
}
public String getdTicketType() {
	return dTicketType;
}
public void setdTicketType(String dTicketType) {
	this.dTicketType = dTicketType;
}
public int getIdt_dic_ticketType() {
	return idt_dic_ticketType;
}
public void setIdt_dic_ticketType(int idt_dic_ticketType) {
	this.idt_dic_ticketType = idt_dic_ticketType;
}
public float getdPercent() {
	return dPercent;
}
public void setdPercent(float dPercent) {
	this.dPercent = dPercent;
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
public String getStartDate() {
	return startDate;
}
public void setStartDate(String startDate) {
	this.startDate = startDate;
}
public String getReturnDate() {
	return returnDate;
}
public void setReturnDate(String returnDate) {
	this.returnDate = returnDate;
}
@Override
public String toString() {
	return "dataTicketBean [tickNo=" + tickNo + ", tickDate=" + tickDate + ", tickTime=" + tickTime + ", passportNo="
			+ passportNo + ", tickTravel=" + tickTravel + ", isGuide=" + isGuide + ", teamNo=" + teamNo + ", state="
			+ state + ", checkDate=" + checkDate + ", tickType=" + tickType + ", dTicketType=" + dTicketType
			+ ", idt_dic_ticketType=" + idt_dic_ticketType + ", dPercent=" + dPercent + ", tickCost=" + tickCost
			+ ", tickRefund=" + tickRefund + ", startDate=" + startDate + ", returnDate=" + returnDate + "]";
}



}
