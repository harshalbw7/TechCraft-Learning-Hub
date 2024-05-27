package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import techcraft.dao.StudentDao;
import techcraft.model.SessionLogs; 
import java.io.IOException; 
import java.time.LocalTime;
 
public class StudentLogout extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		
		if (session != null) {
	        SessionLogs logs = (SessionLogs) session.getAttribute("sessionLogs");

	        if (logs != null) {
	            logs.setLogoutTime(LocalTime.now().toString());
	            StudentDao.updateLogoutTime(logs.getStudentName(),logs.getLoginTime(), logs.getLogoutTime());
	        }

	        session.invalidate();
	    }
        response.sendRedirect("index.jsp"); 
	}
}
