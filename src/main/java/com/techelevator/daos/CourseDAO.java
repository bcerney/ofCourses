package com.techelevator.daos;

import java.util.List;

import com.techelevator.models.Course;

public interface CourseDAO {

	public Course createNewCourse(Course course);
	public Course getCourseById(long id);
	public List<Course> getCoursesByTeacherId(long teacherId);
	public List<Course> getAllCourses();
	public List<Course> getCoursesByUserId(long userId);
	public boolean courseHasGivenTeacher(long courseId, long teacherId);
	public boolean studentIsEnrolledInCourse(long courseId, long studentId);
	public boolean isCourseFull(long courseID);
	
}
