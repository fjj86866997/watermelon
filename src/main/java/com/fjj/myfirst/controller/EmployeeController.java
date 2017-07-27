package com.fjj.myfirst.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.filter.HttpPutFormContentFilter;

import com.fjj.myfirst.bean.Employee;
import com.fjj.myfirst.bean.Message;
import com.fjj.myfirst.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	/**
	 * 查询员工数据
	 * @return
	 */
		//所有的员工信息
	@RequestMapping("/emps")
	@ResponseBody
	public Message getEmpsWithJSON(@RequestParam(value="pn",defaultValue="1") Integer pn,Model model){
		
		//System.out.println(pn);
		PageHelper.startPage(pn, 5);//5-->单个页面有5条用户数据
		List<Employee> emps =employeeService.getAll();
		PageInfo page = new PageInfo(emps,5);//5-->页数
		model.addAttribute("pageInfo", page);
		
		return Message.success().add("pageInfo",page);
		
	}
		//单个的员工信息
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Message getEmp(@PathVariable("id")Integer id){
		Employee employee = employeeService.getEmp(id);
		
		return Message.success().add("emp", employee);
	}
	
	/**
	 * 员工更新
	 */
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	@ResponseBody
	public Message updateEmp(Employee e){
		//System.out.println(e.getEmpId()+"---"+e.getEmpName());
		employeeService.updateEmp(e);
		return Message.success();
	}
	/**
	 * 删除员工
	 */
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	@ResponseBody
	public Message delEmpById(@PathVariable("ids")String ids) {
		System.out.println("删除的id："+ids);
		Integer i = 0;
		if(ids.contains("-")){
			//删除多个
			String[] ids_str = ids.split("-");
			List<Integer> list = new ArrayList<>() ;
			for(String id:ids_str){
				list.add(Integer.parseInt(id));
			}
			employeeService.delEmps(list);
			/*
			for(String id:ids_str){
				i = Integer.parseInt(id);
				employeeService.delEmpById(i);
			}*/
		}else{
			//删除单个
			i=Integer.parseInt(ids);
			employeeService.delEmpById(i);
		}
		
		
		
		return Message.success();
	}
	
	/**
	 * 员工保存
	 */
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Message saveEmp(@Valid Employee employee,BindingResult res) {
		
		if(res.hasErrors()){
			
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = res.getFieldErrors();
			for(FieldError fieldError : errors){
				System.out.println("错误的字段名："+fieldError.getField());
				System.out.println("错误信息:"+fieldError.getDefaultMessage());
				System.out.println("----------");
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			
			return Message.fail().add("errorFields", map);
		}else{
			employeeService.save(employee);
			return Message.success();
		}
		
	}
	
	/**
	 * jsr 303 后台校验
	 * 需要pom导入hibernate-validator
	 * 检验用户名是否可用
	 */
	@RequestMapping("/checkUser")
	@ResponseBody
	public Message checkEmpName(@RequestParam(value="empName")String empName){
		
		String r = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(empName.matches(r)){
			boolean b = employeeService.checkUser(empName);
			if(b){
				return Message.success();
			}else{
				return Message.fail().add("va_msg", "用户名不可用！后台");
			}
		}else{
			return Message.fail().add("va_msg", "用户名必须为6-16位英文和数字或者2-5位中文！后台");
		}
		
	}
	
	/*
	//@RequestMapping("/emps")
	public String  getEmps(@RequestParam(value="pn",defaultValue="1") Integer pn,Model model) {
		
		//分页
		PageHelper.startPage(pn, 5);//5-->单个页面有5条用户数据
		List<Employee> emps =employeeService.getAll();
		PageInfo page = new PageInfo(emps,5);//5-->页数
		model.addAttribute("pageInfo", page);
		
		return "list";
	}*/
	
}
