package com.techelevator.models;

public class StudentAssignment {
	private int score;
	private long studentId;
	private long assignmentId;
	private boolean isSubmitted;
	private String submissionText;
	
	
	public boolean isSubmitted() {
		return isSubmitted;
	}
	public void setSubmitted(boolean isSubmitted) {
		this.isSubmitted = isSubmitted;
	}
	public String getSubmissionText() {
		return submissionText;
	}
	public void setSubmissionText(String submissionText) {
		this.submissionText = submissionText;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
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
	
}
