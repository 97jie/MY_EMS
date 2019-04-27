package ems.entity;

import org.hibernate.validator.constraints.Length;

public class ZoneTopic {

	private int zt_idx;
	private int zt_heat;
	private int bc_idx;
	private String zt_no;
	private String zt_name;
	@Length(min=1,max=1000,message="内容不为空且小于1000个字符！")
	private String zt_content;
	private String zt_pub_time;
	public int getZt_idx() {
		return zt_idx;
	}
	public void setZt_idx(int zt_idx) {
		this.zt_idx = zt_idx;
	}
	@Override
	public String toString() {
		return "ZoneTopic [zt_idx=" + zt_idx + ", zt_heat=" + zt_heat + ", bc_idx=" + bc_idx + ", zt_no=" + zt_no
				+ ", zt_name=" + zt_name + ", zt_content=" + zt_content + ", zt_pub_time=" + zt_pub_time + "]";
	}
	public int getZt_heat() {
		return zt_heat;
	}
	public void setZt_heat(int zt_heat) {
		this.zt_heat = zt_heat;
	}
	public String getZt_no() {
		return zt_no;
	}
	public void setZt_no(String zt_no) {
		this.zt_no = zt_no;
	}
	public String getZt_content() {
		return zt_content;
	}
	public void setZt_content(String zt_content) {
		this.zt_content = zt_content;
	}
	public String getZt_pub_time() {
		return zt_pub_time;
	}
	public void setZt_pub_time(String zt_pub_time) {
		this.zt_pub_time = zt_pub_time;
	}
	public String getZt_name() {
		return zt_name;
	}
	public void setZt_name(String zt_name) {
		this.zt_name = zt_name;
	}
	public int getBc_idx() {
		return bc_idx;
	}
	public void setBc_idx(int bc_idx) {
		this.bc_idx = bc_idx;
	}
	
}
