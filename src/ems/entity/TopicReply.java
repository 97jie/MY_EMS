package ems.entity;

import org.hibernate.validator.constraints.Length;

public class TopicReply {

	private Integer tr_idx;
	private Integer zt_idx;
	private Integer tr_like_num;
	private String tr_time;
	@Length(min=1,max=1000,message="内容不为空且小于1000个字符！")
	private String tr_content;
	private String tr_no;
	private String tr_name;
	private Integer zt_no;
	private String flag;//是否被点赞标志，“1”代表点赞，“2”代表为点赞
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
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getTr_name() {
		return tr_name;
	}
	public void setTr_name(String tr_name) {
		this.tr_name = tr_name;
	}
	public Integer getZt_no() {
		return zt_no;
	}
	public void setZt_no(Integer zt_no) {
		this.zt_no = zt_no;
	}
	
}
