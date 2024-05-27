package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import techcraft.dao.StudentDao;
import techcraft.model.Feedback; 
import java.io.IOException; 
import java.util.Date;
 
public class StudentFeedback extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String studentName = request.getParameter("studentName");
        String rating = request.getParameter("rating");
        String comment = request.getParameter("comment");
        String suggestion = request.getParameter("suggession");
        
        Date date = new Date();
        Feedback feedback = new Feedback(studentName, rating, comment, suggestion, date.toString());

        boolean success = StudentDao.addFeedback(feedback);

        if (success) {
            request.setAttribute("status", "Success");
        } else {
            request.setAttribute("status", "failed");
        }
        request.getRequestDispatcher("Feedback.jsp").forward(request, response);
	}

}
