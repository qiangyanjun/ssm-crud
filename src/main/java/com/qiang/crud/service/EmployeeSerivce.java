package com.qiang.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qiang.crud.bean.Employee;
import com.qiang.crud.bean.EmployeeExample;
import com.qiang.crud.bean.EmployeeExample.Criteria;
import com.qiang.crud.dao.EmployeeMapper;

@Service
public class EmployeeSerivce {

	@Autowired
	EmployeeMapper employeeMapper;
	
	public List<Employee> getAll() {
		EmployeeExample example = new EmployeeExample();
		example.setOrderByClause("emp_id asc");
		return employeeMapper.selectByExampleWithDept(example);
	}

	public void saveEmp(Employee employee) {
		employeeMapper.insertSelective(employee);
	}

	/**
	 * 校验用户名可用
	 * @param empName
	 * @return
	 */
	public boolean checkUser(String empName) {
		EmployeeExample example = new EmployeeExample();
		Criteria c = example.createCriteria();
		c.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(example);
		return count == 0;
	}

}
