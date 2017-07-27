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
	 * ��ѯԱ������
	 * @return
	 */
		//���е�Ա����Ϣ
	@RequestMapping("/emps")
	@ResponseBody
	public Message getEmpsWithJSON(@RequestParam(value="pn",defaultValue="1") Integer pn,Model model){
		
		//System.out.println(pn);
		PageHelper.startPage(pn, 5);//5-->����ҳ����5���û�����
		List<Employee> emps =employeeService.getAll();
		PageInfo page = new PageInfo(emps,5);//5-->ҳ��
		model.addAttribute("pageInfo", page);
		
		return Message.success().add("pageInfo",page);
		
	}
		//������Ա����Ϣ
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Message getEmp(@PathVariable("id")Integer id){
		Employee employee = employeeService.getEmp(id);
		
		return Message.success().add("emp", employee);
	}
	
	/**
	 * Ա������
	 */
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	@ResponseBody
	public Message updateEmp(Employee e){
		//System.out.println(e.getEmpId()+"---"+e.getEmpName());
		employeeService.updateEmp(e);
		return Message.success();
	}
	/**
	 * ɾ��Ա��
	 */
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	@ResponseBody
	public Message delEmpById(@PathVariable("ids")String ids) {
		System.out.println("ɾ����id��"+ids);
		Integer i = 0;
		if(ids.contains("-")){
			//ɾ�����
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
			//ɾ������
			i=Integer.parseInt(ids);
			employeeService.delEmpById(i);
		}
		
		
		
		return Message.success();
	}
	
	/**
	 * Ա������
	 */
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Message saveEmp(@Valid Employee employee,BindingResult res) {
		
		if(res.hasErrors()){
			
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = res.getFieldErrors();
			for(FieldError fieldError : errors){
				System.out.println("������ֶ�����"+fieldError.getField());
				System.out.println("������Ϣ:"+fieldError.getDefaultMessage());
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
	 * jsr 303 ��̨У��
	 * ��Ҫpom����hibernate-validator
	 * �����û����Ƿ����
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
				return Message.fail().add("va_msg", "�û��������ã���̨");
			}
		}else{
			return Message.fail().add("va_msg", "�û�������Ϊ6-16λӢ�ĺ����ֻ���2-5λ���ģ���̨");
		}
		
	}
	
	/*
	//@RequestMapping("/emps")
	public String  getEmps(@RequestParam(value="pn",defaultValue="1") Integer pn,Model model) {
		
		//��ҳ
		PageHelper.startPage(pn, 5);//5-->����ҳ����5���û�����
		List<Employee> emps =employeeService.getAll();
		PageInfo page = new PageInfo(emps,5);//5-->ҳ��
		model.addAttribute("pageInfo", page);
		
		return "list";
	}*/
	
}
