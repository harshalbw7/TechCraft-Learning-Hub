package techcraft.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id; 

@Entity
public class Certificate {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int certificateId;
	
	@Column(length = 50)
	private String studentName;
	
	@Column(length = 6)
	private String type;
	
	@Column(length = 50)
	private String technology;
	
	@Column(length = 10)
	private String date;
	 
	public Certificate() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Certificate(String studentName, String type, String technology, String date) {
		super();
		this.studentName = studentName;
		this.type = type;
		this.technology = technology;
		this.date = date;
	}

	public int getCertificateId() {
		return certificateId;
	}

	public void setCertificateId(int certificateId) {
		this.certificateId = certificateId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getTechnology() {
		return technology;
	}

	public void setTechnology(String technology) {
		this.technology = technology;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}
 
}
