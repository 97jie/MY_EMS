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
import ems.entity.Teacher;
import ems.service.TeacherService;

@RequestMapping("/teacher/")
@Controller
public class TeacherController {

	@Autowired
	TeacherService teacherService;
	
	@RequestMapping("getAllTeasWithJson.do")
	@ResponseBody
	public Msg getAllAcasWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		PageHelper.startPage(pn, 5);//从pn页开始查询，每页有5条数据
		
		List<Teacher> list = teacherService.getAll();
		PageInfo<Teacher> pageInfo=new PageInfo<>(list,5);//使用pageInfo包装查询结果,连续显示5页
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping(value="addTea.do",method=RequestMethod.POST)
	@ResponseBody
	public Msg addTea(@Valid Teacher teacher,BindingResult result) {
		if(result.hasErrors()) {
			Map<String, Object> map=new HashMap<>();
			List<FieldError> fieldErrors = result.getFieldErrors();
			for(FieldError error:fieldErrors) {
				map.put(error.getField(),error.getDefaultMessage());
			}
			return Msg.fail().add("error_map", map);
		}else {
			teacherService.addTea(teacher);
			return Msg.success();
		}
	}
	
	@ResponseBody
	@RequestMapping("benchDel.do")
	public Msg deleteAcaByIdx(String tea_nos) {
		String[] nos = tea_nos.split("-");
		teacherService.benchDel(nos);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("searchByName.do")
	public Msg searchByName(String t_name) {
		List<Teacher> list = teacherService.searchByName(t_name);
		PageHelper.startPage(1, 5);
		PageInfo<Teacher> pageInfo=new PageInfo<>(list);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping("teaLogin.do")
	@ResponseBody
	public Msg teaLogin(Teacher teacher,HttpSession session) {
		Teacher teacher1 =teacherService.queryTea(teacher);
		if(teacher1!=null) {
			String tea=new Gson().toJson(teacher1, Teacher.class);
			session.setAttribute("tea", tea);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	@RequestMapping("login_out.do")
	public String login_out(HttpSession session) {
		session.invalidate();
		return "index";
	}
}
