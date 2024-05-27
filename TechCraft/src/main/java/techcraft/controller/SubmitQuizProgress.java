package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import techcraft.model.QuizProgress;

import java.io.IOException;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

public class SubmitQuizProgress extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String studentName = request.getParameter("studentName");
        String technology = request.getParameter("technology");
        String topic = request.getParameter("topic");

        Date date = new Date();
        QuizProgress progress = new QuizProgress(studentName, technology, topic, date.toString());

        try {
            SessionFactory factory = new Configuration().configure().buildSessionFactory();
            Session session = factory.openSession();

            Query<QuizProgress> query = session.createQuery("FROM QuizProgress WHERE studentName = :studentName AND technology = :technology AND topic = :topic", QuizProgress.class);
            query.setParameter("studentName", studentName);
            query.setParameter("technology", technology);
            query.setParameter("topic", topic);
            QuizProgress existingProgress = query.uniqueResult();

            if (existingProgress == null) {
                Transaction transaction = session.beginTransaction();

                session.save(progress);
                transaction.commit();
                session.close();
                factory.close();
            }   
            String redirectUrl = "Quizes.jsp?submitButton=" + technology + "&topic=" + topic + "&status=" + "success";
            response.sendRedirect(redirectUrl);
        } 
        catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("status", "error");
        }
    }
}
