package techcraft.placement.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import techcraft.placement.dao.PlacementDao;
import techcraft.placement.model.PlacementCoordinator; 

import java.io.IOException;
 
public class PlacementForgotPassword extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email"); 
		
		PlacementCoordinator coordinator = new PlacementCoordinator();
		coordinator.setEmail(email); 
		
		boolean found = PlacementDao.getCredentials(coordinator);
		
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
