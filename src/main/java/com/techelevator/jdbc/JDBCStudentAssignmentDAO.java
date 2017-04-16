package com.techelevator.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.daos.StudentAssignmentDAO;
import com.techelevator.models.Course;
import com.techelevator.models.StudentAssignment;

@Component
public class JDBCStudentAssignmentDAO extends JDBCDAO implements StudentAssignmentDAO {

	@Autowired
	public JDBCStudentAssignmentDAO(DataSource dataSource) {
		super(dataSource);
	}

	@Override
	public StudentAssignment createStudentAssignment(StudentAssignment studentAssignment) {
		String sqlCreateScore = "INSERT INTO student_assignment (studentId, assignmentId) VALUES (?,?)";
		int rowsAffected = jdbcTemplate.update(sqlCreateScore, studentAssignment.getStudentId(), studentAssignment.getAssignmentId());
		if (rowsAffected == 1) {
			return studentAssignment;
		} else {
			return null;
		}
	}

	@Override
	public StudentAssignment getStudentAssignmentByStudentIdAndAssignmentId(long studentId, long assignmentId) {
		String sqlGetScoreForStudent = "SELECT * FROM student_assignment WHERE studentId = ? AND assignmentId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetScoreForStudent, studentId, assignmentId);
		if(results.next()) {
			return mapRowToStudentAssignment(results);
		} else {
			return null;
		}
	}
	
	@Override
	public List<StudentAssignment> getAllStudentAssignmentsByStudentId(long studentId) {
		List <StudentAssignment> studentGrades = new ArrayList<>();
		String sqlGetScoresForStudent = "SELECT score FROM student_assignment WHERE studentId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetScoresForStudent, studentId);
		while (results.next()) {
			StudentAssignment nextStudentAssignment = mapRowToStudentAssignment(results);
			studentGrades.add(nextStudentAssignment);
		}
		return studentGrades;
	}
	
	@Override
	public List<StudentAssignment> getAllStudentAssignmentsByStudentIdAndCourseId(long studentId, long courseId) {
		List <StudentAssignment> studentCourseGrades = new ArrayList<>();
		String sqlGetScoresForStudentByClass = "SELECT * FROM student_assignment JOIN users ON users.userId= student_assignment.studentId JOIN student_course ON users.userId = student_assignment.studentId JOIN courses ON student_course.courseId = courses.courseId WHERE users.userId = ? AND courses.courseId = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetScoresForStudentByClass, studentId, courseId);
		while (results.next()) {
			StudentAssignment nextStudentAssignment = mapRowToStudentAssignment(results);
			studentCourseGrades.add(nextStudentAssignment);
		}
		return studentCourseGrades;
		
	}
	
	@Override
	public void addTextSubmission(long studentId, long assignmentId, String submissionText) {
		String sqlAddTextSubmission = "";
		// TODO: update assignment
	}

	private StudentAssignment mapRowToStudentAssignment(SqlRowSet results) {
		StudentAssignment studentAssignment = new StudentAssignment();
		studentAssignment.setStudentId(results.getLong("studentId"));
		studentAssignment.setAssignmentId(results.getLong("assignmentId"));
		studentAssignment.setScore(results.getLong("score"));
		studentAssignment.setSubmissionText(results.getString("submissionText"));
		studentAssignment.setIsSubmitted(results.getBoolean("isSubmitted"));
		studentAssignment.setSubmissionDate(results.getDate("submissionDate").toLocalDate());
		return studentAssignment;
	}

}
