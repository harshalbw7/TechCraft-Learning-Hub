<%@page import="techcraft.teacher.model.Student"%>
<%@page import="techcraft.teacher.dao.QuizDao"%>
<%@page import="techcraft.teacher.dao.VideoDao"%>
<%@page import="techcraft.teacher.dao.CodingDao"%>
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
	    
	    legend { 
			border-radius: 10px;
			padding: 15px;
			font-size: 14px;
			color: white; 
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
		    padding: 10px 10px;
		    margin: 10px;  
		    border-radius: 15px;
		    font-size: 15px;
		    width: 350px;
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
		
		fieldset button {
			color: #fff;
		    cursor: pointer;  
		    letter-spacing: 1px;
		    background-color: #0bbfff;
		    border: none;
		    padding: 15px;
		    margin: 15px 19px;  
		    border-radius: 10px;
		    font-size: 12px;
		    width: 230px; 
		    font-weight: bold;
		    transition: transform 0.3s ease;
		}
		
		fieldset button:hover {
			background-color: #0bbfff;
			transform: scale(1.1);
		} 
		
		.profile {
			display: flex;  
			align-items: center;
			justify-content: center;
			margin-bottom: 30px;
			background-color: white;
			border-radius: 20px;
			border: 4px solid #000;
		}
		
		.name { 
			margin: 20px;
			justify-content: center;
			align-items: center;
			margin-bottom: 0px;
			margin-right: 0px;
			width: 250px; 
			
		}
		
		.details {
			text-align: left;
			margin: 20px;  
			margin-bottom: 0px;
			width: 400px; 
		}
		
		.coding-progress {
			display: flex;
			margin: 10px;
			width: auto; 
			align-items: center;
			justify-content: center;
		}
		
		.progress b {
			letter-spacing: 1px;
			font-size: 10px; 
		}
	    .progress-container { 
	        width: 250px;
	        height: 7px;
	        background-color: #002233;
	        border-radius: 5px; 
	        margin: 10px; 
	    }
	    .progress-barr {
	        width: 100%;
	        height: 100%;
	        background-color: #0bbfff;
	        border-radius: 5px;
	        transition: width 1s ease;
	    }
	    .progress-text {  
	        color: #000;
	        font-weight: bold;
	        font-size: 20px;
	        margin: 10px;
	        margin-bottom: 0px;
	    }
  
    </style>
     
    <body>
    
    	<%
	        String name = (String) session.getAttribute("name");
	        if (name == null) {
	            response.sendRedirect("index.jsp");
	        } else {
	    %>
	    
	    <%  
        	String studentName = request.getParameter("studentName"); 
        %>

        <header>
            <img src="./media/code-simple.png" width=30px height=30px style="margin-left: 20px">
            <h1>TechCraft</h1>
            <div class="vl"></div>
            <div class="heading">
                <a href="studentDetails.jsp" style="margin-top: 10px; ">Student Details</a>
                <a href="studentAttendance.jsp" style="margin-top: 10px; ">Student Attendance</a>
                <a href="assessment.jsp" style="margin-top: 10px; ">Technical Assessment</a>
                <a href="StudentProgress.jsp" style="border-bottom: 2px solid #ffa200; margin-top: 10px; padding-bottom: 10px;">Student's Progress</a>
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
        	<span style="color: white"> Student's Progress</span>
        </div>
        
        <div class="roadmap-main">
        	<div class="roadmap-heading"> <br>
        		<p>Explore detailed progress details for students who are part of the TechCraft Learning Hub program.</p><br>
        		<div style="display: flex; justify-content: center; align-items: center; margin: 20px;"> 
				    <div> 
				        <div class="select-date" style="margin-right: 50px; margin-left: 50px">
				        	<form action="StudentProgress.jsp">
							    <b>Select Student Name:</b>   
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
							    <button type="submit">View Progress</button>
							</form> 
				        </div>
				    </div>
		        </div> 
		         
        		<fieldset>  
        			  
			            <div class="profile">
			            	<div style="width: 190px;"></div>
			            	
			            	<%  
								SessionFactory factory = new Configuration().configure().buildSessionFactory();
								Session studentSession = factory.openSession(); 
										            
								try {          
									Query<Student> query = studentSession.createQuery("FROM Student WHERE name = :name", Student.class);
									query.setParameter("name", studentName); 
									Student student = query.uniqueResult();
				
									if (student != null) {
							%>
						            	<div class="name">
						            	<img alt="" src="./media/student.png" height="70px" width="70px">
						            		<h3><%= student.getName() %></h3>
						            	</div>
						            	<div style="height: 150px; width: 0px; border: solid 4px #002233; margin: 20px; margin-left: 0px;"></div>
						            	<div class="details">
						            		<span><b>Email ID :</b> <%= student.getEmail() %></span><br><br>
						            		<span><b>Mobile No :</b> <%= student.getNumber() %></span><br><br> 
						            	</div> 
			            	<% 
									} 
								} 
								catch (Exception e) {  
									e.printStackTrace();
								} 
								finally {
									studentSession.close();
									factory.close();
								}
							%>
			         </div> 
				     <fieldset style="margin-top: 0px; border: solid 4px #000; width: auto;padding: 20px 70px;padding-top: 0px; background-color: #fff; color: black;">
				         <legend style="text-align: left; background-color: #ffa200; color: white;">Coding Progress</legend>
				        <% 
				         SessionFactory factory1 = new Configuration().configure().buildSessionFactory();
					 	 Session studentSession1 = factory1.openSession(); 
							            
						 try { 
							 Query<String> query1 = studentSession1.createQuery("select distinct technology from CodingProgress where studentName = :studentName", String.class);
							 query1.setParameter("studentName", studentName);
							 List<String> technologies = query1.getResultList();
							 if (technologies.isEmpty()) { %>
				                <div class=""><h3 style="color: #888888">No progress !</h3></div>
				            <% } else {
							for (int i = 0; i < technologies.size(); i++) {  
						    	int totalChallenges = CodingDao.totalChallenges(technologies.get(i));
						        int totalSubmitedChllenges = CodingDao.totalSubmittedChallenges(technologies.get(i), studentName);
						        //int totalChallenges = 20;
						        //int totalSubmitedChallenges = 19;
						%>
				            <div class="coding-progress"> 
				            	<span style="font-size: 10px;">Topic: </span><pre>  </pre>
				            	<span><%= technologies.get(i) %></span>
				            	<div style="flex: 1"></div> 
				            	<div style="display: flex;">
									<div class="progress">
						                <b id="completed<%= i %>">Not completed !</b>
						                 <div class="progress-container">
						                    <div class="progress-barr" id="progressBar<%= i %>"></div>
						                </div> 
						            </div>
						            <div class="progress-text" id="progressText<%= i %>"></div> 
								</div> 
								<script type="text/javascript">
						            const progressBar<%= i %> = document.getElementById('progressBar<%= i %>');
						            const progressText<%= i %> = document.getElementById('progressText<%= i %>');
						             
						            let width<%= i %> = 0;
						            const interval<%= i %> = setInterval(() => {
						                if (width<%= i %> >= 100) {
						                    const completed<%= i %> = document.getElementById('completed<%= i %>'); 
						                    completed<%= i %>.innerText = "Completed !"; 
						                    clearInterval(interval<%= i %>);
						                } 
						                else {
						                    if(<%= totalSubmitedChllenges %> == 0 && <%= totalChallenges %> == 0) {
						                        progressBar<%= i %>.style.width = 0 + '%'; 
						                        progressText<%= i %>.innerText = 0 + '%';
						                    }
						                    else {
						                        width<%= i %> = (<%= totalSubmitedChllenges %> / <%= totalChallenges %>) * 100;
						                        progressBar<%= i %>.style.width = width<%= i %> + '%'; 
						                        progressText<%= i %>.innerText = width<%= i %>.toFixed(0) + '%';
						                    } 
						                }
						            }, 50);
						        </script>  
				            </div>
				            <hr> 
				        <% 
								} 
				            }
							} 
							catch (Exception e) {  
							    e.printStackTrace();
							} 
							finally {
							    studentSession1.close();
							    factory1.close();
							}
						%>    
				     </fieldset> 
			         <fieldset style="margin-top: 0px; border: solid 4px #000; width: auto;padding: 20px 70px;padding-top: 0px; background-color: #fff; color: black;">
				        <legend style="text-align: left; background-color: #ffa200; color: white;">Video Progress</legend>
					    <% 
					        SessionFactory factory2 = new Configuration().configure().buildSessionFactory();
					        Session studentSession2 = factory2.openSession(); 
					
					        try { 
					            Query<String> query2 = studentSession2.createQuery("select distinct technology from VideoProgress where studentName = :studentName", String.class);
					            query2.setParameter("studentName", studentName);
					            List<String> technologies = query2.getResultList();
					
					            if (technologies.isEmpty()) { %>
					                <div class=""><h3 style="color: #888888">No progress !</h3></div>
					            <% } else {
					                for (int i = 0; i < technologies.size(); i++) {  
					                    int totalChallenges = VideoDao.totalChallenges(technologies.get(i));
					                    int totalSubmitedChallenges = VideoDao.totalSubmittedChallenges(technologies.get(i), studentName); 
					    %>
					                    <div class="coding-progress"> 
					                        <span style="font-size: 10px;">Topic: </span><pre>  </pre>
					                        <span><%= technologies.get(i) %></span>
					                        <div style="flex: 1"></div> 
					                        <div style="display: flex;">
					                            <div class="progress">
					                                <b id="completed<%= i %>">Not completed !</b>
					                                <div class="progress-container">
					                                    <div class="progress-barr" id="progressBar<%= i + 100 %>"></div>
					                                </div> 
					                            </div>
					                            <div class="progress-text" id="progressText<%= i + 100 %>"></div> 
					                        </div> 
					                        <script type="text/javascript">
					                            const progressBar<%= i + 100 %> = document.getElementById('progressBar<%= i + 100 %>');
					                            const progressText<%= i + 100 %> = document.getElementById('progressText<%= i + 100 %>');
					                             
					                            let width<%= i + 100 %> = 0;
					                            const interval<%= i + 100 %> = setInterval(() => {
					                                if (width<%= i + 100 %> >= 100) {
					                                	const completed<%= i %> = document.getElementById('completed<%= i %>'); 
									                    completed<%= i %>.innerText = "Completed !"; 
									                    clearInterval(interval<%= i %>);
					                                } 
					                                else {
					                                    if (<%= totalSubmitedChallenges %> == 0 && <%= totalChallenges %> == 0) {
					                                        progressBar<%= i + 100 %>.style.width = 0 + '%'; 
					                                        progressText<%= i + 100 %>.innerText = 0 + '%';
					                                    }
					                                    else {
					                                        width<%= i + 100 %> = (<%= totalSubmitedChallenges %> / <%= totalChallenges %>) * 100;
					                                        progressBar<%= i + 100 %>.style.width = width<%= i + 100 %> + '%'; 
					                                        progressText<%= i + 100 %>.innerText = width<%= i + 100 %>.toFixed(0) + '%';
					                                    } 
					                                }
					                            }, 50);
					                        </script> 
					                    </div>
					                    <hr> 
					                <% } 
					            } 
					        } 
					        catch (Exception e) {  
					            e.printStackTrace();
					        } 
					        finally {
					            studentSession2.close();
					            factory2.close();
					        }
					    %>  
						</fieldset>
				        <fieldset style="margin-top: 0px; border: solid 4px #000; width: auto;padding: 20px 70px;padding-top: 0px; background-color: #fff; color: black;">
				         	<legend style="text-align: left; background-color: #ffa200; color: white;">Quiz Progress</legend>
				            <% 
					         SessionFactory factory3 = new Configuration().configure().buildSessionFactory();
						 	 Session studentSession3 = factory3.openSession(); 
								            
							 try { 
								 Query<String> query3 = studentSession3.createQuery("select distinct technology from QuizProgress where studentName = :studentName", String.class);
								 query3.setParameter("studentName", studentName);
								 List<String> technologies = query3.getResultList();
								 if (technologies.isEmpty()) { %>
					                <div class=""><h3 style="color: #888888">No progress !</h3></div>
					            <% } else {
								for (int i = 0; i < technologies.size(); i++) {  
							    	int totalChallenges = QuizDao.totalTopics(technologies.get(i));
							        int totalSubmitedChllenges = QuizDao.totalSubmittedTopics(technologies.get(i), studentName); 
							%>
					            <div class="coding-progress"> 
					            	<span style="font-size: 10px;">Topic: </span><pre>  </pre>
					            	<span><%= technologies.get(i) %></span>
					            	<div style="flex: 1"></div> 
					            	<div style="display: flex;">
									<div class="progress">
								        <b id="completed<%= i %>">Not completed !</b>
					                    <div class="progress-container">
								            <div class="progress-barr" id="progressBar<%= i + 200 %>"></div>
								        </div> 
								    </div>
								    <div class="progress-text" id="progressText<%= i + 200 %>"></div> 
								</div> 
								<script type="text/javascript">
								    const progressBar<%= i + 200 %> = document.getElementById('progressBar<%= i + 200 %>');
								    const progressText<%= i + 200 %> = document.getElementById('progressText<%= i + 200 %>');
								     
								    let width<%= i + 200 %> = 0;
								    const interval<%= i + 200 %> = setInterval(() => {
								        if (width<%= i + 200 %> >= 100) {
								        	const completed<%= i %> = document.getElementById('completed<%= i %>'); 
						                    completed<%= i %>.innerText = "Completed !"; 
						                    clearInterval(interval<%= i %>);
								        } 
								        else {
								            if (<%= totalSubmitedChllenges %> == 0 && <%= totalChallenges %> == 0) {
								                progressBar<%= i + 200 %>.style.width = 0 + '%'; 
								                progressText<%= i + 200 %>.innerText = 0 + '%';
								            }
								            else {
								                width<%= i + 200 %> = (<%= totalSubmitedChllenges %> / <%= totalChallenges %>) * 100;
								                progressBar<%= i + 200 %>.style.width = width<%= i + 200 %> + '%'; 
								                progressText<%= i + 200 %>.innerText = width<%= i + 200 %>.toFixed(0) + '%';
								            } 
								        }
								    }, 50);
								</script> 
					            </div>
					            <hr> 
					        <% }
									} 
								} 
								catch (Exception e) {  
								    e.printStackTrace();
								} 
								finally {
								    studentSession3.close();
								    factory3.close();
								}
							%>    
				        </fieldset> 
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