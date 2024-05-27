package techcraft.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import techcraft.email.EmailUtility;
import techcraft.model.Feedback;
import techcraft.model.SessionLogs;
import techcraft.model.Student;

public class StudentDao { 
	 
	public static boolean addStudent(Student student) {
		 
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
	      		
	      		return false;
	      	} 
	      	else {
	      		String email = student.getEmail();
	            String password = student.getPassword();
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
		      	
		      	EmailUtility.sendEmail(email, subject, message);
		      	return true;
	      	} 	
		} 
		catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public static String authenticateStudent(Student student) {
		try { 
			SessionFactory factory = new Configuration().configure().buildSessionFactory();
			Session session = factory.openSession();
	      	Transaction transaction = session.beginTransaction();
	      	
	      	Query<?> query = session.createQuery("FROM Student WHERE email = :email AND password = :password");
	      	query.setParameter("email", student.getEmail());
	      	query.setParameter("password", student.getPassword());
	      	
	      	Student authenticatedStudent = (Student) query.uniqueResult();
	      	
	      	transaction.commit();
	      	session.close();
	      	factory.close();
	      	
	      	if (authenticatedStudent != null) {
	      		return authenticatedStudent.getName();
	      	} 
	      	else {
	      		return null;
	      	}
		} 
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	} 
	
	public static boolean getCredentials(Student student) {
	    try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
	        Transaction transaction = session.beginTransaction();

	        Query<Student> query = session.createQuery("FROM Student WHERE email = :email", Student.class);
	        query.setParameter("email", student.getEmail());
	        
	        Student studentCredential = query.uniqueResult();

	        if (studentCredential != null) {
	        	
	            String email = studentCredential.getEmail();
	            String password = studentCredential.getPassword();
	            String subject = "TechCraft: Credentials";
	            String message = "Hello " + studentCredential.getName() + "," + System.lineSeparator()
	            + "We received a request to withdraw your password. Here are your login credentials:" + System.lineSeparator()+ System.lineSeparator()
	            + "Email: " + email + System.lineSeparator()
	            + "Password: " + password + System.lineSeparator()+ System.lineSeparator()
	            + "Please ensure to change your password after logging in for security reasons." + System.lineSeparator()
	            + "If you did not request this, please ignore this email or contact support immediately.";
 
	            transaction.commit();
	            session.close();
	            factory.close();

	            EmailUtility.sendEmail(email, subject, message);
	            return true;
	        } 
	        else { 
	            transaction.rollback();
	            session.close();
	            factory.close();
	            return false;
	        }
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
	
	public static String getStudentName(Student student) {
		
		try {
			SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
	        Transaction transaction = session.beginTransaction();

	        Query<Student> query = session.createQuery("FROM Student WHERE email = :email", Student.class);
	        query.setParameter("email", student.getEmail());
	        
	        Student studentCredential = query.uniqueResult();
	        
	        transaction.commit();
	        session.close();
	        factory.close();

	        if (studentCredential != null) {
	        	return studentCredential.getName();
	        } 
			return null;
		} 
		catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
	
	public static void addSessionLog(SessionLogs logs) {
		
		try {
			SessionFactory factory = new Configuration().configure().buildSessionFactory();
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();  
			
			session.save(logs);
	      	transaction.commit();
	      	session.close(); 
	      	factory.close();
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public static void updateLogoutTime(String studentName,String loginTime, String logoutTime) { 
	    
	    try {
	    	SessionFactory factory = new Configuration().configure().buildSessionFactory();
		    Session session = factory.openSession();
	        Transaction transaction = session.beginTransaction();

	        Query<?> query = session.createQuery("update SessionLogs set logoutTime = :logoutTime where studentName = :studentName and loginTime = :loginTime");
	        query.setParameter("logoutTime", logoutTime);
	        query.setParameter("studentName", studentName);
	        query.setParameter("loginTime", loginTime);
	        query.executeUpdate();

	        transaction.commit();
	        session.close();
	        factory.close(); 
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	    } 
	}
	
	public static boolean addFeedback(Feedback feedback) {
	    try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
 
	        Query<Feedback> query = session.createQuery("FROM Feedback WHERE studentName = :studentName AND rating = :rating AND comment = :comment AND suggession = :suggestion", Feedback.class);
	             
	        query.setParameter("studentName", feedback.getStudentName());
	        query.setParameter("rating", feedback.getRating());
	        query.setParameter("comment", feedback.getComment());
	        query.setParameter("suggestion", feedback.getSuggession());
	            
	        Feedback existingFeedback = query.uniqueResult();

	        if (existingFeedback == null) {
	            Transaction transaction = session.beginTransaction();

	            session.save(feedback);
	            transaction.commit();
	            session.close();
	            factory.close();

	            return true; 
	        } 
	        else {
	            session.close();
	            factory.close();
	            return true;  
	        }
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	        return false; 
	    }
	}

	public static boolean changePassword(Student student, String newPassword) {
		try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
	        Transaction transaction = session.beginTransaction();

	        Query<Student> query = session.createQuery("FROM Student WHERE password = :password", Student.class);
	        query.setParameter("password", student.getPassword()); 
	        Student studentPassword = query.uniqueResult();

	        if (studentPassword != null) {
	        	studentPassword.setPassword(newPassword);
	            session.update(studentPassword);
	            transaction.commit();
	              
	            String subject = "TechCraft: Password Changed";
	            String message = "Hello " + studentPassword.getName() + "," + System.lineSeparator()
	                    + "Your password has been successfully changed. Here are your updated login credentials:" + System.lineSeparator() + System.lineSeparator()
	                    + "Email: " + studentPassword.getEmail() + System.lineSeparator()
	                    + "New Password: " + newPassword + System.lineSeparator() + System.lineSeparator()
	                    + "Please ensure to keep your login credentials secure." + System.lineSeparator()
	                    + "If you did not request this change, please contact support immediately.";
	           
	            EmailUtility.sendEmail(studentPassword.getEmail(), subject, message);
	            return true;
	        } 
	        else { 
	            transaction.rollback();
	            session.close();
	            factory.close();
	            return false;
	        }
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	        return false;
	    }
	}
}
