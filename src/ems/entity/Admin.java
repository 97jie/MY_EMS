package ems.entity;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Admin {

	private String a_no;
	@Override
	public String toString() {
		return "Admin [a_no=" + a_no + ", a_pwd=" + a_pwd + ", a_email=" + a_email + ", a_phone_num=" + a_phone_num
				+ "]";
	}
	@NotEmpty(message="密码不能为空！")
	private String a_pwd;
	@NotEmpty(message="邮箱不能为空！")
	@Email(message="邮箱格式不正确！")
	private String a_email;
	@Pattern(regexp="^[1](([3|5|8|7][\\d])|([4][5,6,7,8,9])|([6][5,6])|([7][3,4,5,6,7,8])|([9][8,9]))[\\d]{8}$",
			message="手机号码格式不正确！")
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
