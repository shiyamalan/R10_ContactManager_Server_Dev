package sg.dbsys.server.controller.validator;

import sg.dbsys.dao.model.User;
import sg.dbsys.userbo.service.UserService;

public class UserNameValidator {

	UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public boolean isUserExist(String userName) {
		User user = userService.getUserByName(userName);
		return user != null && user.getId()>0 ? true : false;
	}

}
