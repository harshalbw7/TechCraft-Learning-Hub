package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
 
public class SetSessionValueServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        session.setAttribute("nextLectureClicked", "false");

        // Redirect to the desired JSP page
        String technology = request.getParameter("technology");
        response.sendRedirect("Videos.jsp?technology=" + technology);
	}

}
