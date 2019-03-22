package ems.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import ems.entity.Msg;
import ems.entity.MyClass;
import ems.service.MyClassService;

@Controller
@RequestMapping("/myClass/")
public class MyClassController {
	@Autowired
	MyClassService myClassService;
	
	@RequestMapping("getBanJi.do")
	@ResponseBody
	public Msg getBanJi(String aca_idx,String b_grade) {
		int aca=Integer.parseInt(aca_idx);
		List<MyClass> list=myClassService.getBanJi(aca, b_grade);
		return Msg.success().add("data", list);
	}
	
	@RequestMapping("getAllAcasWithJson.do")
	@ResponseBody
	public Msg getAllAcasWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		PageHelper.startPage(pn, 5);//这行要放在最前面
		List<MyClass> list = myClassService.getAll();
		PageInfo<MyClass> pageInfo=new PageInfo<>(list,5);
		
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping("addClass.do")
	@ResponseBody
	public Msg addClass(MyClass myclass) {
		myClassService.addClass(myclass);
		return Msg.success();
	}
	
	@RequestMapping("getClass.do")
	@ResponseBody
	public Msg getBan(String b_idx) {
		int bb_idx=Integer.parseInt(b_idx);
		MyClass myClass=myClassService.getBan(bb_idx);
		return Msg.success().add("b", myClass);
	}
	
	@RequestMapping(value="savaBan.do",method=RequestMethod.POST)
	@ResponseBody
	public Msg savaBan(MyClass myClass) {
		myClassService.savaBan(myClass);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("benchDel.do")
	public Msg deleteAcaByIdx(@RequestParam("b_idxs")String b_idxs) {
		String[] idxs = b_idxs.split("-");
		myClassService.benchDel(idxs);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("search.do")
	public Msg searchByName(String b_name) {
		List<MyClass> list = myClassService.searchByName(b_name);
		PageHelper.startPage(1, 5);
		PageInfo<MyClass> pageInfo=new PageInfo<>(list);
		return Msg.success().add("pageInfo", pageInfo);
	}
}
