package techcraft.admin.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import techcraft.admin.dao.AdminDao;
import techcraft.admin.model.Admin; 

import java.io.IOException;
 
public class AdminForgotPssword extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email"); 
		
		Admin admin = new Admin();
		admin.setEmail(email); 
		
		boolean found = AdminDao.getCredentials(admin);
		
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
