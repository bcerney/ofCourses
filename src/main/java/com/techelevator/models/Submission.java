package com.techelevator.models;

import java.time.LocalDate;

public class Submission {
	private Lesson lesson;
	private Assignment assignment;
	private StudentAssignment studentAssignment;
	
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
	
}
