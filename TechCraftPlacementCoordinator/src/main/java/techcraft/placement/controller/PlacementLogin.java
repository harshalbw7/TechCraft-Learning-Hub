package techcraft.placement.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import techcraft.placement.dao.PlacementDao;
import techcraft.placement.model.PlacementCoordinator; 

import java.io.IOException;
 
public class PlacementLogin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		PlacementCoordinator coordinator = new PlacementCoordinator();
		coordinator.setEmail(email);
		coordinator.setPassword(password);
		
		String name = PlacementDao.authenticateStudent(coordinator);
		
		if(name != null) {
			HttpSession session = request.getSession();
			session.setAttribute("name", name);
			request.getRequestDispatcher("placementHome.jsp").forward(request, response);
		}
		else {
			request.setAttribute("status", "error");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

}
