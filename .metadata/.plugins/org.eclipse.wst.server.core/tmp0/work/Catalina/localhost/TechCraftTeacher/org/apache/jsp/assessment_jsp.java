/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/10.1.8
 * Generated at: 2024-05-17 05:16:55 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.jsp.*;

public final class assessment_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports,
                 org.apache.jasper.runtime.JspSourceDirectives {

  private static final jakarta.servlet.jsp.JspFactory _jspxFactory =
          jakarta.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("jakarta.servlet");
    _jspx_imports_packages.add("jakarta.servlet.http");
    _jspx_imports_packages.add("jakarta.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile jakarta.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public boolean getErrorOnELNotFound() {
    return false;
  }

  public jakarta.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response)
      throws java.io.IOException, jakarta.servlet.ServletException {

    if (!jakarta.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
        return;
      }
    }

    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    jakarta.servlet.jsp.JspWriter _jspx_out = null;
    jakarta.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=ISO-8859-1");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("    <html>\r\n");
      out.write("\r\n");
      out.write("    <head>\r\n");
      out.write("        <meta charset=\"UTF-8\">\r\n");
      out.write("        <title>TechCraft Learning Hub</title>\r\n");
      out.write("        <link rel=\"stylesheet\" href=\"teacherIndex.css\" type=\"text/css\">\r\n");
      out.write("    </head>\r\n");
      out.write("    \r\n");
      out.write("    <style>\r\n");
      out.write("    \r\n");
      out.write("    	.dashboard-heading {\r\n");
      out.write("			margin: 10px 20px;\r\n");
      out.write("			letter-spacing: 1px;\r\n");
      out.write("		}\r\n");
      out.write("		\r\n");
      out.write("		.dashboard-heading span {\r\n");
      out.write("			font-weight: bold;\r\n");
      out.write("			font-size: 25px;\r\n");
      out.write("			text-align: center;\r\n");
      out.write("		}\r\n");
      out.write("    	\r\n");
      out.write("    	.roadmap-main {\r\n");
      out.write("			width: auto;\r\n");
      out.write("		    height: auto;\r\n");
      out.write("		    background-size: cover; \r\n");
      out.write("		    border: 3px solid #000;\r\n");
      out.write("		    border-radius: 20px; \r\n");
      out.write("		    background-image: url(\"./media/techback.jpg\");\r\n");
      out.write("		    margin: 0px 20px;\r\n");
      out.write("		    text-align: center;\r\n");
      out.write("		} \r\n");
      out.write("		\r\n");
      out.write("		@keyframes zoomInOut {\r\n");
      out.write("		    0% {\r\n");
      out.write("		        transform: scale(1);\r\n");
      out.write("		    }\r\n");
      out.write("		    100% {\r\n");
      out.write("		        transform: scale(1.05);\r\n");
      out.write("		    }\r\n");
      out.write("		}\r\n");
      out.write("				\r\n");
      out.write("		.roadmap-main p {\r\n");
      out.write("			letter-spacing: 1px;\r\n");
      out.write("			margin: 0px 100px;\r\n");
      out.write("		}\r\n");
      out.write("		\r\n");
      out.write("		.roadmap-main h2 {\r\n");
      out.write("			letter-spacing: 1px;\r\n");
      out.write("			animation: zoomInOut 0.5s infinite alternate;\r\n");
      out.write("		}\r\n");
      out.write("		\r\n");
      out.write("		.roadmap-main fieldset {\r\n");
      out.write("	        letter-spacing: 1px;\r\n");
      out.write("	        margin: 30px 50px;\r\n");
      out.write("	        background-color: #fff;\r\n");
      out.write("	        font-weight: bold;\r\n");
      out.write("	        border: solid 4px #00bfff;\r\n");
      out.write("	        border-radius: 20px;\r\n");
      out.write("	        height: auto; \r\n");
      out.write("	        padding: 20px 40px;\r\n");
      out.write("	    }\r\n");
      out.write("	    \r\n");
      out.write("	    legend {\r\n");
      out.write("			background-color: #ffa200;\r\n");
      out.write("			border-radius: 10px;\r\n");
      out.write("			padding: 15px;\r\n");
      out.write("			font-size: 13px;\r\n");
      out.write("		}\r\n");
      out.write("		\r\n");
      out.write("		.assessment-module {\r\n");
      out.write("			display: flex;\r\n");
      out.write("			margin: 0px 20px; \r\n");
      out.write("			align-items: center;\r\n");
      out.write("			justify-content: space-between;\r\n");
      out.write("		}\r\n");
      out.write("		\r\n");
      out.write("		.module {\r\n");
      out.write("			display: flex;\r\n");
      out.write("			gap: 20px;\r\n");
      out.write("			width: 400px;  \r\n");
      out.write("			border: solid 4px #000;\r\n");
      out.write("			border-radius: 20px;\r\n");
      out.write("			padding: 20px 70px;\r\n");
      out.write("			margin: 10px 0px; \r\n");
      out.write("			margin-top: 0px;\r\n");
      out.write("			align-items: center;\r\n");
      out.write("			justify-content: center; \r\n");
      out.write("			transition: transform 0.3s ease;\r\n");
      out.write("		}\r\n");
      out.write("		\r\n");
      out.write("		.module:hover {\r\n");
      out.write("			transform: scale(1.05);\r\n");
      out.write("		}\r\n");
      out.write("		 \r\n");
      out.write("		.module-heading {\r\n");
      out.write("			color: #002233;\r\n");
      out.write("			font-size: 20px;\r\n");
      out.write("			font-weight: bold;  \r\n");
      out.write("		}\r\n");
      out.write("    	\r\n");
      out.write("    	.assessment-module button {\r\n");
      out.write("			color: #fff;\r\n");
      out.write("		    cursor: pointer;  \r\n");
      out.write("		    letter-spacing: 1px;\r\n");
      out.write("		    background-color: #00334d;\r\n");
      out.write("		    border: none;\r\n");
      out.write("		    padding: 15px 15px;\r\n");
      out.write("		    margin: 10px;  \r\n");
      out.write("		    border-radius: 10px;\r\n");
      out.write("		    font-weight: bold;\r\n");
      out.write("		    font-size: 12px;\r\n");
      out.write("		    width: 230px; \r\n");
      out.write("		    transition: transform 0.3s ease;\r\n");
      out.write("		}\r\n");
      out.write("		\r\n");
      out.write("		.assessment-module button:hover {\r\n");
      out.write("			background-color: #0bbfff;\r\n");
      out.write("			transform: scale(1.1);\r\n");
      out.write("		} \r\n");
      out.write("    </style>\r\n");
      out.write("     \r\n");
      out.write("    <body>\r\n");
      out.write("    \r\n");
      out.write("    	");

	        String name = (String) session.getAttribute("name");
	        if (name == null) {
	            response.sendRedirect("index.jsp");
	        } else {
	    
      out.write("\r\n");
      out.write("\r\n");
      out.write("        <header>\r\n");
      out.write("            <img src=\"./media/code-simple.png\" width=30px height=30px style=\"margin-left: 20px\">\r\n");
      out.write("            <h1>TechCraft</h1>\r\n");
      out.write("            <div class=\"vl\"></div>\r\n");
      out.write("            <div class=\"heading\">\r\n");
      out.write("                <a href=\"studentDetails.jsp\" style=\"margin-top: 10px;  \">Student Details</a>\r\n");
      out.write("                <a href=\"studentAttendance.jsp\" style=\"margin-top: 10px;\">Student Attendance</a>\r\n");
      out.write("                <a href=\"assessment.jsp\" style=\"border-bottom: 2px solid #ffa200; margin-top: 10px; padding-bottom: 10px;\">Technical Assessment</a>\r\n");
      out.write("                <a href=\"StudentProgress.jsp\" style=\"margin-top: 10px;\">Student's Progress</a>\r\n");
      out.write("            </div>\r\n");
      out.write("            <span style=\"flex: 1; margin-right: 0px;\"></span>\r\n");
      out.write("            <img src=\"./media/user.png\" width=20px height=20px style=\"margin-right: 15px\">\r\n");
      out.write("        	<div class=\"popup\">\r\n");
      out.write("			  <label for=\"user\" class=\"userName\">");
      out.print( name );
      out.write("<img class=\"dropdown-icon\" alt=\"\" src=\"./media/play.png\"></label>    \r\n");
      out.write("			  <div class=\"popup-content\">  \r\n");
      out.write("			    <a href=\"#\">Profile</a>\r\n");
      out.write("			    <p></p> \r\n");
      out.write("			    <a href=\"studentFeedback.jsp\">Feedbacks</a>\r\n");
      out.write("			    <p></p>\r\n");
      out.write("			    <a href=\"#\" onclick=\"openModal('logoutModal')\">Logout</a>\r\n");
      out.write("			  </div>\r\n");
      out.write("			</div> \r\n");
      out.write("        </header>\r\n");
      out.write("        \r\n");
      out.write("        <div class=\"dashboard-heading\">\r\n");
      out.write("        	<span style=\"font-size: 15px; color: #888888\">Dashboard:</span>\r\n");
      out.write("        	<span style=\"color: white\"> Technical Assessments</span>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        <div class=\"roadmap-main\">\r\n");
      out.write("        	<div class=\"roadmap-heading\"> \r\n");
      out.write("        		<h2>Generate Assessments</h2> \r\n");
      out.write("        		<p>Technical assessment of TechCraft Learning Hub is a platform to be a comprehensive resource with a wealth of learning opportunities. The interactive quizzes and coding challenges were particularly beneficial, allowing for hands-on learning.</p> \r\n");
      out.write("        		<fieldset>\r\n");
      out.write("		            <legend style=\"color: white; font-weight: bold;\">Technical Assessments</legend> \r\n");
      out.write("		        	<div class=\"assessment-module\">\r\n");
      out.write("		        		<div class=\"module\">  \r\n");
      out.write("		        			<img src=\"./media/software-engineer.svg\" alt=\"Illustration of a student\" style=\"width: 200px\">\r\n");
      out.write("		        			<div>\r\n");
      out.write("			        		<span class=\"module-heading\">Coding Assessment</span><br><br>  \r\n");
      out.write("							<form action=\"generateAssessment.jsp\"> \r\n");
      out.write("								<button type=\"submit\" name=\"module\" value=\"Coding\">Generate Assessments</button>\r\n");
      out.write("							</form>\r\n");
      out.write("							</div>\r\n");
      out.write("				        </div>\r\n");
      out.write("		        		<div style=\"height: 300px; width: 0px; border: solid 4px #002233; margin: 20px;\"></div>\r\n");
      out.write("		        		<div class=\"module\"> \r\n");
      out.write("			        		<img src=\"./media/quiz.png\" alt=\"Illustration of a student\" style=\"width: 200px; margin-bottom: 20px; margin-top: 10px\">\r\n");
      out.write("			        		<div>\r\n");
      out.write("				        		<span class=\"module-heading\" >Quiz Assessment</span><br><br> \r\n");
      out.write("				        		<form action=\"generateAssessment.jsp\"> \r\n");
      out.write("									<button type=\"submit\" name=\"module\" value=\"Quiz\">Generate Assessments</button>\r\n");
      out.write("								</form>\r\n");
      out.write("							</div>\r\n");
      out.write("			        	</div>\r\n");
      out.write("		        	</div>\r\n");
      out.write("		        </fieldset> \r\n");
      out.write("        	</div>\r\n");
      out.write("        </div>\r\n");
      out.write("         \r\n");
      out.write("        <div id=\"logoutModal\" class=\"modal-container\">\r\n");
      out.write("            <!-- Modal content -->\r\n");
      out.write("            <div class=\"modal-content\" style=\"max-width: 300px; margin: auto; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);\">\r\n");
      out.write("                <form id=\"logoutForm\" action=\"TeacherLogout\">\r\n");
      out.write("                    <p style=\"color: black\">Are you sure, you want to Logout ?</p>\r\n");
      out.write("                    <div style=\"display: flex; gap: 10px; align-item: center\">\r\n");
      out.write("                        <input type=\"button\" class=\"login\" style=\"background-color: #ffa200; border: none\" value=\"Yes\"\r\n");
      out.write("                            onclick=\"logOut()\">\r\n");
      out.write("                        <input type=\"button\" class=\"login\" style=\"background-color: #d2d2e0; border: none\" value=\"Cancel\"\r\n");
      out.write("                            onclick=\"closeModal('logoutModal')\">\r\n");
      out.write("                    </div>\r\n");
      out.write("                </form>\r\n");
      out.write("            </div>\r\n");
      out.write("        </div>\r\n");
      out.write("        \r\n");
      out.write("        <script type=\"text/javascript\">\r\n");
      out.write("	        function openModal(modalId) {\r\n");
      out.write("	            var modal = document.getElementById(modalId);\r\n");
      out.write("	            modal.style.display = 'block';\r\n");
      out.write("	        }\r\n");
      out.write("	\r\n");
      out.write("	        function closeModal(modalId) {\r\n");
      out.write("	            var modal = document.getElementById(modalId);\r\n");
      out.write("	            modal.style.display = 'none';\r\n");
      out.write("	        }  \r\n");
      out.write("	        \r\n");
      out.write("	        function logOut() {\r\n");
      out.write("                document.getElementById(\"logoutForm\").submit();\r\n");
      out.write("            }\r\n");
      out.write("        </script>\r\n");
      out.write("        \r\n");
      out.write("        <footer style=\"background-color: #002233; display: flex; justify-content: space-between; margin: 0px 50px; color: #ffa200;\">\r\n");
      out.write("        	<div class=\"footer-content\">\r\n");
      out.write("        		<h4>About Us</h4>\r\n");
      out.write("        		<div>\r\n");
      out.write("        			<p>Technolearn Trainings is one of the best training institutes in Sinhagad Road/Anand Nagar, Pune. We provide professional courses for students, working professionals, job seekers and corporate employees with placement assurance.</p>\r\n");
      out.write("        		</div>\r\n");
      out.write("        	</div>\r\n");
      out.write("        	<div class=\"footer-content\">\r\n");
      out.write("        		<h4>Features</h4>\r\n");
      out.write("        		<div>\r\n");
      out.write("        			<a href=\"teacherHome.jsp\">Technology Roadmaps</a><p></p>\r\n");
      out.write("	                <a href=\"videoLecture.jsp\">Video Lectures</a><p></p>\r\n");
      out.write("	                <a href=\"codingEnhancement.jsp\">Coding Enhancement</a><p></p>\r\n");
      out.write("	                <a href=\"technicalQuiz.jsp\">Technical Quiz</a><p></p>\r\n");
      out.write("        		</div>\r\n");
      out.write("        	</div>\r\n");
      out.write("        	<div class=\"footer-content\">\r\n");
      out.write("        		<h4>Contact </h4>\r\n");
      out.write("        		<div>\r\n");
      out.write("        			<div style=\"margin-top: 20px;\">\r\n");
      out.write("                    <img src=\"./media/pin.png\" width=\"20px\" height=\"20px\">\r\n");
      out.write("                    <span id=\"tick-text\">Technolearn Trainings 133, Peshwa, 2nd Floor, Office No. 09, Near Chaitanya Hospital, Next to Parvati Bridge, Sinhgad Road, Parvati, Pune - 411030.</span>\r\n");
      out.write("	                </div>\r\n");
      out.write("	                <div style=\"margin-top: 20px;\">\r\n");
      out.write("	                    <img src=\"./media/phone.png\" width=\"20px\" height=\"20px\">\r\n");
      out.write("	                    <span id=\"tick-text\">91 88570 96492</span>\r\n");
      out.write("	                </div>\r\n");
      out.write("	                <div style=\"margin-top: 20px;\">\r\n");
      out.write("	                    <img src=\"./media/email (1).png\" width=\"20px\" height=\"20px\">\r\n");
      out.write("	                    <span id=\"tick-text\">Info.technolearn@gmail.com</span>\r\n");
      out.write("	                </div>\r\n");
      out.write("        		</div>\r\n");
      out.write("        	</div>\r\n");
      out.write("        	<div class=\"footer-content\">\r\n");
      out.write("        		<h4>Follow Us</h4>\r\n");
      out.write("        		<div class=\"footer-social-media\">\r\n");
      out.write("        			<a href=\"#\"><img src=\"./media/twitter.png\"></a>\r\n");
      out.write("                    <a href=\"#\"><img src=\"./media/facebook.png\"></a>\r\n");
      out.write("                    <a href=\"#\"><img src=\"./media/linkedin.png\"></a>\r\n");
      out.write("                    <a href=\"#\"><img src=\"./media/instagram.png\"></a>\r\n");
      out.write("        		</div>\r\n");
      out.write("        	</div>\r\n");
      out.write("        </footer>\r\n");
      out.write("        \r\n");
      out.write("        <footer>\r\n");
      out.write("            <p>&copy; 2024 TechCraft Learning Hub. @ Harshal Wandhare</p>\r\n");
      out.write("        </footer>\r\n");
      out.write("        \r\n");
      out.write("		");
 } 
      out.write("\r\n");
      out.write("    </body>\r\n");
      out.write("    </html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof jakarta.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
