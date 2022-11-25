package com.yang.domain;

import java.io.Serializable;

public class Merchant implements Serializable{
	
	private int id;
	private String username;
	private String password;
	private String email;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	@Override
	public String toString() {
		return "Merchant [id=" + id + ", username=" + username + ", password=" + password + ", email=" + email + "]";
	}
}
