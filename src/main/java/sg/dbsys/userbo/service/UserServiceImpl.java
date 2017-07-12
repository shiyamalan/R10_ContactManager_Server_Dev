package sg.dbsys.userbo.service;

import sg.dbsys.dao.model.User;
import sg.dbsys.user.dao.UserDAO;

public class UserServiceImpl implements UserService {

	UserDAO userDAO;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}

	@Override
	public boolean login(String userName, String password) {
		return userDAO.login(userName, password);
	}

	@Override
	public User getUserByName(String userName) {
		return userDAO.getUserByName(userName);
	}

	@Override
	public User updateUser(User user) {
		// TODO Auto-generated method stub
		return userDAO.updateUser(user);
	}

}
