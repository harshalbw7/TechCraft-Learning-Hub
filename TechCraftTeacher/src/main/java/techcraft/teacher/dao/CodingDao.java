package techcraft.teacher.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.hibernate.cfg.Configuration;

public class CodingDao {
 
	public static int totalChallenges(String technology) {
	    int rowCount = 0;
	    try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
	
	        Query<Long> countQuery = session.createQuery("SELECT COUNT(*) FROM Coding WHERE technology = :technology", Long.class);
	        countQuery.setParameter("technology", technology);
	        rowCount = Math.toIntExact(countQuery.uniqueResult());
	
	        session.close();
	        factory.close();
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	    }
	    System.out.print("total challenges :"+rowCount);
	    return rowCount;
	}
	
    public static int totalSubmittedChallenges(String technology , String studentName) {
        int rowCount = 0;
        try {
            SessionFactory factory = new Configuration().configure().buildSessionFactory();
            Session session = factory.openSession();

            Query<Long> countQuery = session.createQuery("SELECT COUNT(*) FROM CodingProgress WHERE technology = :technology AND studentName = :studentName", Long.class);
            countQuery.setParameter("technology", technology);
            countQuery.setParameter("studentName", studentName);
            rowCount = Math.toIntExact(countQuery.uniqueResult());

            session.close();
            factory.close();
        } 
        catch (Exception e) {
            e.printStackTrace();
        }
        System.out.print("total submited challenges :"+rowCount);
        return rowCount;
    }
}
