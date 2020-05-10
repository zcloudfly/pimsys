package com.pim.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pim.entity.PageData;
import com.pim.entity.Role;
import com.pim.entity.Users;
import com.pim.service.RoleService;
import com.pim.service.UserService;
@Controller
@RequestMapping("/role")
public class RoleController {
	@Autowired
    private UserService u;
	@Autowired
	private RoleService rs;
	@RequestMapping("/update")
	@ResponseBody
	public String update(Role r){
		Integer i = rs.update(r);
		if(i>0){
		return "ok";
		}else{
			return "error";
		}
	}
	@RequestMapping("/query")
	@ResponseBody
	public List<Role> query(){
		List<Role> list = rs.getRoleAll();
		return list;
	}
	@RequestMapping("/getOne")
	@ResponseBody
	public Role getOne(String id){
		return rs.selectById(id);
	}
	@RequestMapping("/insert")
	@ResponseBody
	public String insert(Role pos,HttpServletRequest req){
		int i=0;
		Users user = (Users)req.getSession().getAttribute("user");
		pos.setOperatorId(user.getId());
		pos.setOperatorTime(new Date());
		if(StringUtils.isEmpty(pos.getId())){
			pos.setId(UUID.randomUUID().toString().replace("-", ""));
			i = rs.insert(pos);
		}else{
			i=rs.update(pos);
		}
		if(i>0){
			return "ok";
		}else{
			return "error";
		}
	}
	@RequestMapping("/page")
	@ResponseBody
	public PageData<Role> page(Integer page,Integer rows){
		List<Role> list = rs.page(page, rows);
		List<Role> p = new ArrayList<Role>();
		for (Role role : list) {
			String uName=u.selectById(role.getOperatorId()).getuName();
			role.setOperatorId(uName);
			p.add(role);
		}
		Integer total = rs.count();
		PageData<Role> pd=new PageData<Role>();
		pd.setRows(p);
		pd.setTotal(total);
		return pd;
		
	}
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteById(String id){
		Integer i = rs.deleteById(id);
		if(i>0){
			return "ok";
		}else{
			return "error";
		}
	}
}
