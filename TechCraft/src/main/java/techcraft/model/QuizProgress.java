package techcraft.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class QuizProgress {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int progressId;
	
	@Column(length = 50)
	private String studentName;
	
	@Column(length = 30)
	private String technology;
	
	@Column(length = 50)
	private String topic; 
	
	@Column(length = 50)
	private String date;
	
	public QuizProgress() {
		// TODO Auto-generated constructor stub
	}

	public QuizProgress(String studentName, String technology, String topic, String date) {
		super();
		this.studentName = studentName;
		this.technology = technology;
		this.topic = topic;
		this.date = date;
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
	
}
