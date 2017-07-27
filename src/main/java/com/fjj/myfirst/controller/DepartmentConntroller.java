package com.fjj.myfirst.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fjj.myfirst.bean.Department;
import com.fjj.myfirst.bean.Message;
import com.fjj.myfirst.service.DepartmentService;

@Controller
public class DepartmentConntroller {

	@Autowired
	private DepartmentService departmentService;
	
	
	/**
	 * 返回所有的部门信息
	 */
	@RequestMapping("/depts")
	@ResponseBody
	public Message getDepts(){
		
		List<Department> list = departmentService.getDepts();
		
		return Message.success().add("depts", list);
	}
	
}
