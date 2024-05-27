package techcraft.teacher.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity 
public class CodingAssessmentChallenge {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) 
    private Long challengeId;

    @Column(length = 100)
    private String topic;

    @Column(length = 12)
    private String assignedDate;

    @Column(length = 100)
    private String challengeTopic;

    @Column(length = 300)
    private String description;

    @Column(length = 500)
    private String question;

    @Column(length = 500)
    private String functionDescription;

    @Column(length = 300)
    private String inputFormat;

    @Column(length = 300)
    private String outputFormat;

    @Column(length = 200)
    private String sampleInput;

    @Column(length = 200)
    private String requiredOutput;

    @Column(length = 500)
    private String explanation;

	public CodingAssessmentChallenge() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CodingAssessmentChallenge(String topic, String assignedDate, String challengeTopic, String description,
			String question, String functionDescription, String inputFormat, String outputFormat, String sampleInput,
			String requiredOutput, String explanation) {
		super();
		this.topic = topic;
		this.assignedDate = assignedDate;
		this.challengeTopic = challengeTopic;
		this.description = description;
		this.question = question;
		this.functionDescription = functionDescription;
		this.inputFormat = inputFormat;
		this.outputFormat = outputFormat;
		this.sampleInput = sampleInput;
		this.requiredOutput = requiredOutput;
		this.explanation = explanation;
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

	public String getChallengeTopic() {
		return challengeTopic;
	}

	public void setChallengeTopic(String challengeTopic) {
		this.challengeTopic = challengeTopic;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	public String getFunctionDescription() {
		return functionDescription;
	}

	public void setFunctionDescription(String functionDescription) {
		this.functionDescription = functionDescription;
	}

	public String getInputFormat() {
		return inputFormat;
	}

	public void setInputFormat(String inputFormat) {
		this.inputFormat = inputFormat;
	}

	public String getOutputFormat() {
		return outputFormat;
	}

	public void setOutputFormat(String outputFormat) {
		this.outputFormat = outputFormat;
	}

	public String getSampleInput() {
		return sampleInput;
	}

	public void setSampleInput(String sampleInput) {
		this.sampleInput = sampleInput;
	}

	public String getRequiredOutput() {
		return requiredOutput;
	}

	public void setRequiredOutput(String requiredOutput) {
		this.requiredOutput = requiredOutput;
	}

	public String getExplanation() {
		return explanation;
	}

	public void setExplanation(String explanation) {
		this.explanation = explanation;
	}
    
}
