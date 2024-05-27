package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import techcraft.dao.StudentDao;
import techcraft.model.Student;

import java.io.IOException;
 
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String currentPassword = request.getParameter("currentPassword"); 
		String newPassword = request.getParameter("newPassword"); 
		 
		Student student = new Student();
		student.setPassword(currentPassword); 
		
		boolean found = StudentDao.changePassword(student, newPassword);
		
		if(found) { 
			request.setAttribute("status", "gotit");
			request.getRequestDispatcher("studentProfile.jsp").forward(request, response);
		}
		else {
			request.setAttribute("status", "NoFound");
			request.getRequestDispatcher("studentProfile.jsp").forward(request, response);
		}
	}

}
