package com.techelevator.models;

import java.time.LocalDate;

public class Submission {
	private Lesson lesson;
	private Assignment assignment;
	private StudentAssignment studentAssignment;
//	private long studentId;
//	private long assignmentId;
//	private String assignmentName;
//	private String assignmentDescription;
//	private boolean isSubmitted;
//	private LocalDate submissionDate;
//	private String submissionText;
//	private long score;
//	private long maxScore;
	
	public Submission() {
		
	}
	
	

	public Submission(Lesson lesson, Assignment assignment, StudentAssignment studentAssignment) {
		this.lesson = lesson;
		this.assignment = assignment;
		this.studentAssignment = studentAssignment;
	}

	public Lesson getLesson() {
		return lesson;
	}

	public void setLesson(Lesson lesson) {
		this.lesson = lesson;
	}

	public Assignment getAssignment() {
		return assignment;
	}

	public void setAssignment(Assignment assignment) {
		this.assignment = assignment;
	}

	public StudentAssignment getStudentAssignment() {
		return studentAssignment;
	}

	public void setStudentAssignment(StudentAssignment studentAssignment) {
		this.studentAssignment = studentAssignment;
	}
	
	//	public Submission(Lesson lesson, long studentId, long assignmentId, String assignmentName, String assignmentDescription,
//	boolean isSubmitted, LocalDate submissionDate, String submissionText, long score, long maxScore) {
//this.lesson = lesson;
//this.studentId = studentId;
//this.assignmentId = assignmentId;
//this.assignmentName = assignmentName;
//this.assignmentDescription = assignmentDescription;
//this.isSubmitted = isSubmitted;
//this.submissionDate = submissionDate;
//this.submissionText = submissionText;
//this.score = score;
//this.maxScore = maxScore;
//}
//
	
//
//	public long getStudentId() {
//		return studentId;
//	}
//
//	public void setStudentId(long studentId) {
//		this.studentId = studentId;
//	}
//
//	public long getAssignmentId() {
//		return assignmentId;
//	}
//
//	public void setAssignmentId(long assignmentId) {
//		this.assignmentId = assignmentId;
//	}
//
//	public String getAssignmentName() {
//		return assignmentName;
//	}
//
//	public void setAssignmentName(String assignmentName) {
//		this.assignmentName = assignmentName;
//	}
//
//	public String getAssignmentDescription() {
//		return assignmentDescription;
//	}
//
//	public void setAssignmentDescription(String assignmentDescription) {
//		this.assignmentDescription = assignmentDescription;
//	}
//
//	public boolean isSubmitted() {
//		return isSubmitted;
//	}
//
//	public void setSubmitted(boolean isSubmitted) {
//		this.isSubmitted = isSubmitted;
//	}
//
//	public LocalDate getSubmissionDate() {
//		return submissionDate;
//	}
//
//	public void setSubmissionDate(LocalDate submissionDate) {
//		this.submissionDate = submissionDate;
//	}
//
//	public String getSubmissionText() {
//		return submissionText;
//	}
//
//	public void setSubmissionText(String submissionText) {
//		this.submissionText = submissionText;
//	}
//
//	public long getScore() {
//		return score;
//	}
//
//	public void setScore(long score) {
//		this.score = score;
//	}
//
//	public long getMaxScore() {
//		return maxScore;
//	}
//
//	public void setMaxScore(long maxScore) {
//		this.maxScore = maxScore;
//	}
	
	
	

}
