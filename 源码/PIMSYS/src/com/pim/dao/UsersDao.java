package com.pim.dao;

import com.pim.entity.Users;

public interface UsersDao extends BaseDAO<Users>{
	
	public abstract Users selectUserByPhoneAndPaw(Users user);
	

}
