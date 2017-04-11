package com.techelevator.daos;

import java.util.ArrayList;

import com.techelevator.models.Module;

public interface ModuleDAO {
	
	public Module createNewModule(Module module);
	public Module getModuleByModuleId(long id);
	public ArrayList <Module> getModulesByCourseId(long id);

}
