package fytms.bean;

import java.util.Arrays;

public class loginBean {
	private int No;
	private String LENo;
	private byte[] LEPassword;
	private String empNo;
	private byte[] empPassword;
	private String legalNo;
	private String travelPassword;
	private String travelName;
	private String empPost;
	public int getNo() {
		return No;
	}
	public void setNo(int no) {
		No = no;
	}
	public String getLENo() {
		return LENo;
	}
	public void setLENo(String lENo) {
		LENo = lENo;
	}
	public byte[] getLEPassword() {
		return LEPassword;
	}
	public void setLEPassword(byte[] lEPassword) {
		LEPassword = lEPassword;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	public byte[] getEmpPassword() {
		return empPassword;
	}
	public void setEmpPassword(byte[] empPassword) {
		this.empPassword = empPassword;
	}
	public String getLegalNo() {
		return legalNo;
	}
	public void setLegalNo(String legalNo) {
		this.legalNo = legalNo;
	}
	public String getTravelPassword() {
		return travelPassword;
	}
	public void setTravelPassword(String travelPassword) {
		this.travelPassword = travelPassword;
	}
	public String getTravelName() {
		return travelName;
	}
	public void setTravelName(String travelName) {
		this.travelName = travelName;
	}
	public String getEmpPost() {
		return empPost;
	}
	public void setEmpPost(String empPost) {
		this.empPost = empPost;
	}
	@Override
	public String toString() {
		return "loginBean [No=" + No + ", LENo=" + LENo + ", LEPassword=" + Arrays.toString(LEPassword) + ", empNo="
				+ empNo + ", empPassword=" + Arrays.toString(empPassword) + ", legalNo=" + legalNo + ", travelPassword="
				+ travelPassword + ", travelName=" + travelName + ", empPost=" + empPost + "]";
	}
	
	
	
	
}
