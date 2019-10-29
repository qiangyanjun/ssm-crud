package com.qiang.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
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
	 * 删除
	 * 批量删除传入id串：1-2-3
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "/emp/{ids}",method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmp(@PathVariable("ids")String ids) {
		if(ids.contains("-")) {
			List<Integer> delIds = new ArrayList<>();
			String[] strIds = ids.split("-");
			for (String string : strIds) {
				delIds.add(Integer.parseInt(string));
			}
			employeeService.deleteBatch(delIds);
		}else {
			employeeService.deleteEmp(Integer.parseInt(ids));
		}
		return Msg.success();
	}
	
	@RequestMapping(value = "/emp/{empId}",method = RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmp(Employee employee) {
		employeeService.updateEmp(employee);
		return Msg.success();
	}
	
	
	/**
	 * 修改时回显，查一个员工
	 */
	@RequestMapping("/emp/{id}")
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id) {
		Employee employee = employeeService.getEmp(id);
		return Msg.success().add("emp", employee);
	}
	
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
	public Msg saveEmp(@Valid Employee employee,BindingResult result) {
		if(result.hasErrors()) {
			Map<String,Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else {
			employeeService.saveEmp(employee);
			return Msg.success();
		}
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
