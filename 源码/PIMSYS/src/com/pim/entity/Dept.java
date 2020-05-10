package com.pim.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.util.StringUtils;

import com.alibaba.fastjson.annotation.JSONField;

public class Dept implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String name;
	private String parentId;
	private String operatorId;
	private String sts;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JSONField(format="yyyy-MM-dd")
	private Date operatorTime;
	private List<Dept> son;
	private Dept father;
	
	
	public List<Dept> getSon() {
		return son;
	}
	public void setSon(List<Dept> son) {
		this.son = son;
	}
	public Dept getFather() {
		return father;
	}
	public void setFather(Dept father) {
		this.father = father;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getParentId() {
		if(StringUtils.isEmpty(parentId)){
			return "无";
		}
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getOperatorId() {
		return operatorId;
	}
	public void setOperatorId(String operatorId) {
		this.operatorId = operatorId;
	}
	public String getSts() {
		return sts;
	}
	public void setSts(String sts) {
		this.sts = sts;
	}
	public Date getOperatorTime() {
		return operatorTime;
	}
	public void setOperatorTime(Date operatorTime) {
		this.operatorTime = operatorTime;
	}
	@Override
	public String toString() {
		return "Dept [id=" + id + ", name=" + name + ", parentId=" + parentId + ", operatorId=" + operatorId + ", sts="
				+ sts + ", operatorTime=" + operatorTime + "]";
	}
	

}
