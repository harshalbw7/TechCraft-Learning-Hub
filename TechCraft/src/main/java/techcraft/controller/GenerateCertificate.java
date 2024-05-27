package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse; 
import techcraft.model.Certificate; 
import java.io.IOException; 
import java.time.LocalDate;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
 
public class GenerateCertificate extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
        String name = request.getParameter("name");
        String type = request.getParameter("type");
        String technology = request.getParameter("technology");
        String date = LocalDate.now().toString();
        
        Certificate certificate = new Certificate(name, type, technology, date);
	    try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
 
	        Query<Certificate> query = session.createQuery("FROM Certificate WHERE studentName = :studentName AND technology = :technology AND type = :type", Certificate.class);
	        query.setParameter("studentName", name);
	        query.setParameter("technology", technology); 
	        query.setParameter("type", type);
	        Certificate existingCertificate = query.uniqueResult();

	        if (existingCertificate == null) {
	            Transaction transaction = session.beginTransaction();

	            session.save(certificate);
	            transaction.commit();
	            session.close();
	            factory.close();    
	        } 
	        if(type.equals("Coding")) {
	        	response.sendRedirect("codingQuestions.jsp?submitButton=" + technology);
	        }
	        if(type.equals("Quiz")) {
	        	response.sendRedirect("Quizes.jsp?submitButton=" + technology);
	        }
	        if(type.equals("Video")) {
	        	response.sendRedirect("Videos.jsp?technology=" + technology);
	        }
	    } 
	    catch (Exception e) {
	        e.printStackTrace();  
	    }
	}

}
