package com.techelevator.jdbc;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.daos.ResourceDAO;
import com.techelevator.models.Resource;

@Component
public class JDBCResourceDAO extends JDBCDAO implements ResourceDAO {

	@Autowired
	public JDBCResourceDAO(DataSource dataSource) {
		super(dataSource);
		// TODO Auto-generated constructor stub
	}

	@Override
	public Resource createNewResource(Resource resource) {
		long id = getNextResourceId();
		String sqlCreateResource = "INSERT INTO resources (resourceId, url, title, description, lessonId) VALUES (?,?,?,?,?)";
		int rowsAffected = jdbcTemplate.update(sqlCreateResource, id, resource.getUrl().toLowerCase(), resource.getTitle(), resource.getDescription(), resource.getLessonId());
		if (rowsAffected == 1) {
			resource.setResourceId(id);
			return resource;
		} else {
			return null;
		}
	}

	@Override
	public Resource getResourceByResourceId(long id) {
		String sqlGetResourceById = "SELECT * FROM resources WHERE resource = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetResourceById, id);
		if(results.next()) {
			return mapRowToResource(results);
		} else {
			return null;
		}
	}

	@Override
	public List<Resource> getResourcesByLessonId(long lessonId) {
		ArrayList<Resource> resources = new ArrayList<Resource>();
		String sqlGetResourcesByLessonId = "SELECT * FROM resources WHERE lessonId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetResourcesByLessonId, lessonId);
		while (results.next()) {
			Resource nextResource = mapRowToResource(results);
			resources.add(nextResource);
		}
		return resources;	
	}

	private long getNextResourceId() {
		return super.getNextId("seq_resourceId");
	}

	private Resource mapRowToResource(SqlRowSet results) {
		Resource aResource = new Resource();
		aResource.setResourceId(results.getLong("resourceId"));
		aResource.setUrl(results.getString("url"));
		aResource.setTitle(results.getString("title"));
		aResource.setDescription(results.getString("description"));
		aResource.setLessonId(results.getLong("lessonId"));
		return aResource;
	}
}
