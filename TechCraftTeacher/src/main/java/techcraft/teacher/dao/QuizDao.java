package techcraft.teacher.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class QuizDao {
	
	public static int totalQuestions(String technology, String topic) {
	    int rowCount = 0;
	    try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
	
	        Query<Long> countQuery = session.createQuery("SELECT COUNT(*) FROM Quiz WHERE technology = :technology AND topic =:topic", Long.class);
	        countQuery.setParameter("technology", technology);
	        countQuery.setParameter("topic", topic);
	        rowCount = Math.toIntExact(countQuery.uniqueResult());
	
	        session.close();
	        factory.close();
	    } 
	    catch (Exception e) {
	        e.printStackTrace();
	    }
	    System.out.print("total"+topic+" Questions :"+rowCount);
	    return rowCount;
	}
	
	public static int totalTopics(String technology) {
	    int rowCount = 0;
	    try {
	        SessionFactory factory = new Configuration().configure().buildSessionFactory();
	        Session session = factory.openSession();
	
	        Query<Long> countQuery = session.createQuery("SELECT COUNT(distinct(topic)) FROM Quiz WHERE technology = :technology", Long.class);
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
	
    public static int totalSubmittedTopics(String technology , String studentName) {
        int rowCount = 0;
        try {
            SessionFactory factory = new Configuration().configure().buildSessionFactory();
            Session session = factory.openSession();

            Query<Long> countQuery = session.createQuery("SELECT COUNT(*) FROM QuizProgress WHERE technology = :technology AND studentName = :studentName", Long.class);
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
