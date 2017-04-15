package com.techelevator.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.daos.StudentAssignmentDAO;
import com.techelevator.models.Course;
import com.techelevator.models.StudentAssignment;

public class JDBCStudentAssignmentDAO extends JDBCDAO implements StudentAssignmentDAO {

	public JDBCStudentAssignmentDAO(DataSource dataSource) {
		super(dataSource);
	}

	@Override
	public StudentAssignment createScore(StudentAssignment score) {
		String sqlCreateScore = "INSERT INTO scores (score, studentId, assignmentId) VALUES (?,?,?)";
		int rowsAffected = jdbcTemplate.update(sqlCreateScore, score.getScore(), score.getStudentId(), score.getAssignmentId());
		if (rowsAffected == 1) {
			return score;
		} else {
			return null;
		}
	}

	@Override
	public StudentAssignment getScoreForStudentByAssignmentId(long studentId, long assignmentId) {
		String sqlGetScoreForStudent = "SELECT * FROM scores WHERE studentId = ? AND assignmentId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetScoreForStudent, studentId, assignmentId);
		if(results.next()) {
			return mapRowToScore(results);
		} else {
			return null;
		}
	}
	
	@Override
	public List getAllScoresForStudent(long studentId) {
		List <StudentAssignment> studentGrades = new ArrayList<>();
		String sqlGetScoresForStudent = "SELECT score FROM student_assignment WHERE studentId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetScoresForStudent, studentId);
		while (results.next()) {
			StudentAssignment nextStudentAssignment = mapRowToScore(results);
			studentGrades.add(nextStudentAssignment);
		}
		return studentGrades;
	}
	
	@Override
	public List getAllScoresForStudentByCourse(long studentId, long courseId) {
		List <StudentAssignment> studentCourseGrades = new ArrayList<>();
		String sqlGetScoresForStudentByClass = "SELECT score FROM student_assignment JOIN users ON users.userId= student_assignment.studentId JOIN student_course ON users.userId = student_assignment.studentId JOIN courses ON student_course.courseId = courses.courseId WHERE users.userId = ? AND courses.courseId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetScoresForStudentByClass, studentId, courseId);
		while (results.next()) {
			StudentAssignment nextStudentAssignment = mapRowToScore(results);
			studentCourseGrades.add(nextStudentAssignment);
		}
		return studentCourseGrades;
		
	}

	private StudentAssignment mapRowToScore(SqlRowSet results) {
		StudentAssignment aScore = new StudentAssignment();
		aScore.setScore(results.getInt("score"));
		aScore.setStudentId(results.getLong("studentId"));
		aScore.setAssignmentId(results.getLong("assignmentId"));
		aScore.setSubmissionText(results.getString("submissionText"));
		aScore.setSubmitted(results.getBoolean("isSubmitted"));
		return aScore;
	}
}
