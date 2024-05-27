package techcraft.teacher.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse; 
import techcraft.teacher.model.Assessment;  
import java.io.IOException; 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
 
public class AddAssessment extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type = request.getParameter("type");
		String topic = request.getParameter("topic");
        String instruction = request.getParameter("Instruction");
        String assignedDate = request.getParameter("assignedDate");
        String instructor = request.getParameter("instructor");
        String lastDate = request.getParameter("lastDate");
        String duration = request.getParameter("duration");
        
        Assessment assessment =  new Assessment(type, topic, instruction, assignedDate, instructor, lastDate, duration);
        
        try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession(); 
	        Transaction transaction = session.beginTransaction();
	        
	        Query<Assessment> query = session.createQuery("FROM Assessment WHERE topic = :topic AND assignedDate = :assignedDate AND type =:type", Assessment.class);
	        query.setParameter("topic", topic);
	        query.setParameter("assignedDate", assignedDate); 
	        query.setParameter("type", type);
	        Assessment assessments = query.uniqueResult();

	        if (assessments == null) { 
	        	session.save(assessment);
	            transaction.commit();
	            session.close();
	            factory.close();    
	        } 
	    } 
	    catch (Exception e) {
	        e.printStackTrace(); 
	    }
        response.sendRedirect("generateAssessment.jsp?module=" + type + "&status=success");
	}

}
