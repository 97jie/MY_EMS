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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import ems.entity.Academic;
import ems.entity.Admin;
import ems.entity.Msg;
import ems.service.AdminService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	@Autowired
	private AdminService adminService;
	
	@RequestMapping("adminLogin.do")
	@ResponseBody
	public Msg verify(Admin admin,HttpSession session) {
		Admin admin2 = adminService.verify(admin);
		if(admin2!=null) {
			session.setAttribute("admin", new Gson().toJson(admin2, Admin.class));
			return Msg.success();
		}
		return Msg.fail();
	}
	
	@RequestMapping("login_out.do")
	public String login_out(HttpSession session) {
		session.invalidate();
		return "adminLogin";
	}
	
	@RequestMapping("saveA.do")
	@ResponseBody
	public Msg saveA(@Valid Admin admin,BindingResult result, HttpSession session) {//表单自动分装
		if(result.hasErrors()) {
			Map<String, Object> map=new HashMap<>();
			List<FieldError> fieldErrors = result.getFieldErrors();
			for(FieldError error:fieldErrors) {
				map.put(error.getField(),error.getDefaultMessage());
			}
			return Msg.fail().add("error_map", map);
		}else {
			adminService.saveA(admin);
			session.setAttribute("admin", new Gson().toJson(admin, Admin.class));
			return Msg.success().add("ad", admin);
		}
	}
}
