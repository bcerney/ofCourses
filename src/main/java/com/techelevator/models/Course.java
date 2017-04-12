package com.techelevator.models;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Course {
	private long courseId;
	private String name;
	private long capacity;
	private String description;
	private BigDecimal fee;
	private LocalDate startDate;
	private LocalDate endDate;
	private long teacherId;
	private String subject;
	private String difficulty;
	
	public Course() {
		
	}
	
	public Course(long teacherId, String name, long capacity, String description, BigDecimal fee, LocalDate startDate,
			LocalDate endDate, String subject, String difficulty) {
		this.teacherId = teacherId;
		this.name = name;
		this.capacity = capacity;
		this.description = description;
		this.fee = fee;
		this.startDate = startDate;
		this.endDate = endDate;
		this.subject = subject;
		this.difficulty = difficulty;
	}
	
	public long getCourseId() {
		return courseId;
	}
	public void setCourseId(long courseId) {
		this.courseId = courseId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getCapacity() {
		return capacity;
	}
	public void setCapacity(long capacity) {
		this.capacity = capacity;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public BigDecimal getFee() {
		return fee;
	}
	public void setFee(BigDecimal fee) {
		this.fee = fee;
	}
	public LocalDate getStartDate() {
		return startDate;
	}
	public void setStartDate(LocalDate startDate) {
		this.startDate = startDate;
	}
	public LocalDate getEndDate() {
		return endDate;
	}
	public void setEndDate(LocalDate endDate) {
		this.endDate = endDate;
	}
	public long getTeacherId() {
		return teacherId;
	}
	public void setTeacherId(long teacherId) {
		this.teacherId = teacherId;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
}
