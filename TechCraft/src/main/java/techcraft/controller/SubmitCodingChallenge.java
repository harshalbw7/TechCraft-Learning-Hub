package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse; 
import techcraft.model.CodingProgress;

import java.io.IOException;
import java.util.Date;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
 
public class SubmitCodingChallenge extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String studentName = request.getParameter("studentName");
	    String technology = request.getParameter("technology");
	    String topic = request.getParameter("topic");

	    Date date = new Date();
	    CodingProgress progress = new CodingProgress(studentName, technology, topic, date.toString(), true);

	    try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
 
	        Query<CodingProgress> query = session.createQuery("FROM CodingProgress WHERE studentName = :studentName AND technology = :technology AND topic = :topic", CodingProgress.class);
	        query.setParameter("studentName", studentName);
	        query.setParameter("technology", technology);
	        query.setParameter("topic", topic);
	        CodingProgress existingProgress = query.uniqueResult();

	        if (existingProgress == null) {
	            Transaction transaction = session.beginTransaction();

	            session.save(progress);
	            transaction.commit();
	            session.close();
	            factory.close();    
	        } 
	        response.sendRedirect("codingQuestions.jsp?submitButton=" + technology);
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	        response.sendRedirect("codingQuestions.jsp?error=databaseError");
	    }
	}
}
