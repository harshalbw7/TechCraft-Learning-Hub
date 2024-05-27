package techcraft.teacher.model; 

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id; 

@Entity
public class SessionLogs {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int sessionId;
	
	@Column(length = 50)
    private String studentName;

	@Column(length = 20)
	private String loginTime;
	
	@Column(length = 20)
	private String logoutTime; 
	
	@Column(length = 20)
	private String loginDate;
	
	public SessionLogs() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SessionLogs(int sessionId, String studentName, String loginTime, String logoutTime, String loginDate) {
		super();
		this.sessionId = sessionId;
		this.studentName = studentName;
		this.loginTime = loginTime;
		this.logoutTime = logoutTime;
		this.loginDate = loginDate;
	}

	public int getSessionId() {
		return sessionId;
	}

	public void setSessionId(int sessionId) {
		this.sessionId = sessionId;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(String loginTime) {
		this.loginTime = loginTime;
	}

	public String getLogoutTime() {
		return logoutTime;
	}

	public void setLogoutTime(String logoutTime) {
		this.logoutTime = logoutTime;
	}

	public String getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(String loginDate) {
		this.loginDate = loginDate;
	}
	
}
