package techcraft.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class PlacementForm {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int formId;
	
	@ManyToOne
	@JoinColumn(name = "studentId")
	private Student student;
	
	@Column(length = 50)
	private String companyname;
	
	@Column(length = 5)
    private String tenthYear;
    
	@Column(length = 5)
    private String tenthMark;
    
	@Column(length = 5)
    private String twelwthYear;
    
	@Column(length = 5)
    private String twelwthMark;
    
	@Column(length = 5)
    private String graduationYear; 

	@Column(length = 10)
    private String graduationStream;
    
	@Column(length = 5)
    private String graduationMarks;

	@Column(length = 5)
    private String relocate;
    
	@Column(length = 200)
    private String resume;
	
	public PlacementForm() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PlacementForm(Student student, String companyname, String tenthYear, String tenthMark, String twelwthYear,
			String twelwthMark, String graduationYear, String graduationStream, String graduationMarks, String relocate,
			String resume) {
		super();
		this.student = student;
		this.companyname = companyname;
		this.tenthYear = tenthYear;
		this.tenthMark = tenthMark;
		this.twelwthYear = twelwthYear;
		this.twelwthMark = twelwthMark;
		this.graduationYear = graduationYear;
		this.graduationStream = graduationStream;
		this.graduationMarks = graduationMarks;
		this.relocate = relocate;
		this.resume = resume;
	}

	public int getFormId() {
		return formId;
	}

	public void setFormId(int formId) {
		this.formId = formId;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getTenthYear() {
		return tenthYear;
	}

	public void setTenthYear(String tenthYear) {
		this.tenthYear = tenthYear;
	}

	public String getTenthMark() {
		return tenthMark;
	}

	public void setTenthMark(String tenthMark) {
		this.tenthMark = tenthMark;
	}

	public String getTwelwthYear() {
		return twelwthYear;
	}

	public void setTwelwthYear(String twelwthYear) {
		this.twelwthYear = twelwthYear;
	}

	public String getTwelwthMark() {
		return twelwthMark;
	}

	public void setTwelwthMark(String twelwthMark) {
		this.twelwthMark = twelwthMark;
	}

	public String getGraduationYear() {
		return graduationYear;
	}

	public void setGraduationYear(String graduationYear) {
		this.graduationYear = graduationYear;
	}

	public String getGraduationStream() {
		return graduationStream;
	}

	public void setGraduationStream(String graduationStream) {
		this.graduationStream = graduationStream;
	}

	public String getGraduationMarks() {
		return graduationMarks;
	}

	public void setGraduationMarks(String graduationMarks) {
		this.graduationMarks = graduationMarks;
	}

	public String getRelocate() {
		return relocate;
	}

	public void setRelocate(String relocate) {
		this.relocate = relocate;
	}

	public String getResume() {
		return resume;
	}

	public void setResume(String resume) {
		this.resume = resume;
	}
}
