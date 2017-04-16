package com.techelevator.daos;

import java.util.List;

import com.techelevator.models.Assignment;

public interface AssignmentDAO {
	
	public Assignment createNewAssignment(Assignment assignment);
	public Assignment getAssignmentbyAssignmentId(long id);
	public List<Assignment> getAssignmentsByLessonId(long id);
}
