<%@page import="techcraft.teacher.model.SessionLogs"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.Session, org.hibernate.Transaction, org.hibernate.cfg.Configuration, org.hibernate.query.Query, techcraft.teacher.model.SessionLogs, java.util.List" %>
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
	        padding: 30px;
	        background-color: #002233;
	        font-weight: bold;
	        border: none; 
	        height: auto; 
	        width: auto; 
	        font-weight: bold;
	    }
		 
		.student-details {
			display: flex;  
			font-size: 12px;
			justify-content: center;
			align-items: center; 
		}
		
		.select-date input, select{ 
		    font-weight: bold; 
		    letter-spacing: 1px;
		    border: solid 2px #000;
		    padding: 10px 30px;
		    margin: 10px;  
		    border-radius: 15px;
		    font-size: 15px;
		}
		
		.select-date button{
			color: #fff;
		    cursor: pointer;
		    font-weight: bold;
		    background-color: #ffa200;
		    letter-spacing: 1px;
		    border: none;
		    padding: 15px 20px;
		    margin: 10px;  
		    border-radius: 15px;
		    font-size: 13px; 
		    transition: transform 0.3s ease;
		}
		
		.select-date button:hover {
			background-color: #0bbfff;
			transform: scale(1.1);
		}
 
		table {
		    width: 100%;
		    border-collapse: collapse;
		    font-size: 13px;
		    background-color: #002233;
		    color: white;  
		    border-radius: 20px;  
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
                <a href="studentDetails.jsp" style="margin-top: 10px; ">Student Details</a>
                <a href="studentAttendance.jsp" style="border-bottom: 2px solid #ffa200; margin-top: 10px; padding-bottom: 10px;">Student Attendance</a>
                <a href="assessment.jsp" style="margin-top: 10px; ">Technical Assessment</a>
                <a href="StudentProgress.jsp" style="margin-top: 10px;  ">Student's Progress</a>
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
        	<span style="color: white"> Student's Attendance</span>
        </div>
        
        <div class="roadmap-main">
        	<div class="roadmap-heading"> <br>
        		<p>Attendance details for students enrolled in TechCraft Learning Hub:</p><br>
        		<div style="display: flex; justify-content: center; align-items: center;">
		        	<div> 
				    	<div class="select-date" style="margin-right: 50px; margin-left: 50px"> 
				    		<form id="attendance-form" action="studentAttendance.jsp">
				    			<b>Date wise Attendance :</b>
				    			<input type="hidden" name="view-type" value="date">
				         		<input type="date" id="attendanceDate" name="attendanceDate" required>
								<button onclick="viewAttendance('attendance-form')">View Attendance</button>
							</form>
				        </div>
				    </div>
				    <div style="width: 5px;"></div>
				    <div>
				        
				        <div class="select-date" style="margin-right: 50px; margin-left: 50px">
				        	<form action="studentAttendance.jsp">
				        		<b>Name wise Attendance :</b>
				        		<input type="hidden" name="view-type" value="name">   
							    <select id="studentName" name="studentName" required style="font-weight: normal;">
							        <option value="" disabled selected>Select Name</option>
							        <%  
							            SessionFactory factory5 = new Configuration().configure().buildSessionFactory();
							            Session studentSession5 = factory5.openSession(); 
							            Transaction tx = null;
							                    
							            try {          
							                tx = studentSession5.beginTransaction();
							                Query<String> query5 = studentSession5.createQuery("select name from Student", String.class);
							                List<String> students = query5.getResultList(); 
							                
							                for (String student : students) { 
							        %> 
							                    <option value="<%= student %>"><%= student %></option> 
							                <% 
							                } 
							                tx.commit();
							            } 
							            catch (Exception e) {  
							                if (tx != null) {
							                    tx.rollback();
							                }
							                e.printStackTrace();
							            } 
							            finally {
							                studentSession5.close();
							                factory5.close();
							            }
							        %> 
							    </select>
								<button type="submit">View Attendance</button>
							</form> 
				        </div>
				    </div>
		        </div>  
        		<fieldset>  
		             <div class="student-details">  
				        	<table>
				        		<tr>
				        			<th>Sr No.</th>
				        			<th>Name</th>
				        			<th>Login date</th>
				        			<th>Login Time</th>
				        			<th>Logout Time</th>
				        		</tr> 
				        		
				        		<%  
				        			String type = request.getParameter("view-type");
				        		
						            SessionFactory factory = new Configuration().configure().buildSessionFactory();
						            Session studentSession = factory.openSession(); 
						            
						            try { 
						            	Query<SessionLogs> query;
						            	
						            	if( type == null) {
						            		query = studentSession.createQuery("FROM SessionLogs", SessionLogs.class);
						            	}
						            	else if(type.equals("name")) {
						            		String studentName = request.getParameter("studentName"); 
						            		query = studentSession.createQuery("FROM SessionLogs WHERE studentName = :studentName", SessionLogs.class);
						            		query.setParameter("studentName", studentName);
						            	}
						            	else {
						            		String loginDate = request.getParameter("attendanceDate");
						            		query = studentSession.createQuery("FROM SessionLogs WHERE loginDate = :loginDate", SessionLogs.class);
						            		query.setParameter("loginDate", loginDate);
						            	} 
						                List<SessionLogs> logs = query.getResultList();
						
						                for (int i = 0; i < logs.size(); i++) {
						                	SessionLogs log = logs.get(i);
						        %>			
						        			<tr style="background-color: #002233; height: 8px"></tr>
									        <tr>
									            <td style="border-bottom-left-radius: 10px; border-top-left-radius: 10px;"><%= i + 1 %></td>
									            <td><%= log.getStudentName() %></td>
									            <td><%= log.getLoginDate() %></td>
									            <td><%= log.getLoginTime() %></td>
									            <td style="border-bottom-right-radius: 10px; border-top-right-radius: 10px;"><%= log.getLogoutTime() %></td> 
									        </tr> 
						        <% 
						                } 
						        %>        
						                <tr style="background-color: #002233; height: 8px"></tr>
						                <tr> 
									        <td colspan="5" style="border-radius: 10px;">No more Records !</td> 
									   </tr>
						        <%        
						            } 
						            catch (Exception e) {  
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
	        
	        function viewAttendance(formId) {
	        	const dateInput = document.getElementById("attendanceDate").value;
	        	if(dateInput == "" ) {
	        		alert("Please select date first !");
	        	}
	        	else { 
	        		console.log(dateInput);
		        	document.getElementById(formId).submit();
	        	}
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