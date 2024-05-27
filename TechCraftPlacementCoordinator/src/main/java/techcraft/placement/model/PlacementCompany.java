package techcraft.placement.model; 

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id; 

@Entity
public class PlacementCompany {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int companyId;
	
	@Column(length = 50)
    private String name;

	@Column(length = 30)
    private String title;
    
    @Column(length = 200)
    private String technologies;
    
    @Column(length = 10)
    private String salary;
    
    @Column(length = 20)
    private String location;
    
    @Column(length = 20)
    private String endDate;

	@Column(length = 5)
    private boolean status; 

    public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTechnologies() {
		return technologies;
	}

	public void setTechnologies(String technologies) {
		this.technologies = technologies;
	}

	public String getSalary() {
		return salary;
	}

	public void setSalary(String salary) {
		this.salary = salary;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public PlacementCompany() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PlacementCompany(String name, String title, String technologies, String salary, String location,
			String endDate, boolean status) {
		super();
		this.name = name;
		this.title = title;
		this.technologies = technologies;
		this.salary = salary;
		this.location = location;
		this.endDate = endDate;
		this.status = status;
	}
}

