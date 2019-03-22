package ems.entity;

import java.util.HashMap;
import java.util.Map;

/**
 * ͨ�õķ���json������
 * @author wangjie
 *
 */
public class Msg {
	private int code;
	
	private String message;//��ʾ��Ϣ
	private Map<String, Object> extend =new HashMap<>();//�û����ظ������������
	
	public static Msg success() {
		Msg result = new Msg();
		result.setCode(200);
		result.setMessage("����ɹ�");
		return result;
	}
	public static Msg fail() {
		Msg result = new Msg();
		result.setCode(100);
		result.setMessage("����ʧ��");
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
