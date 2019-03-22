package ems.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import ems.entity.Academic;
import ems.entity.Course;
import ems.entity.Msg;
import ems.service.CourseService;

@Controller
@RequestMapping("/course/")
public class CourseController {
	
	@Autowired
	CourseService courseService;
	
	@RequestMapping("getAllWithJson.do")
	@ResponseBody
	public Msg getAllWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		PageHelper.startPage(pn, 5);
		List<Course> list=courseService.getAll();
		PageInfo< Course> pageInfo=new PageInfo<>(list, 5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping("addCourse")
	@ResponseBody
	public Msg addCourse(@Valid Course course,BindingResult result) {
		if(result.hasErrors()) {
			Map<String, Object> map=new HashMap<>(); 
			for(FieldError error:result.getFieldErrors()) {
				map.put(error.getField(), error.getDefaultMessage());
			}
			return Msg.fail().add("error_map", map);
		}else {
			courseService.addCourse(course);
			return Msg.success();
		}
	}
	
	@ResponseBody
	@RequestMapping("benchDel.do")
	public Msg deleteAcaByIdx(@RequestParam("c_idxs")String c_idxs) {
		String[] idxs = c_idxs.split("-");
		courseService.benchDel(idxs);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("search.do")
	public Msg searchByName(String c) {
		PageHelper.startPage(1, 5);

		List<Course> list = courseService.search(c);
		System.out.println(list);
		PageInfo<Course> pageInfo=new PageInfo<>(list,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
}
