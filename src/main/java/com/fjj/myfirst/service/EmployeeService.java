package com.fjj.myfirst.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.filter.HttpPutFormContentFilter;

import com.fjj.myfirst.bean.Employee;
import com.fjj.myfirst.bean.EmployeeExample;
import com.fjj.myfirst.bean.EmployeeExample.Criteria;
import com.fjj.myfirst.dao.EmployeeMapper;

@Service
public class EmployeeService {
	//HttpPutFormContentFilter
	@Autowired
	EmployeeMapper employeeMapper;
	/**
	 * 所有员工
	 */
	public List<Employee> getAll() {
		// TODO Auto-generated method stub
		return employeeMapper.selectByExampleWithDept(null);
	}

	/**
	 * 员工保存
	 */
	public void save(Employee employee) {
		// TODO Auto-generated method stub
		employeeMapper.insertSelective(employee);
	}
	/**
	 * 检验用户名是否可用
	 * 0-->true : 当前姓名可用
	 * @param empName
	 * @return
	 */
	public boolean checkUser(String empName) {
		// TODO Auto-generated method stub
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpNameEqualTo(empName);
		long c = employeeMapper.countByExample(example);
		return c==0;
	}
	/**
	 * 按id找某个员工信息
	 * @param id
	 * @return
	 */
	public Employee getEmp(Integer id) {
		
		Employee e = employeeMapper.selectByPrimaryKey(id);
		return e;
		
	}
	/**
	 * 更新员工
	 * @param e
	 */
	public void updateEmp(Employee e) {
		// TODO Auto-generated method stub
		employeeMapper.updateByPrimaryKeySelective(e);
	}
	//单个删除
	public void delEmpById(Integer id) {
		// TODO Auto-generated method stub
		employeeMapper.deleteByPrimaryKey(id);
	}
	//删除多个
	public void delEmps(List<Integer> ids) {
		// TODO Auto-generated method stub
		EmployeeExample example = new EmployeeExample();
		Criteria criteria = example.createCriteria();
		criteria.andEmpIdIn(ids);
		employeeMapper.deleteByExample(example);
	}

	
	
}
