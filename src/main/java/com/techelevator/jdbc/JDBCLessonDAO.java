package com.techelevator.jdbc;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import com.techelevator.daos.LessonDAO;
import com.techelevator.models.Lesson;

public class JDBCLessonDAO extends JDBCDAO implements LessonDAO {

	@Autowired
	public JDBCLessonDAO(DataSource dataSource) {
		super(dataSource);
	}

	@Override
	public Lesson createNewLesson(Lesson lesson) {
		long id = getNextLessonId();
		String sqlCreateLesson = "INSERT INTO lessons (lessonId, name, description, moduleId) VALUES (?,?,?,?)";
		int rowsAffected = jdbcTemplate.update(sqlCreateLesson, id, lesson.getName(), lesson.getDescription(), lesson.getModuleId());
		
		if (rowsAffected == 1) {
			lesson.setLessonId(id);
			return lesson;
		} else {
			return null;
		}
	}

	@Override
	public Lesson getLessonByLessonId(long id) {
		String sqlGetLessonById = "SELECT * FROM lessons WHERE lessonId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetLessonById, id);
		if(results.next()) {
			return mapRowToLesson(results);
		} else {
			return null;
		}
	}

	@Override
	public ArrayList<Lesson> getLessonsByModuleId(long moduleId) {
		ArrayList<Lesson> lessons = new ArrayList<Lesson>();
		String sqlGetLessonsByModuleId = "SELECT * FROM lessons WHERE moduleId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetLessonsByModuleId, moduleId);
		while (results.next()) {
			Lesson nextLesson = mapRowToLesson(results);
			lessons.add(nextLesson);
		}
		return lessons;
	}

	private long getNextLessonId() {
		return super.getNextId("seq_lessonId");
	}
	
	private Lesson mapRowToLesson(SqlRowSet results) {
		Lesson aLesson = new Lesson();
		aLesson.setLessonId(results.getLong("lessonId"));
		aLesson.setName(results.getString("name"));
		aLesson.setDescription(results.getString("description"));
		aLesson.setModuleId(results.getLong("moduleId"));
		return aLesson;
	}
}
