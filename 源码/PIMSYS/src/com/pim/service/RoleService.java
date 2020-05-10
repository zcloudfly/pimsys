package com.pim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pim.dao.RoleDao;
import com.pim.entity.Role;
import com.pim.entity.Role;

@Service
public class RoleService {
	@Autowired
	private RoleDao rd;
	/**
	 * 获取所有角色
	 * @return
	 */
	public List<Role> getRoleAll(){
		return rd.selectAll();
	}
	/**
	 * 更新
	 * @param r
	 * @return
	 */
	public Integer update(Role r) {
		Integer i = rd.update(r);
		return i;
	}
	
   public Role selectById(String  id){
	   return rd.selectById(id);
   }
   public Integer deleteById(String id){
		return rd.delete(id);
	}
   public List<Role> page(Integer start, Integer rows) {
		Integer s=(start-1)*rows;
		List<Role> list = rd.page(s, rows);
		return list;
	}

	public Integer count() {
		Integer count = rd.count();
		return count;
	}
	public int insert(Role r){
		return rd.insert(r);
	}
}
