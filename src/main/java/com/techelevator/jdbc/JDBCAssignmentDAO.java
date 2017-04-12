package com.techelevator.jdbc;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.daos.AssignmentDAO;
import com.techelevator.models.Assignment;

public class JDBCAssignmentDAO extends JDBCDAO implements AssignmentDAO{

	@Autowired
	public JDBCAssignmentDAO(DataSource dataSource) {
		super(dataSource);
	}

	@Override
	public Assignment createNewAssignment(Assignment assignment) {
		long id = getNextAssignmentId();
		String sqlCreateAssignment = "INSERT INTO assignments (assignmentId, name, description, assignDate, dueDate, maxScore) VALUES (?,?,?,?,?,?)";
		int rowsAffected = jdbcTemplate.update(sqlCreateAssignment, id, assignment.getName(), assignment.getDescription(), assignment.getAssignDate(), assignment.getDueDate(), assignment.getMaxScore());
		if (rowsAffected == 1) {
			assignment.setAssignmentId(id);
			return assignment;
		} else {
			return null;
		}
	}

	@Override
	public Assignment getAssignmentbyAssignmentId(long id) {
		String sqlGetAssignmentById = "SELECT * FROM assignments WHERE assignmentId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAssignmentById, id);
		if(results.next()) {
			return mapRowToAssignment(results);
		} else {
			return null;
		}
	}

	@Override
	public ArrayList<Assignment> getAssignmentsByLessonId(long lessonId) {
		ArrayList<Assignment> assignments = new ArrayList<Assignment>();
		String sqlGetAssignmentsByLessonId = "SELECT * FROM assignments WHERE lessonId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetAssignmentsByLessonId, lessonId);
		while (results.next()) {
			Assignment nextAssignment = mapRowToAssignment(results);
			assignments.add(nextAssignment);
		}
		return assignments;
	}

	private long getNextAssignmentId() {
		return super.getNextId("seq_assignmentId");
	}
	
	private Assignment mapRowToAssignment(SqlRowSet results) {
		Assignment anAssignment = new Assignment();
		anAssignment.setAssignmentId(results.getLong("assignmentId"));
		anAssignment.setName(results.getString("name"));
		anAssignment.setDescription(results.getString("description"));
		anAssignment.setAssignDate(results.getDate("assignDate").toLocalDate());
		anAssignment.setDueDate(results.getDate("dueDate").toLocalDate());
		anAssignment.setMaxScore(results.getLong("maxScore"));
		return anAssignment;
	}
	
}
