package com.techelevator.daos;

import java.util.ArrayList;
import java.util.List;

import com.techelevator.models.Course;

public interface CourseDAO {

	public Course createNewCourse(Course course);
	public Course getCourseById(long id);
	public ArrayList getCoursesByTeacher(long teacherId);
}
