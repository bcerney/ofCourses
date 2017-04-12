package com.techelevator.models;

public class Score {
	private int score;
	private long studentId;
	private long assignmentId;
	
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
