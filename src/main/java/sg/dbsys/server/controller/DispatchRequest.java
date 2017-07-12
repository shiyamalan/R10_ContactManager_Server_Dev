package sg.dbsys.server.controller;

import javax.servlet.http.HttpServletRequest;

import sg.dbsys.dao.model.User;

public class DispatchRequest {

	public static final String SESSION_KEY = "login_session";
	public static String doDispactch(HttpServletRequest request, User user) {
		Object obj = getLoggInUser(request);

		if ( obj == null) {
			return "redirect:/login";	
		}
		return "";
	}

	public static User getLoggInUser(HttpServletRequest request) {
		User user = null;
		if (request.getSession().getAttribute(SESSION_KEY) instanceof User) {
			user = (User) request.getSession().getAttribute(SESSION_KEY);
		}
		return user;
	}
}
