package techcraft.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class StudentProgress {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int progressId;
	
	@ManyToOne
	@JoinColumn(name = "studentId")
	private Student student;
	
	@Column(length = 5)
	private String videoProgress;
	
	@Column(length = 5)
	private String codingProgress;
	
	@Column(length = 5)
	private String quizProgress;
	
	@Column(length = 20)
	private String badgeEarned;
	
	@Column(length = 5)
	private boolean status;

	public StudentProgress() {
		super();
		// TODO Auto-generated constructor stub
	}

	public StudentProgress(Student student, String videoProgress, String codingProgress, String quizProgress,
			String badgeEarned, boolean status) {
		super();
		this.student = student;
		this.videoProgress = videoProgress;
		this.codingProgress = codingProgress;
		this.quizProgress = quizProgress;
		this.badgeEarned = badgeEarned;
		this.status = status;
	}

	public int getProgressId() {
		return progressId;
	}

	public void setProgressId(int progressId) {
		this.progressId = progressId;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getVideoProgress() {
		return videoProgress;
	}

	public void setVideoProgress(String videoProgress) {
		this.videoProgress = videoProgress;
	}

	public String getCodingProgress() {
		return codingProgress;
	}

	public void setCodingProgress(String codingProgress) {
		this.codingProgress = codingProgress;
	}

	public String getQuizProgress() {
		return quizProgress;
	}

	public void setQuizProgress(String quizProgress) {
		this.quizProgress = quizProgress;
	}

	public String getBadgeEarned() {
		return badgeEarned;
	}

	public void setBadgeEarned(String badgeEarned) {
		this.badgeEarned = badgeEarned;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
}
