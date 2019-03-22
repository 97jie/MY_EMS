package ems.entity;

public class ClassCourse {

	private Integer bc_idx;
	private Integer c_idx;
	private Integer b_idx;
	private String t_no;
	private Integer z_idx;
	
	private String c_name;
//	private String ext_stu_nos;
	
	
	@Override
	public String toString() {
		return "ClassCourse [bc_idx=" + bc_idx + ", c_idx=" + c_idx + ", b_idx=" + b_idx + ", t_no=" + t_no + ", z_idx="
				+ z_idx + "]";
	}
	public Integer getBc_idx() {
		return bc_idx;
	}
	public void setBc_idx(Integer bc_idx) {
		this.bc_idx = bc_idx;
	}
	public Integer getC_idx() {
		return c_idx;
	}
	public void setC_idx(Integer c_idx) {
		this.c_idx = c_idx;
	}
	public Integer getB_idx() {
		return b_idx;
	}
	public void setB_idx(Integer b_idx) {
		this.b_idx = b_idx;
	}
	public String getT_no() {
		return t_no;
	}
	public void setT_no(String t_no) {
		this.t_no = t_no;
	}
	public Integer getZ_idx() {
		return z_idx;
	}
	public void setZ_idx(Integer z_idx) {
		this.z_idx = z_idx;
	}
//	public String getExt_stu_nos() {
//		return ext_stu_nos;
//	}
//	public void setExt_stu_nos(String ext_stu_nos) {
//		this.ext_stu_nos = ext_stu_nos;
//	}
	public String getC_name() {
		return c_name;
	}
	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	
}
