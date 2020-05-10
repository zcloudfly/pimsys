package com.pim.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pim.dao.PositionDao;
import com.pim.entity.Dept;
import com.pim.entity.Position;
@Service
public class Positionservice {

	@Autowired
	private PositionDao pd;
	
	
	 public List<Position> page(Integer start, Integer rows) {
			Integer s=(start-1)*rows;
			List<Position> list = pd.page(s, rows);
			return list;
		}

		public Integer count() {
			Integer count = pd.count();
			return count;
		}
	/**
	 * 获取所有
	 * @return
	 */
	public List<Position> getPositionAll(){
		return pd.selectAll();
	}
	/**
	 * 更新
	 * @param r
	 * @return
	 */
	public Integer update(Position r) {
		Integer i = pd.update(r);
		return i;
	}
   public Position selectById(String  id){
	   return pd.selectById(id);
   }
   public int insert(Position pos){
	   return pd.insert(pos);
   }
   public Integer deleteById(String id){
		return pd.delete(id);
	}
}
