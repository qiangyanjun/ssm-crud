package com.qiang.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qiang.crud.bean.Department;
import com.qiang.crud.dao.DepartmentMapper;

@Service
public class DepartmentService {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	
	public List<Department> getDepts(){
		return departmentMapper.selectByExample(null);
	}
}
