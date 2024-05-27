package techcraft.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class AssessmentResult {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int resulttId;
	
	@Column(length = 50)
    private String studentName;
	
	@Column(length = 10)
    private String type;

    @Column(length = 100)
    private String topic;

    @Column(length = 10)
    private String assignedDate;

    @Column(length = 30)
    private String instructor; 
    
    @Column(length = 5)
    private String correctAnswers;
    
    @Column(length = 5)
    private String totalQuestions;
  
	public AssessmentResult() {
		super();
		// TODO Auto-generated constructor stub
	}

	public AssessmentResult(String studentName, String type, String topic, String assignedDate, String instructor,
			String correctAnswers, String totalQuestions) {
		super();
		this.studentName = studentName;
		this.type = type;
		this.topic = topic;
		this.assignedDate = assignedDate;
		this.instructor = instructor;
		this.correctAnswers = correctAnswers;
		this.totalQuestions = totalQuestions; 
	}

	public int getResulttId() {
		return resulttId;
	}

	public void setResulttId(int resulttId) {
		this.resulttId = resulttId;
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

	public String getTopic() {
		return topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getAssignedDate() {
		return assignedDate;
	}

	public void setAssignedDate(String assignedDate) {
		this.assignedDate = assignedDate;
	}

	public String getInstructor() {
		return instructor;
	}

	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}

	public String getCorrectAnswers() {
		return correctAnswers;
	}

	public void setCorrectAnswers(String correctAnswers) {
		this.correctAnswers = correctAnswers;
	}

	public String getTotalQuestions() {
		return totalQuestions;
	}

	public void setTotalQuestions(String totalQuestions) {
		this.totalQuestions = totalQuestions;
	} 
 
}
