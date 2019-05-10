package ems.controller;

import java.text.SimpleDateFormat;
import java.util.Comparator;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;

import ems.entity.Msg;
import ems.entity.Student;
import ems.entity.Teacher;
import ems.entity.ZoneTopic;
import ems.service.ZtService;

@Controller
@RequestMapping("/zt/")
public class ZtController {

	@Autowired
	ZtService ztService;
	
	@RequestMapping("savaZt.do")
	@ResponseBody
	public Msg savaZt(@Valid ZoneTopic zt,BindingResult result) {
		if(result.hasErrors()) {
			Map<String, Object> map=new HashMap<>();
			List<FieldError> fieldErrors = result.getFieldErrors();
			for(FieldError error:fieldErrors) {
				map.put(error.getField(),error.getDefaultMessage());
			}
			return Msg.fail().add("error_map", map);
		}else {
			String pub_time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			zt.setZt_pub_time(pub_time);
			zt.setZt_heat(0);
			ztService.savaZt(zt);
			return Msg.success();
		}
		
	}
	
	@RequestMapping("getAllWithJson")
	@ResponseBody
	public Msg getAllWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn,
			@RequestParam(value="sort",defaultValue="1")String sort,
			String bc_idx) {
		PageHelper.startPage(pn, 5);//从pn页开始查询，每页有5条数据
		List<ZoneTopic> list=ztService.getWithBcIdx(bc_idx,sort);
		PageInfo<ZoneTopic> pageInfo=new PageInfo<>(list,5);//使用pageInfo包装查询结果,连续显示5页
		
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping("viewZt.do")
	public String viewZt(String bc_idx,Model model) {
		model.addAttribute("bc_idx", bc_idx);
		return "chatTopic";
	}
	
	@RequestMapping("viewTr.do")
	public String viewTr(Integer zt_idx,Model model,HttpSession session) {
		ZoneTopic zoneTopic=ztService.getWithKey(zt_idx);
		if(session.getAttribute("stu")!=null) {
			Student s=new Gson().fromJson((String)session.getAttribute("stu"), Student.class);
			if(!s.getS_no().equals(zoneTopic.getZt_no())) {
				ztService.updateHeat(zt_idx,1);
			}
		}else {
			Teacher teacher=new Gson().fromJson((String)session.getAttribute("tea"), Teacher.class);
			if(!teacher.getT_no().equals(zoneTopic.getZt_no())) {
				ztService.updateHeat(zt_idx,1);
			}
		}
		model.addAttribute("zt", zoneTopic);
		return "topicReply";
	}
}
