<%@page import="techcraft.teacher.model.Feedback"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.Session, org.hibernate.Transaction, org.hibernate.cfg.Configuration, org.hibernate.query.Query, techcraft.teacher.model.Student, java.util.List" %>
<!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>TechCraft Learning Hub</title>
        <link rel="stylesheet" href="teacherIndex.css" type="text/css">
    </head>
    
    <style>
    	
    	.dashboard-heading {
			margin: 10px 20px;
			letter-spacing: 1px;
		}
		
		.dashboard-heading span {
			font-weight: bold;
			font-size: 25px;
			text-align: center;
		}
		
		.about {
			display: flex;
			flex-direction: column;
			flex: 1;
			width: 100%;
		}
		
		.roadmap-main {
			width: auto;
		    height: auto;
		    padding: 0px 30px;
		    border-radius: 20px;
		    background-size: cover; 
		    border: 2px solid #000; 
		    background-image: url("./media/techback.jpg"); 
		    text-align: center;
		} 
		
		@keyframes zoomInOut {
		    0% {
		        transform: scale(1);
		    }
		    100% {
		        transform: scale(1.1);
		    }
		}
				
		.roadmap-main p {
			letter-spacing: 1px;
			margin: 0px 100px;
		}
		
		.roadmap-main fieldset {
	        letter-spacing: 1px;
	        border-radius: 20px;
	        margin: 30px 0px;
	        margin-top: 10px;
	        padding: 0px 30px;
	        background-color: #002233;
	        font-weight: bold;
	        border: none; 
	        height: auto; 
	        width: auto; 
	        font-weight: bold;
	    }
		
		legend {
			background-color: #ffa200;
			border-radius: 10px;
			padding: 15px;
			font-size: 13px;
		}
		
		.student-details {
			display: flex; 
			font-weight: bold;
			font-size: 12px;
			justify-content: center;
			align-items: center;
		}
		
		.student-details img {
			width: 550px;
			height: 550px;
		}
		 
        table {
		    width: 100%;
		    border-collapse: collapse;
		    font-size: 13px;
		    background-color: #002233;
		    color: white;  
		    border-radius: 20px;
		    margin: 20px; 
		}
		
		tr {
		    background-color: #fff;
		    color: black;  
		    margin: 10px; 
		    text-align: center; 
		    transition: transform 0.3s ease;
		}
		
		tr:hover {
			transform: scale(1.01);
		}
		
		td {  
		    border: none;
		    padding: 40px;  
		}
		
		th {
			background-color: #002233;
			color: #fff;
			font-weight: bold;
			padding: 10px; 
			border: none; 
		} 
    </style>
     
    <body>
    
    	<%
	        String name = (String) session.getAttribute("name");
	        if (name == null) {
	            response.sendRedirect("index.jsp");
	        } else {
	    %>

        <header>
            <img src="./media/code-simple.png" width=30px height=30px style="margin-left: 20px">
            <h1>TechCraft</h1>
            <div class="vl"></div>
            <div class="heading">
                <a href="studentDetails.jsp" style="margin-top: 10px;">Student Details</a>
                <a href="studentAttendance.jsp" style="margin-top: 10px; ">Student Attendance</a>
                <a href="assessment.jsp" style="margin-top: 10px;  ">Technical Assessment</a>
                <a href="StudentProgress.jsp" style="margin-top: 10px; ">Student's Progress</a>
            </div>
            <span style="flex: 1; margin-right: 0px;"></span>
            <img src="./media/user.png" width=20px height=20px style="margin-right: 15px">
        	<div class="popup">
			  <label for="user" class="userName"><%= name %><img class="dropdown-icon" alt="" src="./media/play.png"></label>    
			  <div class="popup-content">  
			    <a href="#">Profile</a>
			    <p></p> 
			    <a href="studentFeedback.jsp">Feedbacks</a>
			    <p></p>
			    <a href="#" onclick="openModal('logoutModal')">Logout</a>
			  </div>
			</div> 
        </header>
        
        <div class="dashboard-heading">
        	<span style="font-size: 15px; color: #888888">Dashboard:</span>
        	<span style="color: white"> Student's Feedbacks</span>
        </div>
        
        <div class="roadmap-main">
        	<div class="roadmap-heading"> <br>
        		<p>Feedback provided by the students of TechCraft Learning Hub has been invaluable, offering insightful perspectives and constructive suggestions to enhance our learning environment :</p> <br>
        		<fieldset>
		            <legend style="color: white; font-weight: bold;">Student's Feedbacks</legend> 
		             <div class="student-details">  
				        	<table>
				        		<tr>
				        			<th>Sr No.</th>
				        			<th>Name</th>
				        			<th>Rating</th>
				        			<th>Comment</th>
				        			<th>Suggestion</th>
				        			<th>Date</th>
				        		</tr> 
				                 
				        		<%  
						            SessionFactory factory = new Configuration().configure().buildSessionFactory();
						            Session studentSession = factory.openSession();
						            Transaction transaction = null;
						            
						            try {
						                transaction = studentSession.beginTransaction();
						                
						                Query<Feedback> query = studentSession.createQuery("FROM Feedback", Feedback.class);
						                List<Feedback> Feedbacks = query.getResultList();
						
						                for (int i = 0; i < Feedbacks.size(); i++) {
						                	Feedback feedback = Feedbacks.get(i);
						        %>
									        <tr style="background-color: #002233; height: 8px"></tr>
									        <tr>
									            <td style="border-bottom-left-radius: 10px; border-top-left-radius: 10px;"><%= i + 1 %></td>
									            <td><%= feedback.getStudentName() %></td>
									            <td><%= feedback.getRating() %></td>
									            <td><%= feedback.getComment() %></td>
									            <td><%= feedback.getSuggession() %></td> 
									            <td style="border-bottom-right-radius: 10px; border-top-right-radius: 10px;"><%= feedback.getDate() %></td> 
									        </tr> 
						        <% 
						                }
						                transaction.commit();
						            } 
						            catch (Exception e) { 
						                if (transaction != null) {
						                    transaction.rollback();
						                }
						                e.printStackTrace();
						            } 
						            finally {
						                studentSession.close();
						                factory.close();
						            }
						        %>
				        	</table> 
				    </div>
		        </fieldset>
        	</div>
        </div>
         
        <div id="logoutModal" class="modal-container">
            <!-- Modal content -->
            <div class="modal-content" style="max-width: 300px; margin: auto; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
                <form id="logoutForm" action="TeacherLogout">
                    <p style="color: black">Are you sure, you want to Logout ?</p>
                    <div style="display: flex; gap: 10px; align-item: center">
                        <input type="button" class="login" style="background-color: #ffa200; border: none" value="Yes"
                            onclick="logOut()">
                        <input type="button" class="login" style="background-color: #d2d2e0; border: none" value="Cancel"
                            onclick="closeModal('logoutModal')">
                    </div>
                </form>
            </div>
        </div>
        
        <script type="text/javascript">
	        function openModal(modalId) {
	            var modal = document.getElementById(modalId);
	            modal.style.display = 'block';
	        }
	
	        function closeModal(modalId) {
	            var modal = document.getElementById(modalId);
	            modal.style.display = 'none';
	        }  
	        
	        function logOut() {
                document.getElementById("logoutForm").submit();
            }
        </script>
        
        <footer style="background-color: #002233; display: flex; justify-content: space-between; margin: 0px 50px; color: #ffa200;">
        	<div class="footer-content">
        		<h4>About Us</h4>
        		<div>
        			<p>Technolearn Trainings is one of the best training institutes in Sinhagad Road/Anand Nagar, Pune. We provide professional courses for students, working professionals, job seekers and corporate employees with placement assurance.</p>
        		</div>
        	</div>
        	<div class="footer-content">
        		<h4>Features</h4>
        		<div>
        			<a href="teacherHome.jsp">Technology Roadmaps</a><p></p>
	                <a href="videoLecture.jsp">Video Lectures</a><p></p>
	                <a href="codingEnhancement.jsp">Coding Enhancement</a><p></p>
	                <a href="technicalQuiz.jsp">Technical Quiz</a><p></p>
        		</div>
        	</div>
        	<div class="footer-content">
        		<h4>Contact </h4>
        		<div>
        			<div style="margin-top: 20px;">
                    <img src="./media/pin.png" width="20px" height="20px">
                    <span id="tick-text">Technolearn Trainings 133, Peshwa, 2nd Floor, Office No. 09, Near Chaitanya Hospital, Next to Parvati Bridge, Sinhgad Road, Parvati, Pune - 411030.</span>
	                </div>
	                <div style="margin-top: 20px;">
	                    <img src="./media/phone.png" width="20px" height="20px">
	                    <span id="tick-text">91 88570 96492</span>
	                </div>
	                <div style="margin-top: 20px;">
	                    <img src="./media/email (1).png" width="20px" height="20px">
	                    <span id="tick-text">Info.technolearn@gmail.com</span>
	                </div>
        		</div>
        	</div>
        	<div class="footer-content">
        		<h4>Follow Us</h4>
        		<div class="footer-social-media">
        			<a href="#"><img src="./media/twitter.png"></a>
                    <a href="#"><img src="./media/facebook.png"></a>
                    <a href="#"><img src="./media/linkedin.png"></a>
                    <a href="#"><img src="./media/instagram.png"></a>
        		</div>
        	</div>
        </footer>
        
        <footer>
            <p>&copy; 2024 TechCraft Learning Hub. @ Harshal Wandhare</p>
        </footer>
        
		<% } %>
    </body>
    </html>