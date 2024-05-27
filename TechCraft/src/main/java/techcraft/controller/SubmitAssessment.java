package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import techcraft.model.AssessmentResult; 
import java.io.IOException; 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
 
public class SubmitAssessment extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
        String module = request.getParameter("module");
        String topic = request.getParameter("topic");
        String date = request.getParameter("date");
        String instructor = request.getParameter("instructor");
        String totalQuestions = request.getParameter("totalQuestions");
        String correctAnswers = request.getParameter("correctAnswers");
  
	    AssessmentResult result = new AssessmentResult(name, module, topic, date, instructor, correctAnswers, totalQuestions);

	    try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
 
	        Query<AssessmentResult> query = session.createQuery("FROM AssessmentResult WHERE studentName = :studentName AND assignedDate = :assignedDate AND topic = :topic AND type = :type", AssessmentResult.class);
	        query.setParameter("studentName", name);
	        query.setParameter("assignedDate", date);
	        query.setParameter("topic", topic);
	        query.setParameter("type", module);
	        AssessmentResult existingResult = query.uniqueResult();

	        if (existingResult == null) {
	            Transaction transaction = session.beginTransaction();

	            session.save(result);
	            transaction.commit();
	            session.close();
	            factory.close();    
	        } 
	        response.sendRedirect("assessmentDashboard.jsp?module=" + module);
	    } 
	    catch (Exception e) {
	        e.printStackTrace(); 
	        response.sendRedirect("assessmentDashboard.jsp?module=" + module);
	    }
	}

}
