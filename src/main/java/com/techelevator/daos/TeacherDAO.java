package com.techelevator.daos;

import com.techelevator.models.Teacher;

public interface TeacherDAO {
	
	public void createNewTeacher(Teacher teacher);
	public Teacher getTeacherById(long id);
}
