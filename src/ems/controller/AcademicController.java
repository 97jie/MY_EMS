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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import ems.entity.Academic;
import ems.entity.Msg;
import ems.service.AcademicService;

@Controller
@RequestMapping("/Aca/")
public class AcademicController {
	@Autowired
	private AcademicService academicService;
	
	
	@RequestMapping("getAllAcasWithJson.do")
	@ResponseBody
	public Msg getAllAcasWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn) {
		PageHelper.startPage(pn, 5);//从pn页开始查询，每页有5条数据
		
		List<Academic> list = academicService.getAll();
		PageInfo<Academic> pageInfo=new PageInfo<>(list,5);//使用pageInfo包装查询结果,连续显示5页
		
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping(value="addAca.do",method=RequestMethod.POST)
	@ResponseBody
	public Msg addAca(@Valid Academic academic,BindingResult result) {//表单自动分装
		if(result.hasErrors()) {
			Map<String, Object> map=new HashMap<>();
			List<FieldError> fieldErrors = result.getFieldErrors();
			for(FieldError error:fieldErrors) {
				map.put(error.getField(),error.getDefaultMessage());
			}
			return Msg.fail().add("error_map", map);
		}else {
			academicService.addAca(academic);
			return Msg.success();
		}
		
		
	}
	
	@RequestMapping("checkAca.do")
	@ResponseBody
	public Msg checkAca(String aca_name) {
		boolean flag=academicService.checkAca(aca_name);
		if(flag) 
			return Msg.success();
		return Msg.fail();
	}
	
	@RequestMapping(value="getAca.do")
	@ResponseBody
	public Msg getAcaByIdx(Integer aca_idx) {
		Academic academic = academicService.getAcaByIdx(aca_idx);
		return Msg.success().add("aca", academic);
		
	}
	
	@ResponseBody
	@RequestMapping(value="savaAca.do")
	public Msg saveAca(Academic academic) {
		academicService.updateAca(academic);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("benchDel.do")
	public Msg deleteAcaByIdx(@RequestParam("aca_idxs")String aca_idxs) {
		String[] idxs = aca_idxs.split("-");
		academicService.benchDel(idxs);
		return Msg.success();
	}
	
	@ResponseBody
	@RequestMapping("searchByName.do")
	public Msg searchByName(String aca_name) {
		PageHelper.startPage(1, 5);
		List<Academic> list = academicService.searchByName(aca_name);
		System.out.println(list);
		PageInfo<Academic> pageInfo=new PageInfo<>(list,5);
		return Msg.success().add("pageInfo", pageInfo);
	}
	
	@RequestMapping("getAll.do")
	@ResponseBody
	public List<Academic> getAll(){
		return academicService.getAll();
	}
}
