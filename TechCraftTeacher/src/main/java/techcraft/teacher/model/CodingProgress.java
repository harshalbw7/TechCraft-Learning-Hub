package techcraft.teacher.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class CodingProgress {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int progressId;
	
	@Column(length = 50)
	private String studentName;
	
	@Column(length = 30)
	private String technology;
	
	@Column(length = 30)
	private String topic; 
	
	@Column(length = 50)
	private String date;

	@Column(length = 1)
	private boolean status; 

	public CodingProgress() {
		// TODO Auto-generated constructor stub
	}

	public CodingProgress(String studentName, String technology, String topic, String date, boolean status) {
		super();
		this.studentName = studentName;
		this.technology = technology;
		this.topic = topic;
		this.date = date;
		this.status = status;
	}

	public int getProgressId() {
		return progressId;
	}

	public void setProgressId(int progressId) {
		this.progressId = progressId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getTechnology() {
		return technology;
	}

	public void setTechnology(String technology) {
		this.technology = technology;
	}

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

}
