package com.qiang.crud.dao;

import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.qiang.crud.bean.Department;
import com.qiang.crud.dao.DepartmentMapper;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class DepartmentMapperTest {

	@Autowired
	private DepartmentMapper departmentMapper;
	
	/**
	 * 插入部门数据
	 */
	@Test
	public void testInsertSelective() {
		Department department = new Department("测试部");
		int result = departmentMapper.insertSelective(department);
		assertThat(result, is(1));
	}

}
