<%@page import="techcraft.model.Certificate"%>
<%@page import="techcraft.dao.QuizDao"%>
<%@page import="techcraft.dao.VideoDao"%>
<%@page import="techcraft.model.CodingProgress"%>
<%@page import="techcraft.dao.CodingDao"%>
<%@page import="techcraft.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.Session, org.hibernate.Transaction, org.hibernate.cfg.Configuration, org.hibernate.query.Query, techcraft.model.Student, java.util.List" %>
<!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>TechCraft Learning Hub</title>
        <link rel="stylesheet" href="index.css" type="text/css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="sweetalert2.min.js"></script>
		<link rel="stylesheet" href="sweetalert2.min.css">
    </head>
    
    <style>
    
    	.progress-bar {
		    width: 20px;
		    height: 20px;
		    margin-right: 20px; 
		    margin-left: 20px;
		    border-radius: 50%;
		    border: 4px solid black;
		    border-top-color: #ffa200;
		    animation: spin 1s linear infinite;
		}
		 
		.hidden {
		    display: none;
		}
		
		@keyframes spin {
		    0% { transform: rotate(0deg); }
		    100% { transform: rotate(360deg); }
		}
    	 
    	.dashboard-heading {
			margin: 10px 20px;
			letter-spacing: 1px;
		}
		
		.dashboard-heading span {
			font-weight: bold;
			font-size: 25px;
			text-align: center;
		}
		
		.roadmap-main {
			width: auto;
		    height: auto;
		    background-size: cover; 
		    border: 3px solid #000;
		    border-radius: 20px; 
		    background-image: url("./media/techback.jpg");
		    margin: 0px 20px;
		    text-align: center;
		}
		
		.roadmap-main h2 {
			letter-spacing: 1px; 
			color: #002233;
		}
		
		@keyframes zoomInOut {
		    0% {
		        transform: scale(1);
		    }
		    100% {
		        transform: scale(1.03);
		    }
		}
				
		.roadmap-main p {
			letter-spacing: 1px;
			margin: 0px 100px;
		}
		
		.roadmap-main a {
			text-decoration: none;
			cursor: pointer;
			color: #0bbfff;
			font-size: 13px;
		    transition: transform 0.3s ease;
		}
		
		.roadmap-main a:hover {
		    transform: scale(1.1);
		}
		
		.roadmap-main fieldset {
			letter-spacing: 1px;
			margin: 30px 70px;
			background-color: #fff;
			font-weight: bold;
			border: solid 4px #00bfff;
			border-radius: 20px;
			height: auto;
			padding: 10px;
			margin-bottom: 50px;
		}
		
		legend {
			background-color: #ffa200;
			border-radius: 10px;
			padding: 15px;
			font-size: 14px;
			color: white; 
			font-weight: bold;
		}
		
		.roadmap-main button {
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
		
		.roadmap-main button:hover {
			background-color: #0bbfff;
			transform: scale(1.1);
		} 
		
		.profile {
			display: flex;
			margin: 10px; 
			align-items: center;
			justify-content: center;
			margin-bottom: 0px;
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
	        String status = (String)request.getAttribute("status"); 
	        if (status != null && status.equals("gotit")) {
	   	 %>
	    	    		<script type="text/javascript">
	    	    		            Swal.fire({
	    	    		            	title: "Congrats !",
	    	    		            	text: "Your password updated successfully !",
	    	    		            	icon: "success",
	    	    		            	showConfirmButton: false,
	    	    		            	timer: 3000,
	    	    	            	});
	    	    	    </script>
	    <%
	    	}
	        if (status != null && status.equals("NoFound")) {
	    	    %>
	    	    		<script type="text/javascript">
	    	    		            Swal.fire({
	    	    		            	title: "Incorrect Older Password !",
	    	    		            	text: "Please insert correct Password Or Forgot It !",
	    	    		            	icon: "error",
	    	    		            	showConfirmButton: false,
	    	    		            	timer: 3500,
	    	    	            	});
	    	    	    </script>
	    <%
	   		}
	        if (status != null && status.equals("found")) {
	   	%>
	   	    	    		<script type="text/javascript">
	   	    	    		            Swal.fire({
	   	    	    		            	title: "Check Email !",
	   	    	    		            	text: "Your credentials have been sent to the registered email address!",
	   	    	    		            	icon: "success",
	   	    	    		            	showConfirmButton: false,
	   	    	    		            	timer: 3000,
	   	    	    	            	});
	   	    	    	    </script>
	   	    <%
	   	    	}
	   	        if (status != null && status.equals("notFound")) {
	   	    	    %>
	   	    	    		<script type="text/javascript">
	   	    	    		            Swal.fire({
	   	    	    		            	title: "Email not registed !",
	   	    	    		            	text: "Please Register to TechCraft !",
	   	    	    		            	icon: "error",
	   	    	    		            	showConfirmButton: false,
	   	    	    		            	timer: 2500,
	   	    	    	            	});
	   	    	    	    </script>
	   	<%
	   	   	}
	    %>

        <header>
            <img src="./media/code-simple.png" width=30px height=30px style="margin-left: 20px">
            <h1>TechCraft</h1>
            <div class="vl"></div>
            <div class="heading">
                <a href="studentHome.jsp" style="margin-top: 10px;">Technology Roadmaps</a>
                <a href="videoLecture.jsp" style="margin-top: 10px;">Video Lectures</a>
                <a href="codingInhancement.jsp" style="margin-top: 10px;">Coding Enhancement</a>
                <a href="technicalQuiz.jsp" style="margin-top: 10px;">Technical Quiz</a>
            </div>
            <span style="flex: 1"></span>
            <img src="./media/user.png" width=20px height=20px style="margin-right: 15px">
        	<div class="popup">
			  <label for="user" class="userName"><%= name %><img class="dropdown-icon" alt="" src="./media/play.png"></label>    
			  <div class="popup-content">
			    <a href="studentProfile.jsp">Profile</a>
			    <p></p>
			    <a href="assessment.jsp">Assessment</a> 
			    <!-- <p></p>
			    <a href="Placement.jsp">Placement</a>-->
			    <p></p>
			    <a href="Feedback.jsp">Feedback</a>
			    <p></p>
			    <a href="#" onclick="openModal('logoutModal')">Logout</a>
			  </div>
			</div>
        	
        </header>
        <div style="width: 100%; height: 100px;"></div>
        
        <div class="dashboard-heading">
        	<span style="font-size: 15px; color: #888888">Dashboard:</span>
        	<span style="color: white">Student's Profile</span>
        </div>
        
        <div class="roadmap-main">
        	<div class="roadmap-heading">
        		<h2>Checkout Your Profile and Learning Progress !</h2>
        		<p>At TechCraft Learning Hub, we believe in empowering learners with structured roadmaps that guide them through their learning journey.</p> 
        		<fieldset>
		            <legend>Student's Profile</legend> 
		            <div class="profile">
		            	<div style="width: 190px;"></div>
		            	
		            	<%  
							SessionFactory factory = new Configuration().configure().buildSessionFactory();
							Session studentSession = factory.openSession(); 
									            
							try {          
								Query<Student> query = studentSession.createQuery("FROM Student WHERE name = :name", Student.class);
								query.setParameter("name", name); 
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
					            		<a style="cursor: pointer;" onclick="openModal('changePassword')"><b>Change Password</b></a>
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
			         <legend style="text-align: left; background-color: #ffa200; color: white;">Certificates</legend> 
			         <%  
							SessionFactory factoryC = new Configuration().configure().buildSessionFactory();
							Session studentSessionC = factoryC.openSession(); 
									            
							try {          
								Query<Certificate> queryC = studentSessionC.createQuery("FROM Certificate WHERE studentName = :name", Certificate.class);
								queryC.setParameter("name", name); 
								List<Certificate> certificates = queryC.getResultList(); 
								
							    for (int i = 0; i < certificates.size(); i++) {
							    	Certificate certificate = certificates.get(i);
						%>
					            	<div class="coding-progress"> 
						         		<span style="font-size: 10px;">For : </span><pre>  </pre>
						            	<span><%= certificate.getType() %></span>
						            	<div style="flex: 1"></div> 
						            	<span style="font-size: 10px;">Topic: </span><pre>  </pre>
						            	<span><%= certificate.getTechnology() %></span>
						            	<div style="flex: 1"></div>
						            	<form action="ViewCertificate.jsp"> 
						            		<input type="hidden" name="type" value="<%= certificate.getType() %>">
						            		<input type="hidden" name="technology" value="<%= certificate.getTechnology() %>">
						            		<input type="hidden" name="date" value="<%= certificate.getDate() %>">
						            		<button type="submit">View Certificate</button> 
						            	</form> 
						            </div>
						            <hr> 
		            	<% 
								} 
							} 
							catch (Exception e) {  
								e.printStackTrace();
							} 
							finally {
								studentSessionC.close();
								factoryC.close();
							}
						%> 
			         <div class=""><h3 style="color: #888888">No more certificates achieved !</h3></div> 
			     </fieldset>
			     <fieldset style="margin-top: 0px; border: solid 4px #000; width: auto;padding: 20px 70px;padding-top: 0px; background-color: #fff; color: black;">
			         <legend style="text-align: left; background-color: #ffa200; color: white;">Coding Progress</legend>
			        <% 
			         SessionFactory factory1 = new Configuration().configure().buildSessionFactory();
				 	 Session studentSession1 = factory1.openSession(); 
						            
					 try { 
						 Query<String> query1 = studentSession1.createQuery("select distinct technology from CodingProgress where studentName = :studentName", String.class);
						 query1.setParameter("studentName", name);
						 List<String> technologies = query1.getResultList();
						 if (technologies.isEmpty()) { %>
			                <div class=""><h3 style="color: #888888">No progress till now !</h3></div>
			            <% } else {
						for (int i = 0; i < technologies.size(); i++) {  
					    	int totalChallenges = CodingDao.totalChallenges(technologies.get(i));
					        int totalSubmitedChllenges = CodingDao.totalSubmittedChallenges(technologies.get(i), name);
					        //int totalChallenges = 20;
					        //int totalSubmitedChallenges = 19;
					%>
			            <div class="coding-progress"> 
			            	<span style="font-size: 10px;">Topic: </span><pre>  </pre>
			            	<span><%= technologies.get(i) %></span>
			            	<div style="flex: 1"></div> 
			            	<div style="display: flex;">
								<div class="progress">
					                <b id="completed<%= i %>">Complete all to get your Certificate !</b> 
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
					                    const getCertificate<%= i %> = document.getElementById('get-certificate<%= i %>');
					                    
					                    completed<%= i %>.innerText = "Completed, collect your certificate !"; 
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
				            query2.setParameter("studentName", name);
				            List<String> technologies = query2.getResultList();
				
				            if (technologies.isEmpty()) { %>
				                <div class=""><h3 style="color: #888888">No progress till now !</h3></div>
				            <% } else {
				                for (int i = 0; i < technologies.size(); i++) {  
				                    int totalChallenges = VideoDao.totalChallenges(technologies.get(i));
				                    int totalSubmitedChallenges = VideoDao.totalSubmittedChallenges(technologies.get(i), name); 
				    %>
				                    <div class="coding-progress"> 
				                        <span style="font-size: 10px;">Topic: </span><pre>  </pre>
				                        <span><%= technologies.get(i) %></span>
				                        <div style="flex: 1"></div> 
				                        <div style="display: flex;">
				                            <div class="progress">
				                                <b id="completed<%= i + 100 %>">Complete all to get your Certificate !</b> 
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
				                                    const completed<%= i + 100 %> = document.getElementById('completed<%= i + 100 %>');
				                                    const getCertificate<%= i + 100 %> = document.getElementById('get-certificate<%= i + 100 %>');
				                                    
				                                    completed<%= i + 100 %>.innerText = "Completed, collect your certificate ! "; 
				                                    clearInterval(interval<%= i + 100 %>);
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
							 query3.setParameter("studentName", name);
							 List<String> technologies = query3.getResultList();
							 if (technologies.isEmpty()) { %>
				                <div class=""><h3 style="color: #888888">No progress till now !</h3></div>
				            <% } else {
							for (int i = 0; i < technologies.size(); i++) {  
						    	int totalChallenges = QuizDao.totalTopics(technologies.get(i));
						        int totalSubmitedChllenges = QuizDao.totalSubmittedTopics(technologies.get(i), name); 
						%>
				            <div class="coding-progress"> 
				            	<span style="font-size: 10px;">Topic: </span><pre>  </pre>
				            	<span><%= technologies.get(i) %></span>
				            	<div style="flex: 1"></div> 
				            	<div style="display: flex;">
								<div class="progress">
							        <b id="completed<%= i + 200 %>">Complete all to get your Certificate !</b> 
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
							            const completed<%= i + 200 %> = document.getElementById('completed<%= i + 200 %>');
							            const getCertificate<%= i + 200 %> = document.getElementById('get-certificate<%= i + 200 %>');
							            
							            completed<%= i + 200 %>.innerText = "Completed, collect your certificate !"; 
							            clearInterval(interval<%= i + 200 %>);
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
        
        <div id="changePassword" class="modal-container" style="font-weight: bold;">
            <!-- Modal Login -->
            <div class="modal-content" style="max-width: 500px;">
                <span style="color: black" onclick="closeModal('changePassword')" class="close">&times;</span>
                <h2 style="text-align: center; color: black">Change Password</h2>
                <form id="change-password" action="ChangePassword" method="post">
                	<p style="margin: 10px; font-size: 13px; margin-left: 35px;">Older Password :</p>
                	<div style="display: flex;">
                		<img src="./media/lock.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 7px;">
                		<input id="currentPassword" type="password" name="currentPassword" required><br>
                	</div>
                	<hr>
                	<p style="margin: 10px; font-size: 13px; margin-left: 35px; margin-top: 20px;">New Password :</p>
                	<div style="display: flex;">
                		<img src="./media/lock.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 7px;">
                		<input id="newPassword" type="password" name="newPassword" required><br>
                	</div>
                	<p style="margin: 10px; font-size: 13px; margin-left: 35px;">Confirm Password :</p>
                	<div style="display: flex;">
                		<img src="./media/lock.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 7px;">
                		<input id="confirmPassword" type="password" name="confirmPassword" required><br>
                	</div>
                	<hr> 
                	<br>
					<div style="display: flex; align-items: center; text-align: center; margin-left: 35px">
				    	<div class="register-container">
				    		<input type="button" class="register" value="Change Password" id="signUpButton" onclick="registerClicked()" style="background-color: #ffa200">
				    		<div class="progress-bar hidden" id="proBar"></div>
				    	</div>
				        <p id="error" style="font-size: 10px; color: red; margin-left: 20px;"></p>
				    </div> 
				    <hr>
                    <p style="text-align: center; color: black;"><a onclick="closeAndOpen()"
                            class="clickLogin">Forgot Password ?</a> </p>
                </form>
            </div>
        </div>
        
        <div id="forgotPassword" class="modal-container">
            <!-- Modal Login -->
            <div class="modal-content">
                <span style="color: black" onclick="closeModal('forgotPassword')" class="close">&times;</span>
                <h2 style="text-align: center; color: black">Forgot Password</h2>
                <form id="forgot-password" action="ForgotAndChangePassword" method="post">
                	<p style="margin: 10px">Enter your registered email :</p>
                	<div style="display: flex;">
                		<img src="./media/email.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 7px;">
                		<input id="forgotEmail" type="email" name="email" placeholder="Email ID" required><br>
                	</div>
                	<hr>
                    <div class="login-container">
						  <input type="button" class="login" value="Get Credentials" id="getCredential" onclick="getCredentialClicked()" style="margin-top: 10px; background-color: #ffa200">
						  <div class="progress-bar hidden" id="forgotProgress"></div>
					</div> 
                </form>
            </div>
        </div>
         
        <div id="logoutModal" class="modal-container">
            <!-- Modal content -->
            <div class="modal-content" style="max-width: 300px;">
                <form id="logoutForm" action="StudentLogout">
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
	        
	        function closeAndOpen() {
                openModal('forgotPassword');
                closeModal('changePassword');
            }
        </script>
        
        <script type="text/javascript">
	        function getCredentialClicked() {
	        	var forgotEmail = document.getElementById("forgotEmail"); 
	        	
	        	 if (forgotEmail.value.trim().length === 0) {
	        		 forgotEmail.style.border = "1px solid red";
	                 return;
	             }
	        	 else {
	        		 forgotEmail.style.border = "";  
			     }
	        	 document.getElementById("getCredential").style.display = "none"; 
		            document.getElementById("forgotProgress").classList.remove("hidden"); 
		            setTimeout(function() { 
		            	document.getElementById("forgot-password").submit();
		            }, 1000);  
	        }
        </script>
        
        <script type="text/javascript">
        
	        function registerClicked() { 
	        	if (validateForm()) {
	        		document.getElementById("signUpButton").style.display = "none"; 
		            document.getElementById("proBar").classList.remove("hidden");
		            setTimeout(function() {
		            	document.getElementById("change-password").submit(); 
		            }, 500);
		        } 
	        } 
	        
		    function validateForm() { 
		    	var currentPassword = document.getElementById("currentPassword");
		        var password = document.getElementById("newPassword");
		        var confirmPassword = document.getElementById("confirmPassword");
		
		        var valid = true;
		   
		        var passwordRegex = /^(?=.*[A-Z])(?=.*\d).{6,}$/;  
		        
		        var error = document.getElementById("error");
		        error.innerHTML = ""; 
		 		
		        
		        if (currentPassword.value === "") {
		            error.innerHTML = "Please insert Older Password !";
		            currentPassword.style.border = "1px solid red";
		            valid = false;
		            return valid;  
		        } else {
		        	currentPassword.style.border = "";  
		        }
		        
		        if (!passwordRegex.test(password.value.trim())) {
		            error.innerHTML = "Password must be at least 6 characters long, have at least one uppercase letter, and one number.";
		            password.style.border = "1px solid red";
		            valid = false;
		            return valid;  
		        } else {
		            password.style.border = "";  
		        }
		 
		        if (confirmPassword.value.trim() !== password.value.trim()) {
		            error.innerHTML = "Confirm Password and Passwords do not match.";
		            confirmPassword.style.border = "1px solid red";
		            valid = false;
		            return valid; 
		        } else {
		            confirmPassword.style.border = "";  
		        }
		        
		        if (currentPassword.value.trim() === password.value.trim()) {
		            error.innerHTML = "The new password cannot be the same as the old password !"; 
		            valid = false;
		            return valid;  
		        } else {
		        	currentPassword.style.border = "";  
		        }
		
		        return valid;
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
        			<a href="studentHome.jsp">Technology Roadmaps</a><p></p>
	                <a href="videoLecture.jsp">Video Lectures</a><p></p>
	                <a href="codingInhancement.jsp">Coding Enhancement</a><p></p>
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
        
        <button onclick="scrollToTop()" id="scrollBtn" title="Go to top"><img class="go-top" alt="" src="./media/play.png"></button>
        
        <script type="text/javascript"> 
		var mybutton = document.getElementById("scrollBtn"); 
		window.onscroll = function() {scrollFunction()};
        
		function scrollFunction() {
		  if (document.body.scrollTop > 30 || document.documentElement.scrollTop > 30) {
		    mybutton.style.display = "block";
		  } else {
		    mybutton.style.display = "none";
		  }
		} 
		function scrollToTop() { 
		  document.documentElement.scrollTop = 0; 
		}
		</script>
         
        
        
		<% } %>
    </body>
    </html>