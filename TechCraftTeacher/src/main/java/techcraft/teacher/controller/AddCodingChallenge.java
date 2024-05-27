package techcraft.teacher.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse; 
import techcraft.teacher.model.CodingAssessmentChallenge;

import java.io.IOException;
import java.net.URLEncoder;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query; 
 
public class AddCodingChallenge extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 
		String topic = request.getParameter("CodingAssessmentTopic");
		System.out.println("Topic: " + topic);

		String instruction = request.getParameter("CodingAssessmentInstruction");
		System.out.println("Instruction: " + instruction);

		String firstDate = request.getParameter("CodingAssessmentDate");
		System.out.println("First Date: " + firstDate);

		String lastDate = request.getParameter("CodingAssessmentLastDate");
		System.out.println("Last Date: " + lastDate);

		String duration = request.getParameter("CodingAssessmentDuration");
		System.out.println("Duration: " + duration);

		String challengeTopic = request.getParameter("CodingchallengeTopic");
		System.out.println("Challenge Topic: " + challengeTopic);

		String description = request.getParameter("description");
		System.out.println("Description: " + description);

		String question = request.getParameter("CodingQuestion");
		System.out.println("Question: " + question);

		String functionDescription = request.getParameter("function_desc");
		System.out.println("Function Description: " + functionDescription);

		String inputFormat = request.getParameter("input_format");
		System.out.println("Input Format: " + inputFormat);

		String outputFormat = request.getParameter("output_format");
		System.out.println("Output Format: " + outputFormat);

		String sampleInput = request.getParameter("sample_input");
		System.out.println("Sample Input: " + sampleInput);

		String requiredOutput = request.getParameter("required_output");
		System.out.println("Required Output: " + requiredOutput);

		String explanation = request.getParameter("explanation");
		System.out.println("Explanation: " + explanation);

        
        CodingAssessmentChallenge challenge = new CodingAssessmentChallenge(topic, firstDate, challengeTopic, description, question, functionDescription, inputFormat, outputFormat, sampleInput, requiredOutput, explanation);
        
        try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession(); 
	        Transaction transaction = session.beginTransaction();
	         
	        Query<CodingAssessmentChallenge> query = session.createQuery("FROM CodingAssessmentChallenge WHERE challengeTopic = :challengeTopic AND assignedDate = :assignedDate AND topic =:topic", CodingAssessmentChallenge.class);
	        query.setParameter("challengeTopic", challengeTopic);
	        query.setParameter("assignedDate", firstDate); 
	        query.setParameter("topic", topic);
	        CodingAssessmentChallenge challenges = query.uniqueResult();

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
                             "&module=" + "Coding";

        // Redirect to the new URL
        response.sendRedirect(redirectURL);
	}

}
