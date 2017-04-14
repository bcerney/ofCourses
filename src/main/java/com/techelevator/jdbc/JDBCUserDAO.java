package com.techelevator.jdbc;

import java.util.ArrayList;
import java.util.List;

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
		String sqlSearchExistingEmail = "SELECT * FROM users WHERE email = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchExistingEmail, email.toLowerCase());
		return results.next();
	}

	@Override
	public User createNewUser(User user, String password) {
		byte[] newSalt = hasher.generateRandomSalt();
		String hashedPassword = hasher.computeHash(password, newSalt);
		String saltString = new String(Base64.encode(newSalt));
		
		long id = getNextUserId();

		String sqlCreateUser = "INSERT INTO users (userId, firstName, lastName, email, userType, salt, password) VALUES (?,?,?,?,?,?,?)";
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
		String sqlSearchForUser = "SELECT * FROM users WHERE email = ?";
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
		String sqlGetUserOnLogin = "SELECT * FROM users WHERE email = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetUserOnLogin, email.toLowerCase());
		
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
	
	@Override
	public List getStudentsByCourseId(long courseId) {
		ArrayList <User> courseRoster = new ArrayList<>();
		String sqlGetClassRoster = "SELECT * FROM users JOIN student_course ON (users.userId = student_course.studentId) JOIN courses ON (courses.courseId = student_course.courseId) WHERE courses.courseId = ?";
		SqlRowSet results = jdbcTemplate.queryForRowSet(sqlGetClassRoster, courseId);
		while (results.next()) {
			User nextUser = mapRowToUser(results);
			courseRoster.add(nextUser);
		}
		return courseRoster;
	}
	
	@Override
	public void addUserToCourse(long studentId, long courseId) {
		String sqlAddStudentToCourse = "INSERT INTO student_course (studentId, courseId) VALUES (?, ?)";
		jdbcTemplate.update(sqlAddStudentToCourse, studentId, courseId);
	}
}
