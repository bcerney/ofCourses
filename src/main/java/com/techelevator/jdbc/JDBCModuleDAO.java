package com.techelevator.jdbc;

import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import com.techelevator.daos.ModuleDAO;
import com.techelevator.models.Module;

@Component
public class JDBCModuleDAO extends JDBCDAO implements ModuleDAO {
	
	@Autowired
	public JDBCModuleDAO(DataSource dataSource) {
		super(dataSource);
	}
	
	@Override
	public Module createNewModule(Module module) {
		long id = getNextModuleId();
		String sqlCreateModule = "INSERT INTO modules (moduleId, name, description, courseId) VALUES (?,?,?,?)";
		int rowsAffected = jdbcTemplate.update(sqlCreateModule, id, module.getName(), module.getDescription(), module.getCourseId());
		
		if (rowsAffected == 1) {
			module.setModuleId(id);
			return module;
		}else {
			return null;
		}
	}
	
	@Override
	public Module getModuleByModuleId(long id) {
		Module module = null;
		String sqlGetModuleById = "SELECT * FROM modules WHERE moduleId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetModuleById, id);
		if(results.next()) {
			module = mapRowToModule(results);
		}
		return module;
	}
	
	@Override
	public ArrayList<Module> getModulesByCourseId(long id) {
		ArrayList <Module> modules = new ArrayList <Module>();
		String sqlGetModulesByCourseId = "SELECT * FROM modules WHERE courseId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetModulesByCourseId, id);
		while (results.next()) {
			Module nextModule = mapRowToModule(results);
			modules.add(nextModule);
		}
		return modules;
	}
	
	private long getNextModuleId() {
		return super.getNextId("seq_moduleId");
	}
	
	private Module mapRowToModule(SqlRowSet results) {
		Module aModule = new Module();
		aModule.setModuleId(results.getLong("courseId"));
		aModule.setName(results.getString("name"));
		aModule.setDescription(results.getString("description"));
		aModule.setCourseId(results.getInt("courseId"));
		return aModule;
	}
	
}
