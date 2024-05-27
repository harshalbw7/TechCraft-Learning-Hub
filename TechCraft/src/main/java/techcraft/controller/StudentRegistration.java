package techcraft.controller;

import jakarta.servlet.ServletException; 
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import techcraft.dao.StudentDao;
import techcraft.model.Student;

import java.io.IOException;
import java.util.Date;
 
public class StudentRegistration extends HttpServlet {
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

        boolean success = StudentDao.addStudent(student);

        if (success) {
            request.setAttribute("status", "Success");
        } else {
            request.setAttribute("status", "failed");
        }
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

}