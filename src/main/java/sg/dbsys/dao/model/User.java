package sg.dbsys.dao.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "systemusers	")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;

	@Column(name = "username", nullable = false, unique = true)
	private String userName;

	@Column(nullable = false)
	private String password;

	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	private String phoneno = "+00-0000000";

	@Transient
	private String oldId;
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	/* private Role role; */

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setDefaultId(String string) {
		this.oldId = string;
	}

	public String getDefaultId() {
		return oldId;
	}

	/*
	 * public Role getRole() { return role; }
	 * 
	 * public void setRole(Role role) { this.role = role; }
	 */

}
