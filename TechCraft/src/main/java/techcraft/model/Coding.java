package techcraft.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Coding {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int codingId;
	
	@Column(length = 30)
	private String technology;
	
	@Column(length = 30)
	private String topic;
	
	@Column(length = 200)
	private String description;
	
	@Column(length = 500)
	private String question;
	
	@Column(length = 500)
	private String FunctionDetail;
	
	@Column(length = 200)
	private String inputFormat;
	
	@Column(length = 200)
	private String outputFormat;
	
	@Column(length = 200)
	private String input;

	@Column(length = 200)
	private String output;
	
	@Column(length = 500)
	private String explination;
	
	public Coding() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Coding(String technology, String topic, String description, String question, String functionDetail,
			String inputFormat, String outputFormat, String input, String output, String explination) {
		super();
		this.technology = technology;
		this.topic = topic;
		this.description = description;
		this.question = question;
		FunctionDetail = functionDetail;
		this.inputFormat = inputFormat;
		this.outputFormat = outputFormat;
		this.input = input;
		this.output = output;
		this.explination = explination;
	}

	public int getCodingId() {
		return codingId;
	}

	public void setCodingId(int codingId) {
		this.codingId = codingId;
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

	public String getFunctionDetail() {
		return FunctionDetail;
	}

	public void setFunctionDetail(String functionDetail) {
		FunctionDetail = functionDetail;
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

	public String getInput() {
		return input;
	}

	public void setInput(String input) {
		this.input = input;
	}

	public String getOutput() {
		return output;
	}

	public void setOutput(String output) {
		this.output = output;
	}

	public String getExplination() {
		return explination;
	}

	public void setExplination(String explination) {
		this.explination = explination;
	}

	 
}
