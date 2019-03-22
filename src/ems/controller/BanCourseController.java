package ems.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
