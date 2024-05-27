package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import techcraft.model.VideoProgress;

import java.io.IOException;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
 
public class SetSessionValueServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String lastLecture = request.getParameter("lastLecture");
		String studentName = request.getParameter("studentName");
	    String technology = request.getParameter("technology"); 
	    String topic = request.getParameter("topic");
	    
        HttpSession session = request.getSession();
        session.setAttribute("nextLectureClicked", "false");
        
        if(lastLecture.equals("false")) { 
            response.sendRedirect("Videos.jsp?technology=" + technology);
        }
        
        if(lastLecture.equals("true")) { 
        	
        	Date date = new Date();
    	    VideoProgress progress = new VideoProgress(studentName, technology, topic, date.toString());

    	    try {
    	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
    	        Session session1 = factory.openSession();
     
    	        Query<VideoProgress> query = session1.createQuery("FROM VideoProgress WHERE studentName = :studentName AND technology = :technology AND topic = :topic", VideoProgress.class);
    	        query.setParameter("studentName", studentName);
    	        query.setParameter("technology", technology);
    	        query.setParameter("topic", topic);
    	        VideoProgress existingProgress = query.uniqueResult();

    	        if (existingProgress == null) {
    	            Transaction transaction = session1.beginTransaction();

    	            session1.save(progress);
    	            transaction.commit();
    	            session1.close();
    	            factory.close();    
    	        } 
    	        response.sendRedirect("Videos.jsp?technology=" + technology);
    	    } 
    	    catch (Exception e) {
    	        e.printStackTrace();
    	        response.sendRedirect("Videos.jsp?technology=" + technology);
    	    } 
        }
	}
}
