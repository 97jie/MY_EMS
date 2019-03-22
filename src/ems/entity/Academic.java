package ems.entity;

import java.io.Serializable;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotEmpty;



public class Academic implements Serializable{
	@Override
	public String toString() {
		return "Academic [aca_idx=" + aca_idx + ", aca_name=" + aca_name + ", aca_info=" + aca_info + "]";
	}
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String aca_idx;
	
	@NotEmpty(message="学院名称不能为空！")
	private String aca_name;
	
	@NotEmpty(message="学院信息不能为空！")
	@Length(max=1000,message="学院信息长度不能大于1000！")
	private String aca_info;
	public String getAca_idx() {
		return aca_idx;
	}
	public void setAca_idx(String aca_idx) {
		this.aca_idx = aca_idx;
	}
	public String getAca_name() {
		return aca_name;
	}
	public void setAca_name(String aca_name) {
		this.aca_name = aca_name;
	}
	public String getAca_info() {
		return aca_info;
	}
	public void setAca_info(String aca_info) {
		this.aca_info = aca_info;
	}
}
