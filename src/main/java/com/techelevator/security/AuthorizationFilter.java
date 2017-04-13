package com.techelevator.security;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import com.techelevator.daos.CourseDAO;
import com.techelevator.daos.UserDAO;
import com.techelevator.jdbc.JDBCCourseDAO;
import com.techelevator.jdbc.JDBCUserDAO;
import com.techelevator.models.Course;
import com.techelevator.models.User;

public class AuthorizationFilter implements Filter {

	@Autowired
	CourseDAO courseDAO;
	
//	@Autowired
//	UserDAO userDAO;	
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		
		long sessionUserId = getUserIdFromSession(httpRequest);
		String requestCourseId = getCourseIdFromRequest(httpRequest);
				
		if(!courseDAO.courseHasGivenTeacher(requestCourseId, sessionUserId) 
				&& !courseDAO.studentIsEnrolledInCourse(requestCourseId, sessionUserId)) {
			if(sessionUserId == 0) {
				redirectToLoginPage(httpRequest, httpResponse);
			} else {
				httpResponse.sendError(403);
			}
		}
		
		chain.doFilter(request, response);
	}

	private void redirectToLoginPage(HttpServletRequest httpRequest, HttpServletResponse httpResponse)
			throws IOException {
		
		String originalRequest = httpRequest.getRequestURL().toString();
		String queryString = httpRequest.getQueryString();
		if(queryString != null) {
			originalRequest = originalRequest + "?" + queryString;
		}
		
		String context = httpRequest.getServletContext().getContextPath();
		httpResponse.sendRedirect(context+"/login?destination="+URLEncoder.encode(originalRequest, "UTF-8"));
	}

	private long getUserIdFromSession(HttpServletRequest httpRequest) {
		User user = (User)httpRequest.getSession().getAttribute("currentUser");
		return user.getUserId();
	}

	private String getCourseIdFromRequest(HttpServletRequest httpRequest) {
		String requestCourseId = null;
		String[] path = httpRequest.getServletPath().split("/");
		if(path.length >= 3) {
			if(path[2] != null) {
				requestCourseId = path[2];
			}
		}
		return requestCourseId;
	}

	@Override
	public void destroy() {
		
	}

}
