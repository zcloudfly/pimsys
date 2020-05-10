package com.pim.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * 一组通用的DAO接口设计
 *
 */
public interface BaseDAO<T> {
	
	
	/**
	 * 保存方法
	 * @param t
	 */
	Integer insert(T t);
	
	/**
	 * 更新方法
	 * @param t
	 */
	Integer update(T t);
	
	/**
	 * 根据主键删除一个
	 * @param id
	 */
	Integer delete(String id);
	
	/**
	 * 查询所有
	 * @return
	 */
	List<T> selectAll();
	/**
	 * 分页
	 * @return
	 */
	List<T> page(@Param("start")Integer start,@Param("rows")Integer rows);
	/**
	 * 总条数
	 */
	Integer count();
	
	/**
	 * 根据主键查询一个
	 * @param id
	 * @return
	 */
	T selectById(String id);
	

}
