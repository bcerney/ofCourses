package com.techelevator.daos;

import java.util.ArrayList;
import java.util.List;

import com.techelevator.models.Resource;

public interface ResourceDAO {

	public Resource createNewResource(Resource resource);
	public Resource getResourceByResourceId(long id);
	public List<Resource> getResourcesByLessonId(long id);
}
