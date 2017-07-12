package sg.dbsys.userbo.service;

import sg.dbsys.dao.model.User;

public interface UserService {

	boolean login(String userName, String password);

	User getUserByName(String userName);

	User updateUser(User user);

}
