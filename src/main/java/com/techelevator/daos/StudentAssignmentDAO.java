package com.techelevator.daos;

import java.util.ArrayList;
import java.util.List;

import com.techelevator.models.StudentAssignment;

public interface StudentAssignmentDAO {
	
	public StudentAssignment createScore(StudentAssignment score);
	public StudentAssignment getScoreForStudentByAssignmentId(long studentId, long assignmentId);
	public List getAllScoresForStudent(long studentId);
	public List getAllScoresForStudentByCourse(long studentId, long courseId);
//	public ArrayList<Score> getAllScoresForStudentByCourseId(long assignmentId);
}
