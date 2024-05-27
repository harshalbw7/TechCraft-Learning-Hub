package techcraft.placement.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class PlacementCoordinator {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cordinatorId;
	
	@Column(length = 50)
	private String name;
	
	@Column(length = 50)
	private String email;

	@Column(length = 50)
	private String contact;
	
	@Column(length = 50)
	private String password; 

	public PlacementCoordinator() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PlacementCoordinator(String name, String email, String contact, String password) {
		super(); 
		this.name = name;
		this.email = email;
		this.contact = contact;
		this.password = password;
	}

	public int getCordinatorId() {
		return cordinatorId;
	}

	public void setCordinatorId(int cordinatorId) {
		this.cordinatorId = cordinatorId;
	}

	public String getName() {
		return name;
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
