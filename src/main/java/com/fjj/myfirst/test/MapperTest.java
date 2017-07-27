package com.fjj.myfirst.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.fjj.myfirst.bean.Department;
import com.fjj.myfirst.bean.Employee;
import com.fjj.myfirst.dao.DepartmentMapper;
import com.fjj.myfirst.dao.EmployeeMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {

	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlSession;
	
	@Test
	public void testCRUD(){
		
		/*
		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
		DepartmentMapper bean = ioc.getBean(DepartmentMapper.class);
		*/
		
		System.out.println(departmentMapper);
		/*
		departmentMapper.insertSelective(new Department(null,"������"));
		departmentMapper.insertSelective(new Department(null,"���Բ�"));
		departmentMapper.insertSelective(new Department(null,"UI��"));
		*/
		System.out.println(employeeMapper);
		
		//employeeMapper.insertSelective(new Employee(null,"fjj","��","328957143@qq.com",1));
		
		EmployeeMapper emapper = sqlSession.getMapper(EmployeeMapper.class);
		for(int i=0;i<100;i++){
			String name = UUID.randomUUID().toString().substring(0,5)+"_"+i;
			emapper.insertSelective(new Employee(null,name,"��",name+"@fjj.com",1));
		}
		
		
	}
	
}
