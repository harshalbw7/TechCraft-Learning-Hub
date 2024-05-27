package techcraft.teacher.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse; 
import techcraft.teacher.model.QuizAssessmentChallenge;

import java.io.IOException; 
import java.net.URLEncoder;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
 
public class AddQuizQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String topic = request.getParameter("CodingAssessmentTopic"); 
		String instruction = request.getParameter("CodingAssessmentInstruction"); 
		String firstDate = request.getParameter("CodingAssessmentDate"); 
		String lastDate = request.getParameter("CodingAssessmentLastDate"); 
		String duration = request.getParameter("CodingAssessmentDuration"); 
		
		String question = request.getParameter("question");
	    String option1 = request.getParameter("option1");
	    String option2 = request.getParameter("option2");
	    String option3 = request.getParameter("option3");
	    String option4 = request.getParameter("option4");
	    String correctOption = request.getParameter("correctOption");
	    
	    QuizAssessmentChallenge challenge = new QuizAssessmentChallenge(topic, firstDate, question, option1, option2, option3, option4, correctOption);
        
        try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession(); 
	        Transaction transaction = session.beginTransaction();
	         
	        Query<QuizAssessmentChallenge> query = session.createQuery("FROM QuizAssessmentChallenge WHERE question = :question AND assignedDate = :assignedDate AND topic =:topic", QuizAssessmentChallenge.class);
	        query.setParameter("question", question);
	        query.setParameter("assignedDate", firstDate); 
	        query.setParameter("topic", topic);
	        QuizAssessmentChallenge challenges = query.uniqueResult();

	        if (challenges == null) { 
	        	session.save(challenge);
	            transaction.commit();
	            session.close();
	            factory.close();    
	        } 
	    } 
	    catch (Exception e) {
	        e.printStackTrace(); 
	    }
         
        String encodedTopic = URLEncoder.encode(topic, "UTF-8");
        String encodedInstruction = URLEncoder.encode(instruction, "UTF-8");
        String encodedFirstDate = URLEncoder.encode(firstDate, "UTF-8");
        String encodedLastDate = URLEncoder.encode(lastDate, "UTF-8");
        String encodedDuration = URLEncoder.encode(duration, "UTF-8");

        // Construct the redirect URL with query parameters
        String redirectURL = "generateAssessment.jsp?topic=" + encodedTopic +
                             "&instruction=" + encodedInstruction +
                             "&firstDate=" + encodedFirstDate +
                             "&lastDate=" + encodedLastDate +
                             "&duration=" + encodedDuration +
                             "&status=" + "added" +
                             "&module=" + "Quiz";

        // Redirect to the new URL
        response.sendRedirect(redirectURL); 
	} 
}
