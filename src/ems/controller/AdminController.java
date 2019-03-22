package ems.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		Long count = adminService.verify(admin);
		if(count!=0) {
			session.setAttribute("admin", admin);
			return Msg.success();
		}
		return Msg.fail();
	}
	
	@RequestMapping("login_out.do")
	public String login_out(HttpSession session) {
		session.invalidate();
		return "adminLogin";
	}
}
