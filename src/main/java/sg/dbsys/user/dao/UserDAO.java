package sg.dbsys.user.dao;

import sg.dbsys.dao.model.User;

public interface UserDAO {

	boolean login(String user, String passsword);

	User getUserByName(String name);

	User updateUser(User user);
}
