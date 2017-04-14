package com.techelevator.models;

public class Module {
	private long moduleId;
	private String name;
	private String description;
	private long courseId;
	
	public Module() {
		
	}
	
	public Module(String name, String description, long courseId) {
		this.name = name;
		this.description = description;
		this.courseId = courseId;
	}
	
	public long getModuleId() {
		return moduleId;
	}
	public void setModuleId(long moduleId) {
		this.moduleId = moduleId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public long getCourseId() {
		return courseId;
	}
	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}
}
