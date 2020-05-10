package com.pim.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.pim.entity.Users;
import com.pim.service.UserService;

@Controller
@RequestMapping("/manager")
public class ManagerController {
	@Autowired
	private UserService us;
	
	
	@RequestMapping("/login")
	@ResponseBody
	public String login(Users user,HttpSession session){
		user = us.getUserByPhoneAndPwd(user);
		session.setAttribute("user", user);
		if(user!=null){
			
			return "ok";
		}else{
			return "error";
		}	
	}
    @RequestMapping("/regist")
	@ResponseBody
	public String regist(Users user,HttpServletRequest request){
		Integer i = us.addUser(user);
		if(i==1){		
			return "ok";
		}else{
			return "error";
		}
	}
/*
	@RequestMapping("/equals")
	@ResponseBody
	public String equalsPasswod(Manager man,HttpSession session){
		Manager manager = (Manager) session.getAttribute("man");
		if(RandomUtil.equalPassword(manager.getManagerSalt(), man.getManagerPsw(), manager.getManagerPsw())){
			return "ok";
		}else{
			return "error";
		}
	}
	@RequestMapping("/updatePsw")
	@ResponseBody
	public String modifyPassword(Manager man,HttpSession session){
		Manager manager = (Manager) session.getAttribute("man");
		manager.setManagerPsw(manager.getManagerSalt()+man.getManagerPsw());
		Integer i = ms.modifyPassword(manager);
		if(i==1){
		return "ok";
		}else{
			return "error";
		}
	}*/

}
