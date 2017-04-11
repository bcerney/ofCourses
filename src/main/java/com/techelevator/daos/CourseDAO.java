package com.techelevator.daos;

import com.techelevator.models.Course;

public interface CourseDAO {

	public Course createNewCourse(Course course);
	public Course getCourseById(long id);
	
}
