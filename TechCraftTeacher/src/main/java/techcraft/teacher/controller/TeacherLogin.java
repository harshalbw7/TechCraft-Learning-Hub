package techcraft.teacher.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession; 
import techcraft.teacher.dao.TeacherDao;
import techcraft.teacher.model.Teacher;

import java.io.IOException;
 
public class TeacherLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Teacher teacher = new Teacher();
		teacher.setEmail(email);
		teacher.setPassword(password);
		
		String name = TeacherDao.authenticateStudent(teacher);
		
		if(name != null) {
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			request.getRequestDispatcher("studentDetails.jsp").forward(request, response);
		}
		else {
			request.setAttribute("status", "error");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
