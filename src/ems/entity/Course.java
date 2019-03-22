package ems.entity;

import org.hibernate.validator.constraints.NotEmpty;

public class Course {

	private Integer c_idx;
	@NotEmpty(message="课程名称不能为空！")
	private String c_name;
	@NotEmpty(message="课程基本信息不能为空！")
	private String c_info;
	private Integer aca_idx;
	private String aca_name;
	
	public String getAca_name() {
		return aca_name;
	}
	public void setAca_name(String aca_name) {
		this.aca_name = aca_name;
	}
	public Integer getC_idx() {
		return c_idx;
	}
	public void setC_idx(Integer c_idx) {
		this.c_idx = c_idx;
	}
	@Override
	public String toString() {
		return "Course [c_idx=" + c_idx + ", c_name=" + c_name + ", c_info=" + c_info + ", aca_idx=" + aca_idx + "]";
	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	public String getC_info() {
		return c_info;
	}
	public void setC_info(String c_info) {
		this.c_info = c_info;
	}
	public Integer getAca_idx() {
		return aca_idx;
	}
	public void setAca_idx(Integer aca_idx) {
		this.aca_idx = aca_idx;
	}
}
