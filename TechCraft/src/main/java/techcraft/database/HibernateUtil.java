package techcraft.database;

import java.util.Date;
import java.util.Scanner;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration; 

import techcraft.model.RoadmapSubTopics;
import techcraft.model.Student; 

public class HibernateUtil {
	
	public static void addStudent(SessionFactory factory) {
		Scanner scanner = new Scanner(System.in);      
		Student student = new Student() ;
		Date date = new Date();
      
		System.out.print("Name : ");
		student.setName(scanner.nextLine());
		System.out.print("Email : ");
		student.setEmail(scanner.nextLine());
		System.out.print("Number : ");
      	student.setNumber(scanner.nextLine());
      	System.out.print("Password : ");
      	student.setPassword(scanner.nextLine()); 
      	student.setJoiningDate(date.toString());
      
      	Session session = factory.openSession();
      	Transaction transaction = session.beginTransaction();
      	session.save(student);
      
      	transaction.commit();
      	session.close();
      	scanner.close();
	}
	
	public static void addTopicDescription(SessionFactory factory) {
		
		Scanner scanner = new Scanner(System.in);  
		Session session = factory.openSession();
      	Transaction transaction = session.beginTransaction();
      	
      	String description = scanner.nextLine();
      	 
      	RoadmapSubTopics entityToUpdate = session.get(RoadmapSubTopics.class, scanner.nextInt());

        if (entityToUpdate != null) { 
            entityToUpdate.setDescription(description); 
            session.update(entityToUpdate); 
          	transaction.commit();
        } 
        else {
            System.out.println("Record not found.");
        } 
      	session.close(); 
      	scanner.close();
	}
	
	public static void showUser(SessionFactory factory) {
		Session session = factory.openSession();
    	Student student = session.load(Student.class, 4);
    	System.out.print(student.getName());
	}
	
	public static void main(String[] args) {
		SessionFactory factory = new Configuration().configure().buildSessionFactory();
		System.out.println(factory);
//		addStudent(factory);
//		showUser(factory);
//		addTopicDescription(factory);
		factory.close();
	}
}
