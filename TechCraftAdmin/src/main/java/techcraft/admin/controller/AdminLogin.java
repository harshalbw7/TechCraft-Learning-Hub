package techcraft.admin.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import techcraft.admin.dao.AdminDao;
import techcraft.admin.model.Admin;

import java.io.IOException;
 
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		Admin admin = new Admin();
		admin.setEmail(email);
		admin.setPassword(password);
		
		String name = AdminDao.authenticateStudent(admin);
		
		if(name != null) {
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			request.getRequestDispatcher("adminHome.jsp").forward(request, response);
		}
		else {
			request.setAttribute("status", "error");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
