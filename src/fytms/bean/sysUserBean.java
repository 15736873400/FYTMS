package fytms.bean;


import java.util.Arrays;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;


public class sysUserBean {
private String empNo;
private byte[] empPassword;
private String empName;
private int empSex;
private Date empBirthday;
private String empBir;
private String empMobile;
private String empAddress;
private int empPost;
private int empDept;
private byte[] empPicture;
private String empState;
private String empRole;
private int idt_dic_dept;
private String dDept;
private int idt_dic_post;
private String dPost;
private int idt_dic_sex;
private String dSex;

private MultipartFile file;
private CommonsMultipartFile cfile;
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
public String getEmpName() {
	return empName;
}
public void setEmpName(String empName) {
	this.empName = empName;
}
public int getEmpSex() {
	return empSex;
}
public void setEmpSex(int empSex) {
	this.empSex = empSex;
}
public Date getEmpBirthday() {
	return empBirthday;
}
public void setEmpBirthday(Date empBirthday) {
	this.empBirthday = empBirthday;
}
public String getEmpBir() {
	return empBir;
}
public void setEmpBir(String empBir) {
	this.empBir = empBir;
}
public String getEmpMobile() {
	return empMobile;
}
public void setEmpMobile(String empMobile) {
	this.empMobile = empMobile;
}
public String getEmpAddress() {
	return empAddress;
}
public void setEmpAddress(String empAddress) {
	this.empAddress = empAddress;
}
public int getEmpPost() {
	return empPost;
}
public void setEmpPost(int empPost) {
	this.empPost = empPost;
}
public int getEmpDept() {
	return empDept;
}
public void setEmpDept(int empDept) {
	this.empDept = empDept;
}
public byte[] getEmpPicture() {
	return empPicture;
}
public void setEmpPicture(byte[] empPicture) {
	this.empPicture = empPicture;
}
public String getEmpState() {
	return empState;
}
public void setEmpState(String empState) {
	this.empState = empState;
}
public String getEmpRole() {
	return empRole;
}
public void setEmpRole(String empRole) {
	this.empRole = empRole;
}
public int getIdt_dic_dept() {
	return idt_dic_dept;
}
public void setIdt_dic_dept(int idt_dic_dept) {
	this.idt_dic_dept = idt_dic_dept;
}
public String getdDept() {
	return dDept;
}
public void setdDept(String dDept) {
	this.dDept = dDept;
}
public int getIdt_dic_post() {
	return idt_dic_post;
}
public void setIdt_dic_post(int idt_dic_post) {
	this.idt_dic_post = idt_dic_post;
}
public String getdPost() {
	return dPost;
}
public void setdPost(String dPost) {
	this.dPost = dPost;
}
public int getIdt_dic_sex() {
	return idt_dic_sex;
}
public void setIdt_dic_sex(int idt_dic_sex) {
	this.idt_dic_sex = idt_dic_sex;
}
public String getdSex() {
	return dSex;
}
public void setdSex(String dSex) {
	this.dSex = dSex;
}
public MultipartFile getFile() {
	return file;
}
public void setFile(MultipartFile file) {
	this.file = file;
}
public CommonsMultipartFile getCfile() {
	return cfile;
}
public void setCfile(CommonsMultipartFile cfile) {
	this.cfile = cfile;
}
@Override
public String toString() {
	return "sysUserBean [empNo=" + empNo + ", empPassword=" + Arrays.toString(empPassword) + ", empName=" + empName
			+ ", empSex=" + empSex + ", empBirthday=" + empBirthday + ", empBir=" + empBir + ", empMobile=" + empMobile
			+ ", empAddress=" + empAddress + ", empPost=" + empPost + ", empDept=" + empDept + ", empPicture="
			+ Arrays.toString(empPicture) + ", empState=" + empState + ", empRole=" + empRole + ", idt_dic_dept="
			+ idt_dic_dept + ", dDept=" + dDept + ", idt_dic_post=" + idt_dic_post + ", dPost=" + dPost
			+ ", idt_dic_sex=" + idt_dic_sex + ", dSex=" + dSex + ", file=" + file + ", cfile=" + cfile + "]";
}




}
