package techcraft.teacher.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse; 
import techcraft.teacher.dao.TeacherDao;
import techcraft.teacher.model.Teacher;

import java.io.IOException;
 
public class ForgotPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email"); 
		
		Teacher teacher = new Teacher();
		teacher.setEmail(email); 
		
		boolean found = TeacherDao.getCredentials(teacher);
		
		if(found) { 
			request.setAttribute("status", "found");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		else {
			request.setAttribute("status", "notFound");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
