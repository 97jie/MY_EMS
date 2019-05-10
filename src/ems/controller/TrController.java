package ems.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import ems.entity.Msg;
import ems.entity.TopicReply;
import ems.service.TrService;
import ems.service.ZtService;

@Controller
@RequestMapping("/tr/")
public class TrController {

	@Autowired
	TrService trService;
	@Autowired
	ZtService ztService;
	
	
	@RequestMapping("getAllWithJson")
	@ResponseBody
	public Msg getAllWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn,
			@RequestParam(value="sort",defaultValue="1")String sort,
			String zt_idx,Model model,Integer tr_no) {
		PageHelper.startPage(pn, 8);//从pn页开始查询，每页有8条数据
		List<TopicReply> list=trService.getAll(zt_idx,tr_no,sort);
		PageInfo<TopicReply> pageInfo=new PageInfo<>(list,8);//使用pageInfo包装查询结果
		int bc_idx = ztService.getWithKey(Integer.parseInt(zt_idx)).getBc_idx();
		return Msg.success().add("pageInfo", pageInfo).add("bc_idx", bc_idx);
	}
	
	@RequestMapping("savaTr.do")
	@ResponseBody
	public Msg savaTr(@Valid TopicReply tr,BindingResult result) {
		if(result.hasErrors()) {
			Map<String, Object> map=new HashMap<>();
			List<FieldError> fieldErrors = result.getFieldErrors();
			for(FieldError error:fieldErrors) {
				map.put(error.getField(),error.getDefaultMessage());
			}
			return Msg.fail().add("error_map", map);
		}else {
			String pub_time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
			tr.setTr_time(pub_time);
			tr.setTr_like_num(0);
			trService.savaTr(tr);
			return Msg.success();
		}
	}
	
	@RequestMapping("changeLike.do")
	public void changeLike(Integer tr_idx,String like_no,int num) {
		trService.changeLike(tr_idx,like_no,num);
	}
	
	@RequestMapping("addInform.do")
	public void addInform(TopicReply tr) {
		String pub_time=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
		tr.setTr_like_num(0);
		tr.setTr_time(pub_time);
		trService.savaTr(tr);
	}
	
	@RequestMapping("getTrsWithNo.do")
	@ResponseBody
	public Msg getTrsWithNo(String zt_no) {
		List<TopicReply> list=trService.getTrsWithNo(zt_no);
		return Msg.success().add("list", list);
	}
}
