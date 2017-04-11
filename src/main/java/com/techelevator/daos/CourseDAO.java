package com.techelevator.daos;

import com.techelevator.models.Course;

public interface CourseDAO {

	public void createNewCourse(Course course);
	public Course getCourseById(long id);
	
}
