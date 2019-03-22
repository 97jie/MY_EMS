package ems.entity;

public class MyClass {

	private Integer b_idx;
	private String b_name;
	private String b_grade;
	private int aca_idx;
	private String aca_name;
	
	@Override
	public String toString() {
		return "MyClass [b_idx=" + b_idx + ", b_name=" + b_name + ", b_grade=" + b_grade + ", aca_idx=" + aca_idx
				+ ", aca_name=" + aca_name + "]";
	}
	
	public String getAca_name() {
		return aca_name;
	}
	public void setAca_name(String aca_name) {
		this.aca_name = aca_name;
	}
	public Integer getB_idx() {
		return b_idx;
	}
	public void setB_idx(Integer b_idx) {
		this.b_idx = b_idx;
	}
	public String getB_name() {
		return b_name;
	}
	public void setB_name(String b_name) {
		this.b_name = b_name;
	}
	public String getB_grade() {
		return b_grade;
	}
	public void setB_grade(String b_grade) {
		this.b_grade = b_grade;
	}
	public int getAca_idx() {
		return aca_idx;
	}
	public void setAca_idx(int aca_idx) {
		this.aca_idx = aca_idx;
	}
}
