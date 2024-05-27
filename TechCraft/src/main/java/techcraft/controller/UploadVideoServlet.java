package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse; 
import techcraft.model.Videos;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
 
public class UploadVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
        String resource = request.getParameter("resource");
        String technology = request.getParameter("technology");
        String topic = request.getParameter("topic");
        
        Videos videos = new Videos(technology, topic, resource);
        
        SessionFactory factory = new Configuration().configure().buildSessionFactory();
		Session session = factory.openSession();
      	Transaction transaction = session.beginTransaction();
      	
      	session.save(videos);
      	transaction.commit();
      	session.close(); 
      	factory.close();
        
        response.sendRedirect("demo.jsp");
	}
}
