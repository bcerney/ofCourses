package com.techelevator.daos;

import java.util.ArrayList;

import com.techelevator.models.Score;

public interface ScoreDAO {
	
	public Score createScore(Score score);
	public Score getScoreForStudentByAssignmentId(long studentId, long assignmentId);
//	public ArrayList<Score> getAllScoresForStudentByCourseId(long assignmentId);
}
