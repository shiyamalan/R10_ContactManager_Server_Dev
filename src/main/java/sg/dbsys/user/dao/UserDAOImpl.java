package sg.dbsys.user.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.transaction.annotation.Transactional;

import sg.dbsys.dao.model.User;

public class UserDAOImpl implements UserDAO {

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}
	@Override
	public boolean login(String user, String passsword) {
		User logUser = getUserByName(user);
		return logUser != null && logUser.getUserName().equals(user)
				&& logUser.getPassword().equals(passsword) ? true : false;
	}
	@Override
	public User getUserByName(String name) {
		Session session = this.sessionFactory.openSession();
		Query query = session
				.createQuery("From User u where u.userName = :username");
		query.setParameter("username", name);
		List<User> usrList = (List<User>) query.list();
		User result = !(usrList.size() > 0) ? null : usrList.get(0);
		session.close();
		return result;
	}
	@Override
	@Transactional
	public User updateUser(User user) {
		/*
		 * Session session = this.sessionFactory.openSession(); Transaction tx =
		 * session.beginTransaction(); session.persist(user); tx.commit();
		 * session.close(); return user;
		 */
		Session session = this.sessionFactory.openSession();
		Query query = session
				.createQuery("update User as U set userName = :username, "
						+ "password = :password, " + "email = :email,"
						+ "phoneno = :phoneno"

						+ " where U.id = :id");

		System.out.println("-------------------Updating User:- " + user);
		query.setParameter("password", user.getPassword());
		query.setParameter("username", user.getUserName());
		query.setParameter("email", user.getEmail());
		query.setParameter("phoneno", user.getPhoneno());
		query.setParameter("id", user.getId());
		int result = query.executeUpdate();

		session.close();

		return getUserByName(user.getUserName());
	}

}
