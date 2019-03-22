package ems.entity;

public class ZoneTopic {

	private int zt_idx;
	private int z_idx;
	private int zt_heat;
	private String zt_no;
	private String zt_content;
	private String zt_pub_time;
	@Override
	public String toString() {
		return "ZoneTopic [zt_idx=" + zt_idx + ", z_idx=" + z_idx + ", zt_heat=" + zt_heat + ", zt_no=" + zt_no
				+ ", zt_content=" + zt_content + ", zt_pub_time=" + zt_pub_time + "]";
	}
	public int getZt_idx() {
		return zt_idx;
	}
	public void setZt_idx(int zt_idx) {
		this.zt_idx = zt_idx;
	}
	public int getZ_idx() {
		return z_idx;
	}
	public void setZ_idx(int z_idx) {
		this.z_idx = z_idx;
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
	
}
