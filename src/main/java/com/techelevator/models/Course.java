package com.techelevator.models;

import java.math.BigDecimal;
import java.time.LocalDate;

public class Course {
	private long courseId;
	private String name;
	private long capactiy;
	private String description;
	private BigDecimal fee;
	private LocalDate startDate;
	private LocalDate endDate;
	private long teacherId;
	private String subject;
	
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
	public long getCapactiy() {
		return capactiy;
	}
	public void setCapactiy(long capactiy) {
		this.capactiy = capactiy;
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
}
