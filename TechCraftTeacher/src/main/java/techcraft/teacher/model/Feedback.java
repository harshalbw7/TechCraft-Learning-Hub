package techcraft.teacher.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id; 

@Entity
public class Feedback {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int feedbackId;
	
	@Column(length = 50)
	private String studentName;
	
	@Column(length = 5)
	private String rating;
 
	@Column(length = 200)
	private String comment;

	@Column(length = 250)
	private String suggession;
	
	@Column(length = 50)
	private String date;

	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Feedback(String studentName, String rating, String comment, String suggession, String date) {
		super();
		this.studentName = studentName;
		this.rating = rating;
		this.comment = comment;
		this.suggession = suggession;
		this.date = date;
	}

	public int getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(int feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getRating() {
		return rating;
	}

	public void setRating(String rating) {
		this.rating = rating;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public String getSuggession() {
		return suggession;
	}

	public void setSuggession(String suggession) {
		this.suggession = suggession;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

}
