package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import techcraft.dao.StudentDao;
import techcraft.model.SessionLogs;
import techcraft.model.Student;
import java.io.IOException; 
import java.time.LocalDate;
import java.time.LocalTime;  
 
public class StudentLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Student student = new Student();
		student.setEmail(email);
		student.setPassword(password);
		
		String name = StudentDao.authenticateStudent(student); 
		
		if(name != null) {
			HttpSession session = request.getSession();
			session.setAttribute("name", name); 
			session.setAttribute("nextLectureClicked", "false"); 
			
			//Session Log
			SessionLogs logs = new SessionLogs();
			logs.setStudentName(StudentDao.getStudentName(student));
			logs.setLoginDate(LocalDate.now().toString());
			logs.setLoginTime(LocalTime.now().toString());
			logs.setLogoutTime("-");
			StudentDao.addSessionLog(logs);
			session.setAttribute("sessionLogs", logs);
			
			request.setAttribute("status", "success");
			request.getRequestDispatcher("studentHome.jsp").forward(request, response);
		}
		else {
			request.setAttribute("status", "error");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
