package ems.entity;

public class HwStudent {

	private Integer hs_idx;
	private Integer ht_idx;
	private String s_no;
	private String hs_name;
	private String hs_path;
	private String hs_up_time;
	private double hs_score;
	private String hs_file_name;
	private double ht_weight;
	
	public String getHs_file_name() {
		return hs_file_name;
	}
	public void setHs_file_name(String hs_file_name) {
		this.hs_file_name = hs_file_name;
	}
	public Integer getHs_idx() {
		return hs_idx;
	}
	public void setHs_idx(Integer hs_idx) {
		this.hs_idx = hs_idx;
	}
	public Integer getHt_idx() {
		return ht_idx;
	}
	public void setHt_idx(Integer ht_idx) {
		this.ht_idx = ht_idx;
	}
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getHs_name() {
		return hs_name;
	}
	public void setHs_name(String hs_name) {
		this.hs_name = hs_name;
	}
	public String getHs_path() {
		return hs_path;
	}
	public void setHs_path(String hs_path) {
		this.hs_path = hs_path;
	}
	public String getHs_up_time() {
		return hs_up_time;
	}
	public void setHs_up_time(String hs_up_time) {
		this.hs_up_time = hs_up_time;
	}
	public Double getHs_score() {
		return hs_score;
	}
	public void setHs_score(Double hs_score) {
		this.hs_score = hs_score;
	}
	@Override
	public String toString() {
		return "HwStudent [hs_idx=" + hs_idx + ", ht_idx=" + ht_idx + ", s_no=" + s_no + ", hs_name=" + hs_name
				+ ", hs_path=" + hs_path + ", hs_up_time=" + hs_up_time + ", hs_score=" + hs_score + "]";
	}
	public double getHt_weight() {
		return ht_weight;
	}
	public void setHt_weight(double ht_weight) {
		this.ht_weight = ht_weight;
	}
	
}
