package techcraft.model;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Assessment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int assessmentId;
	
	@Column(length = 10)
    private String type;

    @Column(length = 100)
    private String topic;

    @Column(length = 300)
    private String instruction;

    @Column(length = 10)
    private String assignedDate;

    @Column(length = 30)
    private String instructor;

    @Column(length = 10)
    private String lastDate;
    
    @Column(length = 5)
    private String duration;

	public Assessment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Assessment(String type, String topic, String instruction, String assignedDate, String instructor, String lastDate, String duration) {
		super();
		this.type = type;
		this.topic = topic;
		this.instruction = instruction;
		this.assignedDate = assignedDate;
		this.instructor = instructor;
		this.lastDate = lastDate;
		this.duration = duration;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public int getAssessmentId() {
		return assessmentId;
	}

	public void setAssessmentId(int assessmentId) {
		this.assessmentId = assessmentId;
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

	public String getInstruction() {
		return instruction;
	}

	public void setInstruction(String instruction) {
		this.instruction = instruction;
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

	public String getLastDate() {
		return lastDate;
	}

	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
    
}
