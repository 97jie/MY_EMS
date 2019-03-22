package ems.entity;

public class Admin {

	private String a_no;
	@Override
	public String toString() {
		return "Admin [a_no=" + a_no + ", a_pwd=" + a_pwd + ", a_email=" + a_email + ", a_phone_num=" + a_phone_num
				+ "]";
	}
	private String a_pwd;
	private String a_email;
	private String a_phone_num;
	
	public String getA_no() {
		return a_no;
	}
	public void setA_no(String a_no) {
		this.a_no = a_no;
	}
	public String getA_pwd() {
		return a_pwd;
	}
	public void setA_pwd(String a_pwd) {
		this.a_pwd = a_pwd;
	}
	public String getA_email() {
		return a_email;
	}
	public void setA_email(String a_email) {
		this.a_email = a_email;
	}
	public String getA_phone_num() {
		return a_phone_num;
	}
	public void setA_phone_num(String a_phone_num) {
		this.a_phone_num = a_phone_num;
	}
}
