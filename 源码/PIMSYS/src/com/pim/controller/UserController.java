package com.pim.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pim.entity.PageData;
import com.pim.entity.Users;
import com.pim.service.RoleService;
import com.pim.service.UserService;


@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired
	private UserService us;
	@Autowired
	private RoleService rs;
	
	/*@RequestMapping("/toUserPage")
	public String toUserPage(HttpServletRequest request){
		List<Role> roleAll = rs.getRoleAll();
		request.setAttribute("roleList", roleAll);
		return "jsp/user/user";
	}*/
	@RequestMapping("/update")
	@ResponseBody
	public String update(Users u){
		Map<String,Object> map=new HashMap<String ,Object>();
		Integer i = us.update(u);
		/*if(i==1){
			map.put("success", true);
			map.put("message", "修改成功！");
		}else{
			map.put("success", false);
			map.put("message", "修改失败！");
		}*/
		return "ok";
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<Users> query(){
		List<Users> list = us.queryall();
		return list;
	}
	@RequestMapping("/page")
	@ResponseBody
	public PageData<Users> page(Integer page,Integer rows){
		List<Users> list = us.page(page, rows);
		Integer total = us.count();
		PageData<Users> pd=new PageData<Users>();
		pd.setRows(list);
		pd.setTotal(total);
		return pd;
		
	}
}
