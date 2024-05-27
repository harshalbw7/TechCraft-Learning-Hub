package techcraft.admin.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import techcraft.admin.email.AdminEmailUtil;
import techcraft.admin.model.Student;  
import java.io.IOException;
import java.util.Date; 
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;
 
public class AddStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String name = firstName + " " + lastName;
        String email = request.getParameter("email");
        String number = request.getParameter("number");
        String password = request.getParameter("password");
        
        Date date = new Date();
        Student student = new Student(name, email, number, password, date.toString());
        
        try { 
			SessionFactory factory = new Configuration().configure().buildSessionFactory();
			Session session = factory.openSession();
	      	Transaction transaction = session.beginTransaction();
	      	
	      	Query<?> query = session.createQuery("FROM Student WHERE email = :email");
	      	query.setParameter("email", student.getEmail()); 
	      	
	      	Student authenticatedStudent = (Student) query.uniqueResult();
	      	
	      	if (authenticatedStudent != null) {
	      		
	      		transaction.commit();
		      	session.close();
		      	factory.close();
		      	request.setAttribute("status", "failed"); 
	      	} 
	      	else { 
	            String subject = "TechCraft: Credentials";
	            String message = "Dear " + student.getName() + "," + System.lineSeparator()+ System.lineSeparator()
	            + "Welcome to TechCraft Learning Hub!" + System.lineSeparator()
	            + "Thank you for registering with us. You can now access a wide range of educational resources and tools to enhance your learning experience." + System.lineSeparator()+ System.lineSeparator()
	            + "Your Username: " + email + System.lineSeparator()
	            + "Your Password: " + password + System.lineSeparator()+ System.lineSeparator()
	            + "Please log in using the above username and password." + System.lineSeparator()
	            + "We wish you a fruitful learning journey with us. Happy learning!" + System.lineSeparator()
	            + "If you have any questions or need assistance, feel free to contact our support team." + System.lineSeparator()+ System.lineSeparator()
	            + "Best regards," + System.lineSeparator()
	            + "TechCraft Learning Hub Team";
	            
		      	session.save(student);
		      	transaction.commit();
		      	session.close(); 
		      	factory.close();
		      	
		      	AdminEmailUtil.sendEmail(email, subject, message);
		      	request.setAttribute("status", "Success");
	      	} 	
		} 
		catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("status", "failed");
		}
        request.getRequestDispatcher("addStudent.jsp").forward(request, response);
	}

}