package com.pim.entity;

import java.util.List;

public class PageData<T> {
	private List<T> rows;
	private Integer total;

	public PageData(List<T> rows, Integer total) {
		super();
		this.rows = rows;
		this.total = total;
	}







	public List<T> getRows() {
		return rows;
	}







	public void setRows(List<T> rows) {
		this.rows = rows;
	}







	public Integer getTotal() {
		return total;
	}







	public void setTotal(Integer total) {
		this.total = total;
	}







	public PageData(){}
}
