package com.techelevator.daos;

import java.util.ArrayList;
import java.util.List;

import com.techelevator.models.StudentAssignment;

public interface StudentAssignmentDAO {
	
	public StudentAssignment createStudentAssignment(StudentAssignment studentAssignment);
	public StudentAssignment getStudentAssignmentByStudentIdAndAssignmentId(long studentId, long assignmentId);
	public List<StudentAssignment> getAllStudentAssignmentsByStudentId(long studentId);
	public List<StudentAssignment> getAllStudentAssignmentsByStudentIdAndCourseId(long studentId, long courseId);
//	public ArrayList<Score> getAllScoresForStudentByCourseId(long assignmentId);
}
