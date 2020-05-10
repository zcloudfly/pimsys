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

import com.pim.entity.Dept;
import com.pim.entity.PageData;
import com.pim.entity.Users;
import com.pim.service.DeptService;
import com.pim.service.UserService;

@Controller
@RequestMapping("/dept")
public class DeptController {
	@Autowired
	private UserService u;
	@Autowired
	private DeptService ds;
	
	@RequestMapping("/update")
	@ResponseBody
	public String update(Dept r){
		Integer i = ds.update(r);
		if(i>0){
		return "ok";
		}else{
			return "error";
		}
	}
	@RequestMapping("/query")
	@ResponseBody
	public List<Dept> query(){
		List<Dept> list = ds.getDeptAll();
		return list;
	}
	@RequestMapping("/getOne")
	@ResponseBody
	public Dept getOne(String id){
		return ds.selectById(id);
	}
	
	@RequestMapping("/page")
	@ResponseBody
	public PageData<Dept> page(Integer page,Integer rows){
		List<Dept> list = ds.page(page, rows);
		List<Dept> p = new ArrayList<Dept>();
		for (Dept pos : list) {
			String uName=u.selectById(pos.getOperatorId()).getuName();
			pos.setOperatorId(uName);
			p.add(pos);
		}
		Integer total = ds.count();
		PageData<Dept> pd=new PageData<Dept>();
		pd.setRows(p);
		pd.setTotal(total);
		return pd;
		
	}
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteById(String id){
		Integer i = ds.deleteById(id);
		if(i>0){
			return "ok";
		}else{
			return "error";
		}
	}
	@RequestMapping("/insert")
	@ResponseBody
	public String insert(Dept dept,HttpServletRequest req){
		int i=0;
		Users user = (Users)req.getSession().getAttribute("user");
		dept.setOperatorId(user.getId());
		dept.setOperatorTime(new Date());
		if(StringUtils.isEmpty(dept.getId())){
			dept.setId(UUID.randomUUID().toString().replace("-", ""));
			i = ds.insert(dept);
		}else{
			i=ds.update(dept);
		}
		if(i>0){
			return "ok";
		}else{
			return "error";
		}
	}
	@RequestMapping("/selectById")
	@ResponseBody
	public Dept selectById(String  id){
		   return ds.selectById(id);
	   }

}
