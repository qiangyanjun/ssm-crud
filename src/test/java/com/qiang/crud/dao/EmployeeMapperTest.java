package com.qiang.crud.dao;

import java.util.Random;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.qiang.crud.bean.Employee;
import com.qiang.crud.dao.EmployeeMapper;


public class EmployeeMapperTest extends BaseTest {

	@Autowired
	private SqlSession sqlSessionTemplate;
	
	@Test
	public void testInsertSelective() {
		Random random = new Random();
		EmployeeMapper mapper = sqlSessionTemplate.getMapper(EmployeeMapper.class);
		for (int i = 0; i < 100; i++) {
			String name = UUID.randomUUID().toString().substring(0,5) + i;
			boolean gender = random.nextBoolean();
			int dId = random.nextInt(3) + 1;
			mapper.insertSelective(new Employee(name,gender==true?"M":"F",name+"@126.com",dId));
		}
		System.out.println("完成");
	}

}
