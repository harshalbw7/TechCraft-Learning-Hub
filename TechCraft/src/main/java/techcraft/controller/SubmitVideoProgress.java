package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse; 
import techcraft.model.VideoProgress; 
import java.io.IOException; 
import java.util.Date; 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
 
public class SubmitVideoProgress extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String studentName = request.getParameter("studentName");
	    String technology = request.getParameter("technology");
	    String number = request.getParameter("number");
	    String topic = request.getParameter("topic");
	    
	    Date date = new Date();
	    VideoProgress progress = new VideoProgress(studentName, technology, topic, date.toString());

	    try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
 
	        Query<VideoProgress> query = session.createQuery("FROM VideoProgress WHERE studentName = :studentName AND technology = :technology AND topic = :topic", VideoProgress.class);
	        query.setParameter("studentName", studentName);
	        query.setParameter("technology", technology);
	        query.setParameter("topic", topic);
	        VideoProgress existingProgress = query.uniqueResult();

	        if (existingProgress == null) {
	            Transaction transaction = session.beginTransaction();

	            session.save(progress);
	            transaction.commit();
	            session.close();
	            factory.close();    
	        } 
	         
	        String redirectUrl = "Videos.jsp?technology=" + technology + "&number=" + number;
	        response.sendRedirect(redirectUrl);
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	        String redirectUrl = "Videos.jsp?technology=" + technology + "&number=" + number;
	        response.sendRedirect(redirectUrl);
	    }
	}

}
