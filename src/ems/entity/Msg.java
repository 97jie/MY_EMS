package ems.entity;

import java.util.HashMap;
import java.util.Map;

/**
 * 通用的返回json的数据
 * @author wangjie
 *
 */
public class Msg {
	private int code;
	
	private String message;//提示信息
	private Map<String, Object> extend =new HashMap<>();//用户返回给浏览器的数据
	
	public static Msg success() {
		Msg result = new Msg();
		result.setCode(200);
		result.setMessage("处理成功");
		return result;
	}
	public static Msg fail() {
		Msg result = new Msg();
		result.setCode(100);
		result.setMessage("处理失败");
		return result;
	}
	
	public Msg add(String string,Object object) {
		extend.put(string, object);
		return this;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Map<String, Object> getExtend() {
		return extend;
	}
	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	
	
}
