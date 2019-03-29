package ems.controller;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.sun.javafx.collections.MappingChange.Map;

import ems.entity.ClassCourse;
import ems.entity.Common;
import ems.entity.ExcelView;
import ems.entity.HwStudent;
import ems.entity.HwTeacher;
import ems.entity.Msg;
import ems.entity.MyClass;
import ems.entity.Student;
import ems.entity.StudentScore;
import ems.service.BanCourseService;
import ems.service.HsService;
import ems.service.HtService;
import ems.service.MyClassService;
import ems.service.StudentService;

@Controller
@RequestMapping("/hs/")
public class HSController {
	
	@Autowired
	HtService htService;
	@Autowired
	HsService hsService;
	@Autowired
	StudentService studentService;
	@Autowired
	BanCourseService banCourseService;
	@Autowired
	MyClassService myClassService;
	
	@RequestMapping("pubHs")
	@ResponseBody
	public Msg pubHs(HwStudent hwStudent,HttpSession session,MultipartFile file) {
		String path="";
		if(!file.isEmpty()) {
			String fileName=file.getOriginalFilename();
			path=session.getServletContext().getRealPath("/")+"teacher_folder/"+
					new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+"_"+fileName;
			try {
				file.transferTo(new File(path));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			hwStudent.setHs_path(path);
			hwStudent.setHs_file_name(fileName);
		}
		DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		String pub_date=dateFormat.format(new Date());
		hwStudent.setHs_up_time(pub_date);
		hsService.pubHs(hwStudent);
		
		return Msg.success();
	}
	
	@RequestMapping("getAllWithJson.do")
	@ResponseBody
	public Msg getAllWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn,Integer bc_idx,HttpSession session) {
		PageHelper.startPage(pn, 5);//从pn页开始查询，每页有5条数据
		List<HwTeacher> list=htService.getAllHt(bc_idx);
		String s_no=new Gson().fromJson((String) session.getAttribute("stu"), Student.class).getS_no();
		for(HwTeacher hwTeacher:list) {
			Integer ht_idx=hwTeacher.getHt_idx();
			HwStudent hwStudent=hsService.queryByhtIdx(ht_idx,s_no).size()==0?
					null:hsService.queryByhtIdx(ht_idx,s_no).get(0);
			if(null==hwStudent) {
				hwTeacher.setExtra_1("未提交");
			}else {
				if(hwStudent.getHs_score()!=null) {
					hwTeacher.setExtra_1(hwStudent.getHs_score()+"");
				}else {
					hwTeacher.setExtra_1("未打分");
				}
			}
		}
		PageInfo<HwTeacher> pageInfo=new PageInfo<>(list,5);//使用pageInfo包装查询结果,连续显示5页
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping("getHssWithJson.do")
	@ResponseBody
	public Msg getAllWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn,Integer ht_idx) {
		PageHelper.startPage(pn, 5);//从pn页开始查询，每页有5条数据
		List<HwStudent> list=hsService.queryByhtIdx(ht_idx, null);
		List<Student> list2=new ArrayList<>();
		for(HwStudent hwStudent:list) {
			list2.addAll(studentService.search(hwStudent.getS_no()));
		}
		PageInfo<HwStudent> pageInfo=new PageInfo<>(list,5);
		PageInfo<Student> pageInfo2=new PageInfo<>(list2,5);
		
		//得到所有未交作业学生名单并传回前台页面
		Integer bc_idx=htService.queryByIdx(ht_idx).getBc_idx();
		Integer b_idx=banCourseService.queryBc(bc_idx).getB_idx();
		List<Student> list3=studentService.moSearch(new Student(b_idx+""));//所有修读本课程的学生
		list3.removeAll(list2);
		
		return Msg.success().add("pageInfo", pageInfo).add("pageInfo2", pageInfo2).add("list3", list3);
	}
	
	@RequestMapping("updateScore.do")
	public void updateScore(Integer hs_idx,Integer hs_score) {
		hsService.updateScore(hs_idx,hs_score);
	}
	
	@RequestMapping("searchStu.do")
	@ResponseBody
	public Msg searchStu(Integer ht_idx,String s_no) {
		PageHelper.startPage(1, 5);//从pn页开始查询，每页有5条数据
		if("".equals(s_no)) {
			s_no=null;
		}
		List<HwStudent> list=hsService.queryByhtIdx(ht_idx, s_no);
		List<Student> list2=new ArrayList<>();
		if(list!=null&&list.size()!=0) {
			for(HwStudent hwStudent:list) {
				list2.addAll(studentService.search(hwStudent.getS_no()));
			}
		}
		PageInfo<HwStudent> pageInfo=new PageInfo<>(list,5);
		PageInfo<Student> pageInfo2=new PageInfo<>(list2,5);
		return Msg.success().add("pageInfo", pageInfo).add("pageInfo2", pageInfo2);
	}
	
	@RequestMapping("calStuScore.do")
	@ResponseBody
	public Msg calStuScore(Integer bc_idx,HttpSession httpSession) {
		ClassCourse classCourse = banCourseService.queryBc(bc_idx);
		MyClass ban = myClassService.getBan(classCourse.getB_idx());
		List<Student> stus = studentService.moSearch(new Student(ban.getB_idx()+""));//得到所有选修该课程的学生
		List<StudentScore> stuScores=new ArrayList<>();
		List<HwTeacher> hwTeachers=htService.getAllHt(bc_idx);
		double total_weight=Common.calTotalWeight(hwTeachers);
		for(Student stu:stus) {
			StudentScore studentScore=new StudentScore();
			studentScore.setS_no(stu.getS_no());
			studentScore.setS_name(stu.getS_name());
			List<HwStudent> hwStudents=hsService.calStuScore(bc_idx,stu.getS_no());
			for(HwStudent hwStudent:hwStudents) {
				hwStudent.setHt_weight(htService.queryByIdx(hwStudent.getHt_idx()).getHt_weight());
			}
			if(hwStudents.size()>0) {
				Common.calStuScore(hwStudents,studentScore,total_weight);
			}
			stuScores.add(studentScore);
		}
		httpSession.setAttribute("stuScores", stuScores);
		return Msg.success().add("stuScores", stuScores);
	}
	
	@RequestMapping("downloadScore.do")
	public ModelAndView downloadScore(HttpSession session) {
		HashMap<String, Object> map=new HashMap<>();
		map.put("studentScores", (List<StudentScore>) session.getAttribute("stuScores"));
		map.put("name", "学生作业分数表");
		ExcelView view=new ExcelView();
		return new ModelAndView(view, map);
	}
}
