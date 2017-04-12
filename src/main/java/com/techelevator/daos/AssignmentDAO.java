package com.techelevator.daos;

import java.util.ArrayList;

import com.techelevator.models.Assignment;

public interface AssignmentDAO {
	
	public Assignment createNewAssignment(Assignment assignment);
	public Assignment getAssignmentbyAssignmentId(long id);
	public ArrayList<Assignment> getAssignmentsByLessonId(long id);
}
