package ems.entity;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

public class Teacher {

	@Override
	public String toString() {
		return "Teacher [t_no=" + t_no + ", t_pwd=" + t_pwd + ", t_name=" + t_name + ", t_email=" + t_email
				+ ", t_office=" + t_office + ", t_info=" + t_info + ", t_gender=" + t_gender + ", aca_idx=" + aca_idx
				+ ", aca_name=" + aca_name + "]";
	}
	
	@NotEmpty(message="教师工号不能为空！")
	private String t_no;
	@NotEmpty(message="教师密码不能为空！")
	private String t_pwd;
	@NotEmpty(message="教师姓名不能为空！")
	private String t_name;
	@NotEmpty(message="教师邮箱不能为空！")
	@Email(message="邮箱格式不正确！")
	private String t_email;
	@NotEmpty(message="不能为空！")
	private String t_office;
	@NotEmpty(message="教师信息不能为空！")
	private String t_info;
	private String t_gender;
	private Integer aca_idx;
	private String aca_name;
	
	public String getAca_name() {
		return aca_name;
	}
	public void setAca_name(String aca_name) {
		this.aca_name = aca_name;
	}
	public String getT_no() {
		return t_no;
	}
	public void setT_no(String t_no) {
		this.t_no = t_no;
	}
	public String getT_pwd() {
		return t_pwd;
	}
	public void setT_pwd(String t_pwd) {
		this.t_pwd = t_pwd;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	public String getT_email() {
		return t_email;
	}
	public void setT_email(String t_email) {
		this.t_email = t_email;
	}
	public String getT_office() {
		return t_office;
	}
	public void setT_office(String t_office) {
		this.t_office = t_office;
	}
	public String getT_info() {
		return t_info;
	}
	public void setT_info(String t_info) {
		this.t_info = t_info;
	}
	
	public String getT_gender() {
		return t_gender;
	}
	public void setT_gender(String t_gender) {
		this.t_gender = t_gender;
	}
	public Integer getAca_idx() {
		return aca_idx;
	}
	public void setAca_idx(Integer aca_idx) {
		this.aca_idx = aca_idx;
	}
	
}
