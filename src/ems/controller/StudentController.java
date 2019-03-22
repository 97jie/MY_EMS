package ems.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;

import ems.entity.Msg;
import ems.entity.Student;
import ems.service.StudentService;

@Controller
@RequestMapping("/student/")
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping("stuLogin.do")
	@ResponseBody
	public Msg studentLogin(Student student,HttpSession ssSession) {
		Student student2 = studentService.queryStudent(student);
		if(student2!=null) {
			Gson gson=new Gson();
			String stu=gson.toJson(student2, Student.class);
			ssSession.setAttribute("stu", stu);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	@RequestMapping("getAllStusWithJson.do")
	@ResponseBody
	public Msg getAllStusWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Student> list= studentService.getAllStus();
		PageInfo<Student> pageInfo=new PageInfo<>(list,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping(value="addStu.do",method=RequestMethod.POST)
	@ResponseBody
	public Msg addStu(@Valid Student student,BindingResult result) {
		if(result.hasErrors()) {
			Map<String, Object> map=new HashMap<>();
			List<FieldError> fieldErrors = result.getFieldErrors();
			for(FieldError error:fieldErrors) {
				map.put(error.getField(),error.getDefaultMessage());
			}
			return Msg.fail().add("error_map", map);
		}else {
			studentService.addStu(student);
			return Msg.success();
		}
	}
	
	@ResponseBody
	@RequestMapping("benchDel.do")
	public Msg deleteAcaByIdx(String stu_nos) {
		String[] nos = stu_nos.split("-");
		studentService.benchDel(nos);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("search.do")
	public Msg search(String stu) {
		PageHelper.startPage(1, 5);
		
		List<Student> list = studentService.search(stu);
		PageInfo<Student> pageInfo=new PageInfo<>(list);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@ResponseBody
	@RequestMapping("moSearch.do")
	public Msg moSearch(Student student) {
		PageHelper.startPage(1, 5);

		List<Student> list = studentService.moSearch(student);
		PageInfo<Student> pageInfo=new PageInfo<>(list);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping("login_out.do")
	public String login_out(HttpSession session) {
		session.invalidate();
		return "index";
	}
}
