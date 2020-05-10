package com.pim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pim.dao.DeptDao;
import com.pim.entity.Dept;

@Service
public class DeptService {

	@Autowired
	private DeptDao pd;
	/**
	 * 获取所有
	 * @return
	 */
	public List<Dept> getDeptAll(){
		return pd.selectAll();
	}
	/**
	 * 更新
	 * @param r
	 * @return
	 */
	public Integer update(Dept r) {
		Integer i = pd.update(r);
		return i;
	}
	
   public Dept selectById(String  id){
	   return pd.selectById(id);
   }
   
   public List<Dept> page(Integer start, Integer rows) {
		Integer s=(start-1)*rows;
		List<Dept> list = pd.page(s, rows);
		return list;
	}

	public Integer count() {
		Integer count = pd.count();
		return count;
	}
	
	public Integer deleteById(String id){
		return pd.delete(id);
	}
	
	public int insert(Dept dept){
		return pd.insert(dept);
	}
}
