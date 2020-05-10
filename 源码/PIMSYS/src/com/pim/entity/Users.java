package com.pim.entity;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.alibaba.fastjson.annotation.JSONField;
import com.fasterxml.jackson.annotation.JsonFormat;

public class Users implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String uName;
	private String telephone;
	private String pwd;
	private String depId;
	private String positionId;
	private String roleId;
	private String sts;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@JSONField(format="yyyy-MM-dd")
	private Date opratorTime;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getuName() {
		return uName;
	}
	public void setuName(String uName) {
		this.uName = uName;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getDepId() {
		return depId;
	}
	public void setDepId(String depId) {
		this.depId = depId;
	}
	public String getPositionId() {
		return positionId;
	}
	public void setPositionId(String positionId) {
		this.positionId = positionId;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getSts() {
		return sts;
	}
	public void setSts(String sts) {
		this.sts = sts;
	}
	public Date getOpratorTime() {
		return opratorTime;
	}
	public void setOpratorTime(Date opratorTime) {
		this.opratorTime = opratorTime;
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", uName=" + uName + ", telephone=" + telephone + ", pwd=" + pwd + ", depId=" + depId
				+ ", positionId=" + positionId + ", roleId=" + roleId + ", sts=" + sts + ", opratorTime=" + opratorTime
				+ "]";
	}
	
}
