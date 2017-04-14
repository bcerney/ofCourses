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
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.SpringBeanAutowiringSupport;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.filter.GenericFilterBean;

import com.techelevator.daos.CourseDAO;
import com.techelevator.daos.UserDAO;
import com.techelevator.jdbc.JDBCCourseDAO;
import com.techelevator.jdbc.JDBCUserDAO;
import com.techelevator.models.Course;
import com.techelevator.models.User;

public class AuthorizationFilter implements Filter {

	@Autowired
	CourseDAO courseDAO;
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {	
		WebApplicationContext context = WebApplicationContextUtils.getRequiredWebApplicationContext(filterConfig.getServletContext());
		courseDAO = context.getBean(CourseDAO.class);
	}


	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		HttpServletResponse httpResponse = (HttpServletResponse)response;
		
		Long sessionUserId = getUserIdFromSession(httpRequest);
		String requestCourseId = getCourseIdFromRequest(httpRequest);
		
		// Accessing a restricted resource, not logged in
		if(requestCourseId != null && sessionUserId == null) {
			redirectToLoginPage(httpRequest, httpResponse);
		// Accessing a restricted resource without access
		} else if(requestCourseId != null && 
				!courseDAO.courseHasGivenTeacher(Long.parseLong(requestCourseId), sessionUserId) &&
				!courseDAO.studentIsEnrolledInCourse(Long.parseLong(requestCourseId), sessionUserId)){
			httpResponse.sendError(403);
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

	private Long getUserIdFromSession(HttpServletRequest httpRequest) {
		User user = (User)httpRequest.getSession().getAttribute("currentUser");
		return user == null ? null : user.getUserId();
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
