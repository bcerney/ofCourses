package com.techelevator.models;

import java.time.LocalDate;

public class StudentAssignment {
	private long score;
	private long studentId;
	private long assignmentId;
	private boolean isSubmitted;
	private String submissionText;
	private LocalDate submissionDate;
	
	public StudentAssignment() {
		
	}
	
	public StudentAssignment(long studentId, long assignmentId) {
		this.studentId = studentId;
		this.assignmentId = assignmentId;
	}
	
	public long getStudentId() {
		return studentId;
	}
	
	public void setStudentId(long studentId) {
		this.studentId = studentId;
	}
	
	public long getAssignmentId() {
		return assignmentId;
	}
	
	public void setAssignmentId(long assignmentId) {
		this.assignmentId = assignmentId;
	}

	public boolean isSubmitted() {
		return isSubmitted;
	}
	public void setIsSubmitted(boolean isSubmitted) {
		this.isSubmitted = isSubmitted;
	}
	
	public LocalDate getSubmissionDate() {
		return submissionDate;
	}
	
	public void setSubmissionDate(LocalDate submissionDate) {
		this.submissionDate = submissionDate;
	}
	
	public String getSubmissionText() {
		return submissionText;
	}
	
	public void setSubmissionText(String submissionText) {
		this.submissionText = submissionText;
	}
	
	public long getScore() {
		return score;
	}
	
	public void setScore(long score) {
		this.score = score;
	}
	
}
