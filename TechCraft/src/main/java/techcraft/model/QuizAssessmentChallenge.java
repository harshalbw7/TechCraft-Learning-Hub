package techcraft.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity 
public class QuizAssessmentChallenge {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private Long challengeId;

    @Column(length = 100)
    private String topic;

    @Column(length = 12)
    private String assignedDate;

    @Column(length = 500)
    private String question;

    @Column(length = 200)
    private String option1;

    @Column(length = 200)
    private String option2;

    @Column(length = 200)
    private String option3;

    @Column(length = 200)
    private String option4;

    @Column(length = 200)
    private String correctOption;

	public QuizAssessmentChallenge() {
		super();
		// TODO Auto-generated constructor stub
	}

	public QuizAssessmentChallenge(String topic, String assignedDate, String question, String option1, String option2,
			String option3, String option4, String correctOption) {
		super();
		this.topic = topic;
		this.assignedDate = assignedDate;
		this.question = question;
		this.option1 = option1;
		this.option2 = option2;
		this.option3 = option3;
		this.option4 = option4;
		this.correctOption = correctOption;
	}

	public Long getChallengeId() {
		return challengeId;
	}

	public void setChallengeId(Long challengeId) {
		this.challengeId = challengeId;
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

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getOption1() {
		return option1;
	}

	public void setOption1(String option1) {
		this.option1 = option1;
	}

	public String getOption2() {
		return option2;
	}

	public void setOption2(String option2) {
		this.option2 = option2;
	}

	public String getOption3() {
		return option3;
	}

	public void setOption3(String option3) {
		this.option3 = option3;
	}

	public String getOption4() {
		return option4;
	}

	public void setOption4(String option4) {
		this.option4 = option4;
	}

	public String getCorrectOption() {
		return correctOption;
	}

	public void setCorrectOption(String correctOption) {
		this.correctOption = correctOption;
	}
    
}
