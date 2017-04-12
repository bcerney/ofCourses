package com.techelevator.jdbc;

import javax.sql.DataSource;

import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.daos.ScoreDAO;
import com.techelevator.models.Score;

public class JDBCScoreDAO extends JDBCDAO implements ScoreDAO {

	public JDBCScoreDAO(DataSource dataSource) {
		super(dataSource);
	}

	@Override
	public Score createScore(Score score) {
		String sqlCreateScore = "INSERT INTO scores (score, studentId, assignmentId) VALUES (?,?,?)";
		int rowsAffected = jdbcTemplate.update(sqlCreateScore, score.getScore(), score.getStudentId(), score.getAssignmentId());
		if (rowsAffected == 1) {
			return score;
		} else {
			return null;
		}
	}

	@Override
	public Score getScoreForStudentByAssignmentId(long studentId, long assignmentId) {
		String sqlGetScoreForStudent = "SELECT * FROM scores WHERE studentId = ? AND assignmentId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetScoreForStudent, studentId, assignmentId);
		if(results.next()) {
			return mapRowToScore(results);
		} else {
			return null;
		}
	}

	private Score mapRowToScore(SqlRowSet results) {
		Score aScore = new Score();
		aScore.setScore(results.getInt("score"));
		aScore.setStudentId(results.getLong("studentId"));
		aScore.setAssignmentId(results.getLong("assignmentId"));
		return aScore;
	}
}
