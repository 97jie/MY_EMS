package ems.entity;

public class TopicReply {

	private Integer tr_idx;
	private Integer zt_idx;
	private Integer tr_like_num;
	private String tr_time;
	private String tr_content;
	private String tr_no;
	public Integer getTr_idx() {
		return tr_idx;
	}
	public void setTr_idx(Integer tr_idx) {
		this.tr_idx = tr_idx;
	}
	public Integer getZt_idx() {
		return zt_idx;
	}
	public void setZt_idx(Integer zt_idx) {
		this.zt_idx = zt_idx;
	}
	public Integer getTr_like_num() {
		return tr_like_num;
	}
	public void setTr_like_num(Integer tr_like_num) {
		this.tr_like_num = tr_like_num;
	}
	public String getTr_time() {
		return tr_time;
	}
	public void setTr_time(String tr_time) {
		this.tr_time = tr_time;
	}
	public String getTr_content() {
		return tr_content;
	}
	public void setTr_content(String tr_content) {
		this.tr_content = tr_content;
	}
	public String getTr_no() {
		return tr_no;
	}
	public void setTr_no(String tr_no) {
		this.tr_no = tr_no;
	}
	@Override
	public String toString() {
		return "TopicReply [tr_idx=" + tr_idx + ", zt_idx=" + zt_idx + ", tr_like_num=" + tr_like_num + ", tr_time="
				+ tr_time + ", tr_content=" + tr_content + ", tr_no=" + tr_no + "]";
	}
	
}
