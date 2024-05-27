package techcraft.admin.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import techcraft.admin.email.AdminEmailUtil;
import techcraft.admin.model.Admin; 

public class AdminDao {
	
	public static String authenticateStudent(Admin admin) {
			
		try {
		    Configuration configuration = new Configuration().configure();
		    SessionFactory factory = configuration.buildSessionFactory();
		    Session session = factory.openSession();
		    Transaction transaction = session.beginTransaction();
		    
		    Query<Admin> query = session.createQuery("FROM Admin WHERE email = :email AND password = :password", Admin.class);
		    query.setParameter("email", admin.getEmail());
		    query.setParameter("password", admin.getPassword());
		    
		    Admin authenticatedAdmin = query.uniqueResult();
		    
		    transaction.commit();
		    session.close();
		    factory.close();
		    
		    if (authenticatedAdmin != null) {
		        return authenticatedAdmin.getName();
		    } else {
		        return null;
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		    return null;
		}   
	} 
	
	public static boolean getCredentials(Admin admin) {
	    try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
	        Transaction transaction = session.beginTransaction();

	        Query<Admin> query = session.createQuery("FROM Admin WHERE email = :email", Admin.class);
	        query.setParameter("email", admin.getEmail()); 
	        
	        Admin adminCredential = query.uniqueResult();
	        
	        if (adminCredential != null) {
	        	
	            String email = adminCredential.getEmail();
	            String password = adminCredential.getPassword();
	            String subject = "TechCraft: Credentials";
	            String message = "Hello " + adminCredential.getName() + "," + System.lineSeparator()
	            + "We received a request to withdraw your password. Here are your login credentials:" + System.lineSeparator()+ System.lineSeparator()
	            + "Email: " + email + System.lineSeparator()
	            + "Password: " + password + System.lineSeparator()+ System.lineSeparator()
	            + "Please ensure to change your password after logging in for security reasons." + System.lineSeparator()
	            + "If you did not request this, please ignore this email or contact support immediately.";
 
	            transaction.commit();
	            session.close();
	            factory.close();

	            AdminEmailUtil.sendEmail(email, subject, message);
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
