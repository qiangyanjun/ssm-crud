package com.qiang.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.qiang.crud.bean.Employee;
import com.qiang.crud.bean.Msg;
import com.qiang.crud.service.EmployeeSerivce;

@Controller
public class EmployeeController {
	
	@Autowired
	private EmployeeSerivce employeeService;
	
	/**
	 * 用户名可用性
	 * @param empName
	 * @return
	 */
	@RequestMapping("checkuser")
	@ResponseBody
	public Msg checkUser(String empName) {
		//校验用户名合法性
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(!empName.matches(regx)) {
			return Msg.fail().add("va_msg", "用户名必须是6-16位数字和字母的组合或者2-5位中文");
		}
		
		boolean b = employeeService.checkUser(empName);
		if(b) {
			return Msg.success();
		}else {
			return Msg.fail().add("va_msg", "用户名已被注册");
		}
	}

	/**
	 * 保存
	 * @param employee
	 * @return
	 */
	@RequestMapping(value = "/emp",method = RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(Employee employee) {
		employeeService.saveEmp(employee);
		return Msg.success();
	}
	
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		PageInfo<Employee> page = new PageInfo<>(emps,5);
		return Msg.success().add("pageInfo", page);
	}
	
//	@RequestMapping("/emps")
//	public String getEmps(@RequestParam(value = "pn",defaultValue = "1")Integer pn,Model model) {
//		PageHelper.startPage(pn, 5);
//		List<Employee> emps = employeeService.getAll();
//		PageInfo<Employee> page = new PageInfo<>(emps,5);
//		model.addAttribute("pageInfo",page);
//		return "list";
//	}
}
