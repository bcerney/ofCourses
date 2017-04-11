package com.techelevator.jdbc;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

public class JDBCDAO {
	protected JdbcTemplate jdbcTemplate;
	
	protected JDBCDAO(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	protected int getNextId(String sequence) {
		String sqlNextId = "SELECT nextval('" + sequence + "')";
		SqlRowSet result = jdbcTemplate.queryForRowSet(sqlNextId);
		result.next();
		return result.getInt(1);
	}
}
