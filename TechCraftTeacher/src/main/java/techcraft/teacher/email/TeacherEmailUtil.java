package techcraft.teacher.email;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class TeacherEmailUtil {
	
	public static void sendEmail(String to, String subject, String message) { 
		
		Properties properties = System.getProperties(); 
		 
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port","465");
		properties.put("mail.smtp.ssl.enable","true");
		properties.put("mail.smtp.auth","true");
		
		Session session = Session.getInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {				
				return new PasswordAuthentication("techcraft.learning.hub@gmail.com", "tsle jgrq lufl wjfq");
			}
		});
		
		session.setDebug(true); 
		MimeMessage m = new MimeMessage(session);
		
		try { 
			m.setFrom("techcraft.learning.hub@gmail.com"); 
			m.addRecipient(Message.RecipientType.TO, new InternetAddress(to)); 
			m.setSubject(subject); 
			m.setText(message); 
			Transport.send(m);
			System.out.println("Sent successfully...................");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
