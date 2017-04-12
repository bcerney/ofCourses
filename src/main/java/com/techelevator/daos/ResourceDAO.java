package com.techelevator.daos;

import java.util.ArrayList;

import com.techelevator.models.Resource;

public interface ResourceDAO {

	public Resource createNewResource(Resource resource);
	public Resource getResourceByResourceId(long id);
	public ArrayList<Resource> getResourcesByLessonId(long id);
}
