package ems.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;

import ems.entity.ClassCourse;
import ems.entity.Msg;
import ems.entity.MyClass;
import ems.entity.Student;
import ems.entity.Teacher;
import ems.service.BanCourseService;
import ems.service.MyClassService;
import ems.service.TeacherService;

@RequestMapping("/banCourse/")
@Controller
public class BanCourseController {

	@Autowired
	BanCourseService banCourseService;
	@Autowired
	TeacherService teacherService;
	@Autowired
	MyClassService myClassService;
	
	@RequestMapping("getAllBsWithJson.do")
	@ResponseBody
	public Msg getAllWithBIdx(@RequestParam(value="pn",defaultValue="1")Integer pn,HttpSession session) {
		PageHelper.startPage(pn, 5);
		Student student = new Gson().fromJson((String) session.getAttribute("stu"), Student.class);
		int b_idx=Integer.parseInt(student.getB_idx());
		
		List<ClassCourse> list1=banCourseService.getAllWithBIdx(b_idx);
		List<Teacher> list2=new ArrayList<Teacher>();
		
		for(ClassCourse classCourse:list1) {
			list2.addAll(teacherService.searchByName(classCourse.getT_no()));
		}
		
		PageInfo< ClassCourse> pageInfo1=new PageInfo<>(list1);
		PageInfo< Teacher> pageInfo2=new PageInfo<>(list2);
		
		return Msg.success().add("pageInfo1", pageInfo1).add("pageInfo2", pageInfo2);
	}
	
	@RequestMapping("getAllBsWithTea.do")
	@ResponseBody
	public Msg getAllBsWithTNo(@RequestParam(value="pn",defaultValue="1")Integer pn,HttpSession session) {
		PageHelper.startPage(pn, 5);
		Teacher teacher=new Gson().fromJson((String) session.getAttribute("tea"), Teacher.class);
		String t_no=teacher.getT_no();
		List<ClassCourse> list1=banCourseService.getAllWithTNo(t_no);
		List<MyClass> list2=new ArrayList<>();
		
		for(ClassCourse classCourse:list1) {
			list2.add(myClassService.getBan(classCourse.getB_idx()));
		}
		
		PageInfo< ClassCourse> pageInfo1=new PageInfo<>(list1);
		PageInfo< MyClass> pageInfo2=new PageInfo<>(list2);
		return Msg.success().add("pageInfo1", pageInfo1).add("pageInfo2", pageInfo2);
	}
	
	@RequestMapping("viewWithBcIdx.do")
	public String viewWithBcIdx(String bc_idx,HttpSession session,Model model) {
		model.addAttribute("bc_idx", bc_idx);
		model.addAttribute("c_name", banCourseService.queryBc(Integer.parseInt(bc_idx)).getC_name());
		
		if(null!=session.getAttribute("tea")) {
			return "teaBsView";
		}
		return "stuBsView";
	}
	
	@RequestMapping("viewBs.do")
	@ResponseBody
	public Msg viewBs(Integer c_idx) {
		List<ClassCourse> list1=banCourseService.queryByCidx(c_idx);
		List<Teacher> list2=new ArrayList<Teacher>();
		List<String> list3=new ArrayList<>();
		
		for(ClassCourse classCourse:list1) {
			list2.addAll(teacherService.searchByName(classCourse.getT_no()));
			MyClass mc=myClassService.getBan(classCourse.getB_idx());
			list3.add(mc.getB_grade()+"级-"+mc.getB_name());
		}
		return Msg.success().add("list3",list3).add("list2", list2).add("list1", list1);
	}
	
	@RequestMapping(value="addBc.do",method=RequestMethod.POST)
	@ResponseBody
	public Msg addBc(@Valid ClassCourse bc,BindingResult result) {//表单自动分装
		if(result.hasErrors()) {
			Map<String, Object> map=new HashMap<>();
			List<FieldError> fieldErrors = result.getFieldErrors();
			for(FieldError error:fieldErrors) {
				map.put(error.getField(),error.getDefaultMessage());
			}
			return Msg.fail().add("error_map", map);
		}else {
			banCourseService.addBc(bc);
			return Msg.success();
		}
	}
	
	@RequestMapping("delBc.do")
	@ResponseBody
	public Msg delBc(String bc_idx){
		banCourseService.delBc(bc_idx);
		return Msg.success();
	}
}
