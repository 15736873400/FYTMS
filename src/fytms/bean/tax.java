package fytms.bean;



public class tax {
private int idt_dic_refundTax;
private float dRefundTax;
public int getIdt_dic_refundTax() {
	return idt_dic_refundTax;
}
public void setIdt_dic_refundTax(int idt_dic_refundTax) {
	this.idt_dic_refundTax = idt_dic_refundTax;
}
public float getdRefundTax() {
	return dRefundTax;
}
public void setdRefundTax(float dRefundTax) {
	this.dRefundTax = dRefundTax;
}
@Override
public String toString() {
	return "tax [idt_dic_refundTax=" + idt_dic_refundTax + ", dRefundTax=" + dRefundTax + "]";
}

}
