package com.techelevator.jdbc;

import javax.sql.DataSource;

import org.bouncycastle.util.encoders.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.techelevator.daos.UserDAO;
import com.techelevator.models.User;
import com.techelevator.security.PasswordHasher;

@Component
public class JDBCUserDAO extends JDBCDAO implements UserDAO {

	private PasswordHasher hasher = new PasswordHasher();
	
	@Autowired
	public JDBCUserDAO(DataSource dataSource) {
		super(dataSource);
	}
	
	@Override
	public boolean emailAlreadyExists(String email) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public User createNewUser(User user, String password) {
		byte[] newSalt = hasher.generateRandomSalt();
		String hashedPassword = hasher.computeHash(password, newSalt);
		String saltString = new String(Base64.encode(newSalt));
		
		long id = getNextUserId();
		String sqlCreateUser = "INSERT INTO users (userId, firstName, lastName, email, userType, salt, password) VALUES (?,?,?,?,?,?,?,?)";
		int rowsAffected = jdbcTemplate.update(sqlCreateUser, id, user.getFirstName(), user.getLastName(), user.getEmail().toLowerCase(), user.getUserType(), saltString, hashedPassword);
		
		if(rowsAffected == 1) {
			user.setUserId(id);
			return user;
		} else {
			return null;
		}
	}

	@Override
	public User getUserById(long id) {
		String sqlGetUserById = "SELECT * FROM users WHERE userId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetUserById, id);
		if (results.next()) {
			return mapRowToUser(results);
		} else {
			return null;
		}
	}
	
	@Override
	public boolean userIsAuthenticated(String email, String password) {
		String sqlSearchForUser = "SELECT * "+
								  "FROM users "+
								  "WHERE lower(email) = ?";
		
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForUser, email.toLowerCase());
		if(results.next()) {
			String storedSalt = results.getString("salt");
			String storedPassword = results.getString("password");
			String hashedPassword = hasher.computeHash(password, Base64.decode(storedSalt));
			return storedPassword.equals(hashedPassword);
		} else {
			return false;
		}
	}
	
	@Override
	public User getUserOnLogin(String email, String password) {
		String sqlGetUserOnLogin = "SELECT * FROM users WHERE email = ? AND password = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetUserOnLogin, email.toLowerCase(), password);
		
		if (results.next()) {
			return mapRowToUser(results);
		} else {
			return null;
		}
	}	

	private long getNextUserId() {
		return super.getNextId("seq_userId");
	}

	private User mapRowToUser(SqlRowSet results) {
		User aUser = new User();
		aUser.setUserId(results.getLong("userId"));
		aUser.setFirstName(results.getString("firstName"));
		aUser.setLastName(results.getString("lastName"));
		aUser.setEmail(results.getString("email"));
		aUser.setUserType(results.getString("userType"));
		return aUser;
	}
	
}
