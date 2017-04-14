package com.techelevator.daos;

import java.util.ArrayList;
import java.util.List;

import com.techelevator.models.Lesson;

public interface LessonDAO {
	
	public Lesson createNewLesson(Lesson lesson);
	public Lesson getLessonByLessonId(long id);
	public ArrayList<Lesson> getLessonsByModuleId(long id);
}
