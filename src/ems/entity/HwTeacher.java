package ems.entity;

public class HwTeacher {

	private Integer ht_idx;
	private Integer bc_idx;
	private String t_no;
	private String ht_path;
	private String ht_name;
	private String ht_pub_time;
	private String ht_over_time;
	private String ht_weight;
	private String ht_bz_info;
	private String ht_zt;
	private String extra_1;
	private String file_name;
	
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getExtra_1() {
		return extra_1;
	}
	public void setExtra_1(String extra_1) {
		this.extra_1 = extra_1;
	}
	public String getHt_zt() {
		return ht_zt;
	}
	public void setHt_zt(String ht_zt) {
		this.ht_zt = ht_zt;
	}
	@Override
	public String toString() {
		return "HwTeacher [ht_idx=" + ht_idx + ", bc_idx=" + bc_idx + ", t_no=" + t_no + ", ht_path=" + ht_path
				+ ", ht_name=" + ht_name + ", ht_pub_time=" + ht_pub_time + ", ht_over_time=" + ht_over_time
				+ ", ht_weight=" + ht_weight + ", ht_bz_info=" + ht_bz_info + "]";
	}
	public Integer getHt_idx() {
		return ht_idx;
	}
	public void setHt_idx(Integer ht_idx) {
		this.ht_idx = ht_idx;
	}
	public Integer getBc_idx() {
		return bc_idx;
	}
	public void setBc_idx(Integer bc_idx) {
		this.bc_idx = bc_idx;
	}
	public String getT_no() {
		return t_no;
	}
	public void setT_no(String t_no) {
		this.t_no = t_no;
	}
	public String getHt_path() {
		return ht_path;
	}
	public void setHt_path(String ht_path) {
		this.ht_path = ht_path;
	}
	public String getHt_name() {
		return ht_name;
	}
	public void setHt_name(String ht_name) {
		this.ht_name = ht_name;
	}
	public String getHt_pub_time() {
		return ht_pub_time;
	}
	public void setHt_pub_time(String ht_pub_time) {
		this.ht_pub_time = ht_pub_time;
	}
	public String getHt_over_time() {
		return ht_over_time;
	}
	public void setHt_over_time(String ht_over_time) {
		this.ht_over_time = ht_over_time;
	}
	public String getHt_weight() {
		return ht_weight;
	}
	public void setHt_weight(String ht_weight) {
		this.ht_weight = ht_weight;
	}
	public String getHt_bz_info() {
		return ht_bz_info;
	}
	public void setHt_bz_info(String ht_bz_info) {
		this.ht_bz_info = ht_bz_info;
	}
}
