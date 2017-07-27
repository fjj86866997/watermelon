package com.fjj.myfirst.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * 
 * ͨ����
 * @author 32895
 *
 */
public class Message {

	
	private	int code;//״̬��
	private String msg;//״̬��Ϣ
	//�û�����
	private Map<String,Object> extend = new HashMap<String,Object>();
	
	public static Message success() {
		Message msg = new Message();
		msg.setCode(100);
		msg.setMsg("���ʳɹ���");
		
		return msg;
		
	}
	
	public static Message fail() {
		Message msg = new Message();
		msg.setCode(200);
		msg.setMsg("����ʧ�ܣ�");
		
		return msg;
		
	}
	
	public Message add(String key,Object value) {
		
		this.getExtend().put(key, value);
		return this;
	}
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Map<String, Object> getExtend() {
		return extend;
	}
	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}
	
}
