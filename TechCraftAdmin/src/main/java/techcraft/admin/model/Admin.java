package techcraft.admin.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Admin {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int adminId;
	
	@Column(length = 50)
	private String name;
	
	@Column(length = 50)
	private String email;

	@Column(length = 10)
	private String contact;

	@Column(length = 50)
	private String password; 

	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Admin(String name, String email, String contact, String password) {
		super();
		this.name = name;
		this.email = email;
		this.contact = contact;
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public int getAdminId() {
		return adminId;
	}

	public void setAdminId(int adminId) {
		this.adminId = adminId;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
