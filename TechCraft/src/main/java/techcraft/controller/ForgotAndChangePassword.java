package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import techcraft.dao.StudentDao;
import techcraft.model.Student;

import java.io.IOException;
 
public class ForgotAndChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email"); 
		
		Student student = new Student();
		student.setEmail(email); 
		
		boolean found = StudentDao.getCredentials(student);
		
		if(found) { 
			request.setAttribute("status", "found");
			request.getRequestDispatcher("studentProfile.jsp").forward(request, response);
		}
		else {
			request.setAttribute("status", "notFound");
			request.getRequestDispatcher("studentProfile.jsp").forward(request, response);
		}
	}
}
