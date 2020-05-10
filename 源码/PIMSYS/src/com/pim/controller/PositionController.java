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
import com.pim.entity.Position;
import com.pim.entity.Role;
import com.pim.entity.Users;
import com.pim.service.Positionservice;
import com.pim.service.UserService;
@Controller
@RequestMapping("/position")
public class PositionController {
	@Autowired
	private UserService u;
	@Autowired
	private Positionservice ps;
	
	@RequestMapping("/page")
	@ResponseBody
	public PageData<Position> page(Integer page,Integer rows){
		List<Position> list = ps.page(page, rows);
		List<Position> p = new ArrayList<Position>();
		for (Position pos : list) {
			String uName=u.selectById(pos.getOperatorId()).getuName();
			pos.setOperatorId(uName);
			p.add(pos);
		}
		Integer total = ps.count();
		PageData<Position> pd=new PageData<Position>();
		pd.setRows(p);
		pd.setTotal(total);
		return pd;
		
	}
	@RequestMapping("/update")
	@ResponseBody
	public String update(Position r){
		Integer i = ps.update(r);
		if(i>0){
		return "ok";
		}else{
			return "error";
		}
	}
	@RequestMapping("/delete")
	@ResponseBody
	public String deleteById(String id){
		Integer i = ps.deleteById(id);
		if(i>0){
			return "ok";
		}else{
			return "error";
		}
	}
	@RequestMapping("/query")
	@ResponseBody
	public List<Position> query(){
		List<Position> list = ps.getPositionAll();
		return list;
	}
	@RequestMapping("/getOne")
	@ResponseBody
	public Position getOne(String id){
		return ps.selectById(id);
	}
	@RequestMapping("/insert")
	@ResponseBody
	public String insert(Position pos,HttpServletRequest req){
		int i=0;
		Users user = (Users)req.getSession().getAttribute("user");
		pos.setOperatorId(user.getId());
		pos.setOperatorTime(new Date());
		if(StringUtils.isEmpty(pos.getId())){
			pos.setId(UUID.randomUUID().toString().replace("-", ""));
			i = ps.insert(pos);
		}else{
			i=ps.update(pos);
		}
		if(i>0){
			return "ok";
		}else{
			return "error";
		}
	}
}
