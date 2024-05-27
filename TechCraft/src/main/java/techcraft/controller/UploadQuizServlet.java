package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import techcraft.model.Quiz; 
import java.io.IOException; 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
 
public class UploadQuizServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String correctOption = request.getParameter("correctOption");
        String explanation = request.getParameter("explanation");
        String option1 = request.getParameter("option1");
        String option2 = request.getParameter("option2");
        String option3 = request.getParameter("option3");
        String option4 = request.getParameter("option4");
        String question = request.getParameter("question");
        //String technology = request.getParameter("technology");
        //String topic = request.getParameter("topic");
         
        Quiz quiz = new Quiz("Angular", "Components and Directives", question, option1, option2, option3, option4, correctOption, explanation);
          
         SessionFactory factory = new Configuration().configure().buildSessionFactory();
         Session session = factory.openSession();
         Transaction transaction = session.beginTransaction();
         session.save(quiz);
         transaction.commit();
         session.close();
         factory.close();
        
        response.sendRedirect("demo.jsp");
	}

}
