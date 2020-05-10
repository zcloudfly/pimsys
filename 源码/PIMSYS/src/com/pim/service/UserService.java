package com.pim.service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pim.dao.UsersDao;
import com.pim.entity.Users;
@Service
public class UserService {
	@Autowired
	private UsersDao udao;
	
	/**
	 * 根据电话和密码获取用户
	 * @param u
	 * @return
	 */
	public Users getUserByPhoneAndPwd(Users u){
		return udao.selectUserByPhoneAndPaw(u);
	}
	/**
	 * 新增用户
	 * @param u
	 * @return
	 */
	public int addUser(Users u){
		String uuid = UUID.randomUUID().toString().replace("-", "");
		u.setId(uuid);
		u.setSts("1");
		u.setOpratorTime(new Date());
		return udao.insert(u);
	}
	

	public List<Users> page(Integer start, Integer rows) {
		Integer s=(start-1)*rows;
		List<Users> list = udao.page(s, rows);
		return list;
	}

	public Integer count() {
		Integer count = udao.count();
		return count;
	}
	public Integer update(Users u) {
		Integer i = udao.update(u);
		return i;
	}

	public Integer save(Users u) {
		Integer i = udao.insert(u);
		return i;
	}

	public List<Users> queryall() {
		List<Users> list = udao.selectAll();
		return list;
	}
	public Users selectById(String id){
		return udao.selectById(id);
	}
}
