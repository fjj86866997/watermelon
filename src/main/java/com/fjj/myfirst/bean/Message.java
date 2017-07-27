package com.fjj.myfirst.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * 
 * 通用类
 * @author 32895
 *
 */
public class Message {

	
	private	int code;//状态码
	private String msg;//状态信息
	//用户数据
	private Map<String,Object> extend = new HashMap<String,Object>();
	
	public static Message success() {
		Message msg = new Message();
		msg.setCode(100);
		msg.setMsg("访问成功！");
		
		return msg;
		
	}
	
	public static Message fail() {
		Message msg = new Message();
		msg.setCode(200);
		msg.setMsg("访问失败！");
		
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
