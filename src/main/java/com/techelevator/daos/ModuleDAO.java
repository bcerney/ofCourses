package com.techelevator.daos;

import java.util.List;

import com.techelevator.models.Module;

public interface ModuleDAO {
	
	public Module createNewModule(Module module);
	public Module getModuleByModuleId(long id);
	public List <Module> getModulesByCourseId(long id);

}
