package techcraft.placement.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import techcraft.placement.email.PlacementEmailUtil;
import techcraft.placement.model.PlacementCoordinator; 

public class PlacementDao {
	
	public static String authenticateStudent(PlacementCoordinator coordinator) {
		
		try {
		    Configuration configuration = new Configuration().configure();
		    SessionFactory factory = configuration.buildSessionFactory();
		    Session session = factory.openSession();
		    Transaction transaction = session.beginTransaction();
		    
		    Query<PlacementCoordinator> query = session.createQuery(
		        "FROM PlacementCoordinator WHERE email = :email AND password = :password",
		        PlacementCoordinator.class
		    );
		    query.setParameter("email", coordinator.getEmail());
		    query.setParameter("password", coordinator.getPassword());
		    
		    PlacementCoordinator authenticatedCoordinator = query.uniqueResult();
		    
		    transaction.commit();
		    session.close();
		    factory.close();
		    
		    if (authenticatedCoordinator != null) {
		        return authenticatedCoordinator.getName();
		    } else {
		        return null;
		    }
		} catch (Exception e) {
		    e.printStackTrace();
		    return null;
		}
	} 
	
	public static boolean getCredentials(PlacementCoordinator coordinator) {
	    try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
	        Transaction transaction = session.beginTransaction();

	        Query<PlacementCoordinator> query = session.createQuery("FROM PlacementCoordinator WHERE email = :email", PlacementCoordinator.class);
	        query.setParameter("email", coordinator.getEmail()); 
	        
	        PlacementCoordinator placementCredential = query.uniqueResult();
	        
	        if (placementCredential != null) {
	        	
	            String email = placementCredential.getEmail();
	            String password = placementCredential.getPassword();
	            String subject = "TechCraft: Credentials";
	            String message = "Hello " + placementCredential.getName() + "," + System.lineSeparator()
	            + "We received a request to withdraw your password. Here are your login credentials:" + System.lineSeparator()+ System.lineSeparator()
	            + "Email: " + email + System.lineSeparator()
	            + "Password: " + password + System.lineSeparator()+ System.lineSeparator()
	            + "Please ensure to change your password after logging in for security reasons." + System.lineSeparator()
	            + "If you did not request this, please ignore this email or contact support immediately.";
 
	            transaction.commit();
	            session.close();
	            factory.close();

	            PlacementEmailUtil.sendEmail(email, subject, message);
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
