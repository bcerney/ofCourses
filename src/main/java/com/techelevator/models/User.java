package com.techelevator.models;

public class User {
	private long userId;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private boolean isTeacher;
	
	public User() {
		
	}
	
	public User(String firstName, String lastName, String email, String password, String userType) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		setTeacher(userType);
	}
	
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isTeacher() {
		return isTeacher;
	}
	public void setTeacher(String userType) {
		if (userType.equals("student")) {
			isTeacher = false;
		} else {
			isTeacher = true;
		}
	}	
}
