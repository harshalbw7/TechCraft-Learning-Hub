package techcraft.teacher.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import techcraft.teacher.email.TeacherEmailUtil;
import techcraft.teacher.model.Teacher;


public class TeacherDao {
	
	public static String authenticateStudent(Teacher teacher) {
		try { 
			SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
	        Transaction transaction = session.beginTransaction();
	        
	        Query<?> query = session.createQuery("FROM Teacher WHERE email = :email AND password = :password");
	        query.setParameter("email", teacher.getEmail());
	        query.setParameter("password", teacher.getPassword());
	        
	        Teacher authenticatedTeacher = (Teacher) query.uniqueResult();
	        
	        transaction.commit();
	        session.close();
	        factory.close();
	        
	        if (authenticatedTeacher != null) {
	            return authenticatedTeacher.getName();
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
	
	public static boolean getCredentials(Teacher teacher) {
	    try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
	        Transaction transaction = session.beginTransaction();

	        Query<Teacher> query = session.createQuery("FROM Teacher WHERE email = :email", Teacher.class);
	        query.setParameter("email", teacher.getEmail()); 
	        
	        Teacher teacherCredential = query.uniqueResult();
	        
	        if (teacherCredential != null) {
	        	
	            String email = teacherCredential.getEmail();
	            String password = teacherCredential.getPassword();
	            String subject = "TechCraft: Credentials";
	            String message = "Hello " + teacherCredential.getName() + "," + System.lineSeparator()
	            + "We received a request to withdraw your password. Here are your login credentials:" + System.lineSeparator()+ System.lineSeparator()
	            + "Email: " + email + System.lineSeparator()
	            + "Password: " + password + System.lineSeparator()+ System.lineSeparator()
	            + "Please ensure to change your password after logging in for security reasons." + System.lineSeparator()
	            + "If you did not request this, please ignore this email or contact support immediately.";
 
	            transaction.commit();
	            session.close();
	            factory.close();

	            TeacherEmailUtil.sendEmail(email, subject, message);
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
