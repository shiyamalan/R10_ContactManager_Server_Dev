package sg.dbsys.person.dao;

import java.sql.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import sg.dbsys.dao.model.Person;

@Repository
public class PersonDAOImpl implements PersonDAO {

	private static final Logger logger = LoggerFactory
			.getLogger(PersonDAOImpl.class);

	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sf) {
		this.sessionFactory = sf;
	}

	@Override
	public void addPerson(Person p) {
		Session session = this.sessionFactory.getCurrentSession();
		session.persist(p);
		logger.info("Person saved successfully, Person Details=" + p);
	}

	@Override
	public void updatePerson(Person p) {
		Session session = this.sessionFactory.getCurrentSession();

		Query query = session
				.createQuery("update Person as P set fname = :fname, "
						+ "lname = :lname, " + "pemailid = :email,"
						+ "mobileno = :phoneno" + "country = :country,"
						+ "title = :title" + "company = :company,"
						+ "city = :city " + "profile = :profile,"
						+ "comment = :comment" + "channel = :channel"
						+ "lastupdate = :lastupdate" + " where p.id = :id");

	
		query.setParameter("id", p.getId());
		query.setParameter("fname", p.getFirstName());
		query.setParameter("lname", p.getLastName());
		query.setParameter("phoneno", p.getMobileNo());
		query.setParameter("country", p.getCountry());
		query.setParameter("city", p.getCity());
		query.setParameter("profile", p.getProfile());
		query.setParameter("comment", p.getComment());
		query.setParameter("channel", p.getChannel());
		query.setParameter("lastupdate",
				new Date(new java.util.Date().getTime()));
		session.update(p);
		logger.info("Person updated successfully, Person Details=" + p);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Person> listPersons() {
		Session session = this.sessionFactory.getCurrentSession();
		List<Person> personsList = session.createQuery("from Person").list();
		for (Person p : personsList) {
			logger.info("Person List::" + p);
		}
		return personsList;
	}

	@Override
	public Person getPersonById(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Person p = (Person) session.load(Person.class, new Integer(id));
		logger.info("Person loaded successfully, Person details=" + p);
		return p;
	}

	@Override
	public void removePerson(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		Person p = (Person) session.load(Person.class, new Integer(id));
		if (null != p) {
			session.delete(p);
		}
		logger.info("Person deleted successfully, person details=" + p);
	}

}
