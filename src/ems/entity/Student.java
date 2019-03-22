package ems.entity;

import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;

public class Student {

	@NotEmpty(message="学号不能为空！")
	private String s_no;
	@NotEmpty(message="密码不能为空！")
	private String s_pwd;
	@NotEmpty(message="学生姓名不能为空！")
	private String s_name;
	private char s_gender;
	@Length(max=18,min=16,message="身份证号长度为16-18位")
	private String s_id_card;
	@Pattern(regexp="^[1](([3|5|8|7][\\d])|([4][5,6,7,8,9])|([6][5,6])|([7][3,4,5,6,7,8])|([9][8,9]))[\\d]{8}$",
			message="手机号码格式不正确！")
	private String s_phone_num;
	@NotEmpty(message="邮箱不能为空！")
	@Email(message="邮箱格式不正确！")
	private String s_email;
	
	private String b_idx;
	private String b_name;
	
	public Student(String b_idx) {
		super();
		this.b_idx = b_idx;
	}
	public Student() {
		super();
	}
	private String s_birth;
	
	private String aca_idx;
	private String aca_name;
	
	
	private String s_grade;
	
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getS_pwd() {
		return s_pwd;
	}
	public void setS_pwd(String s_pwd) {
		this.s_pwd = s_pwd;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public char getS_gender() {
		return s_gender;
	}
	public void setS_gender(char s_gender) {
		this.s_gender = s_gender;
	}
	public String getS_id_card() {
		return s_id_card;
	}
	public void setS_id_card(String s_id_card) {
		this.s_id_card = s_id_card;
	}
	public String getS_phone_num() {
		return s_phone_num;
	}
	public void setS_phone_num(String s_phone_num) {
		this.s_phone_num = s_phone_num;
	}
	public String getS_email() {
		return s_email;
	}
	public void setS_email(String s_email) {
		this.s_email = s_email;
	}
	public String getB_idx() {
		return b_idx;
	}
	public void setB_idx(String b_idx) {
		this.b_idx = b_idx;
	}
	public String getAca_idx() {
		return aca_idx;
	}
	public void setAca_idx(String aca_idx) {
		this.aca_idx = aca_idx;
	}
	public String getS_grade() {
		return s_grade;
	}
	public void setS_grade(String s_grade) {
		this.s_grade = s_grade;
	}
	public String getS_birth() {
		return s_birth;
	}
	public void setS_birth(String s_birth) {
		this.s_birth = s_birth;
	}
	public String getAca_name() {
		return aca_name;
	}
	public void setAca_name(String aca_name) {
		this.aca_name = aca_name;
	}
	@Override
	public String toString() {
		return "Student [s_no=" + s_no + ", s_pwd=" + s_pwd + ", s_name=" + s_name + ", s_gender=" + s_gender
				+ ", s_id_card=" + s_id_card + ", s_phone_num=" + s_phone_num + ", s_email=" + s_email + ", b_idx="
				+ b_idx + ", b_name=" + b_name + ", s_birth=" + s_birth + ", aca_idx=" + aca_idx + ", aca_name="
				+ aca_name + ", s_grade=" + s_grade + "]";
	}
	
	@Override
	public boolean equals(Object obj) {
		Student s=(Student)obj;
		return s_no.equals(s.getS_no())?true:false;
	}
}
