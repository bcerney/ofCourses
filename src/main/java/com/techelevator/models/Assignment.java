package com.techelevator.models;

import java.time.LocalDate;

public class Assignment {
	private long assignmentId;
	private String name;
	private String description;
	private LocalDate assignDate;
	private LocalDate dueDate;
	private long lessonId;
	private long maxScore;
	
	public long getAssignmentId() {
		return assignmentId;
	}
	public void setAssignmentId(long assignmentId) {
		this.assignmentId = assignmentId;
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
	public LocalDate getAssignDate() {
		return assignDate;
	}
	public void setAssignDate(LocalDate assignDate) {
		this.assignDate = assignDate;
	}
	public LocalDate getDueDate() {
		return dueDate;
	}
	public void setDueDate(LocalDate dueDate) {
		this.dueDate = dueDate;
	}
	public long getLessonId() {
		return lessonId;
	}
	public void setLessonId(long lessonId) {
		this.lessonId = lessonId;
	}
	public long getMaxScore() {
		return maxScore;
	}
	public void setMaxScore(long maxScore) {
		this.maxScore = maxScore;
	}
}
