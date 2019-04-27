package ems.entity;

public class StudentScore {
	private String s_no;
	private String s_name;
	private double min_score;
	private double max_score;
	private int commit_num;
	private double s_score;
	public String getS_no() {
		return s_no;
	}
	public void setS_no(String s_no) {
		this.s_no = s_no;
	}
	public String getS_name() {
		return s_name;
	}
	public void setS_name(String s_name) {
		this.s_name = s_name;
	}
	public double getMin_score() {
		return min_score;
	}
	public void setMin_score(double min_score) {
		this.min_score = min_score;
	}
	public double getMax_score() {
		return max_score;
	}
	public void setMax_score(double max_score) {
		this.max_score = max_score;
	}
	public int getCommit_num() {
		return commit_num;
	}
	public void setCommit_num(int commit_num) {
		this.commit_num = commit_num;
	}
	public double getS_score() {
		return s_score;
	}
	public void setS_score(double s_score) {
		this.s_score = s_score;
	}
}
