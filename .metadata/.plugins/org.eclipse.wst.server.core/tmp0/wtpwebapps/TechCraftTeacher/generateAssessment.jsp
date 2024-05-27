<%@page import="techcraft.teacher.model.Assessment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.Session, org.hibernate.Transaction, org.hibernate.cfg.Configuration, org.hibernate.query.Query, techcraft.teacher.model.CodingAssessmentChallenge, techcraft.teacher.model.QuizAssessmentChallenge, java.util.List" %>
<!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>TechCraft Learning Hub</title>
        <link rel="stylesheet" href="teacherIndex.css" type="text/css">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="sweetalert2.min.js"></script>
		<link rel="stylesheet" href="sweetalert2.min.css">
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
		
		@keyframes zoomInOut {
		    0% {
		        transform: scale(1);
		    }
		    100% {
		        transform: scale(1.05);
		    }
		}
				
		.roadmap-main p {
			letter-spacing: 1px;
			margin: 0px 100px;
		}
		
		.roadmap-main h2 {
			letter-spacing: 1px;
			animation: zoomInOut 0.5s infinite alternate;
		}
		
		.roadmap-main fieldset {
	        letter-spacing: 1px;
	        margin: 30px 50px;
	        background-color: #fff;
	        font-weight: bold;
	        border: solid 4px #00bfff;
	        border-radius: 20px;
	        height: auto; 
	        padding-right: 30px;
	        padding-top: 0px;
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
	        align-items: center; 
	    }
	     
		.add-challenge { 
	        letter-spacing: 1px;
	        width: 100%;
	    }
	    
	    .add-challenge form {
	        margin: 20px;
	        padding: 20px;
	        margin-top: 0px;
	        padding-top: 10px;
	    }
	    
	    .form-div {
	        font-size: 13px; 
	        text-align: left;
	        margin: 10px; 
	        width: 100%;
	    }
	    
	    .form-div label {
	        padding: 5px;
		    margin: 10px 0px;
		    width: auto;
		    white-space: nowrap;
	    }
	    
	    .form-div input, .form-div option {
	        width: 100%;
	        padding: 15px;
	        margin: 5px 0px;
	        border-radius: 5px;
	        box-sizing: border-box;
	        border: 2px solid #000;
	        font-weight: bold;
	        letter-spacing: 1px;
	        transition: transform 0.3s ease;
	    }
	    
	    .form-div input:hover {
	    	transform: scale(1.02);
	    }
	    
	    .added-challenges {
	    	display: flex;
	    	margin: 25px 10px;
	    	padding: 15px;
	    	border: solid 2px #000;
	    	border-radius: 5px;
	    	margin-right: 0px;
	    }
	    
	    .add-challenge button {
	        color: #fff;
	        cursor: pointer;
	        font-weight: bold;
	        background-color: #00334d;
	        letter-spacing: 1px;
	        border: none;
	        padding: 15px 50px;
	        margin-left: 20px;
	        border-radius: 10px;
	        font-size: 15px; 
	        transition: transform 0.3s ease; 
	    }
	    
	    .add-challenge button:hover { 
	        background-color: #00334d;
	        transform: scale(1.02);
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
		
		.performance {
			text-decoration: none;
			cursor: pointer;
			color: #0bbfff;
			font-weight: bold;
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
	    	String assessmentAdded = request.getParameter("status");
	    	if(assessmentAdded != null && assessmentAdded.equals("success")) { %>
	    		<script type="text/javascript">
		            Swal.fire({
		            	title: "Congrates !",
		            	text: "Assessment generated Successfully !",
		            	icon: "success",
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
                <a href="studentDetails.jsp" style="margin-top: 10px;  ">Student Details</a>
                <a href="studentAttendance.jsp" style="margin-top: 10px;">Student Attendance</a>
                <a href="assessment.jsp" style="border-bottom: 2px solid #ffa200; margin-top: 10px; padding-bottom: 10px;">Technical Assessment</a>
                <a href="StudentProgress.jsp" style="margin-top: 10px;">Student's Progress</a>
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
        
        <% String module = request.getParameter("module"); %>
        <div class="dashboard-heading">
        	<span style="font-size: 15px; color: #888888">Dashboard:</span>
        	<span style="color: white"> Technical Assessments</span>
        </div>
        
        <div class="roadmap-main">
        	<div class="roadmap-heading"> 
        		<h2> <%= module %> Assessments</h2> 
        		<p>Technical assessment of TechCraft Learning Hub is a platform to be a comprehensive resource with a wealth of learning opportunities. The interactive quizzes and coding challenges were particularly beneficial, allowing for hands-on learning.</p> 
        		<fieldset>
		            <legend style="color: white; font-weight: bold;">Generate Assessments</legend> 
		            <div class="student-details">
		            	<% if(module.equals("Coding")) { %>
							<img src="./media/software-engineer.svg" alt="Illustration of a student" width="500px" height="500px">
						<% } else {%>
							<img src="./media/quiz.png" alt="Illustration of a student" width="450px" height="400px" style="margin-left: 20px;">
						<% } %>   
				        <div class="add-challenge">
				        
				        	<%	
				        		String topic = "";
					        	String instruction = "";
					        	String firstDate = "";
					        	String lastDate = "";
					        	String duration = "";
								
					        	if (request.getParameter("status") != null && request.getParameter("status").equals("added")) {
					                topic = request.getParameter("topic");
					                instruction = request.getParameter("instruction");
					                firstDate = request.getParameter("firstDate");
					                lastDate = request.getParameter("lastDate");
					                duration = request.getParameter("duration");
					            }
				        	%>
				        
				        	<form action="AddAssessment" method="post">
				        		<input type="hidden" name="type" value="<%= module %>">
				        		<input type="hidden" name="instructor" value="<%= name %>">
				        		<div class="form-div" style="margin: 20px;"> 
				        			<label for="topic">Topic:</label>
								    <input id="topic" name="topic" value="<%= topic %>" required></input>
								</div> 
								<div class="form-div" style="margin: 20px;">
				                	<label for="Instruction">Instruction:</label>
								    <input id="Instruction" name="Instruction" value="<%= instruction %>" required></input> 
								</div> 
								<div class="form-div" style="display: flex; align-items: center; justify-content: space-between;"> 
									<div style="margin-left: 10px;">
										<label for="assignedDate">Assigned Date :</label>
								    	<input type="date" id="assignedDate" name="assignedDate" value="<%= firstDate %>" required style="width: 200px"  readonly="readonly"></input>
								    </div>  
								    <script>
									    document.addEventListener('DOMContentLoaded', function() {
									        var today = new Date().toISOString().split('T')[0]; 
									        document.getElementById("assignedDate").value = today;
									    });
									</script>
								     
								    <div style="margin-left: 40px;">
								    	<label for="lastDate">Last Date :</label>
								    	<input type="date" id="lastDate" name="lastDate" value="<%= lastDate %>" required style="width: 200px"></input>
								    </div> 
								    <div style="margin-left: 60px;">
								    	<label for="duration">Duration :</label>
								    	<input type="number" id="duration" name="duration" value="<%= duration %>" required style="width: 200px" placeholder="In Minutes"></input>
								    </div> 
								</div> 
								<div class="form-div">
									<%	  
					            		SessionFactory factory = new Configuration().configure().buildSessionFactory();
						            	Session studentSession = factory.openSession();
							        	try { 
							        		if(module.equals("Coding")) {
							        			Query<CodingAssessmentChallenge> query = studentSession.createQuery("FROM CodingAssessmentChallenge WHERE topic =:topic AND assignedDate =:assignedDate", CodingAssessmentChallenge.class);
							        			query.setParameter("topic", topic);
								            	query.setParameter("assignedDate", firstDate);
								            	List<CodingAssessmentChallenge> challenges = query.getResultList();
								
								                for (int i = 0; i < challenges.size(); i++) {
								                	CodingAssessmentChallenge challenge = challenges.get(i);
								    %>
								    				<div class="added-challenges">
													<b>Challenge <%= i+1 %> : <%= challenge.getChallengeTopic() %></b>
													<span style="flex: 1"></span>
													<b style="font-size: 15px; cursor: pointer;"> &times;</b>
													</div>
								    <%
								                }
								            }
							        		else {
							        			Query<QuizAssessmentChallenge> query = studentSession.createQuery("FROM QuizAssessmentChallenge WHERE topic =:topic AND assignedDate =:assignedDate", QuizAssessmentChallenge.class);
							        			query.setParameter("topic", topic);
								            	query.setParameter("assignedDate", firstDate);
								            	List<QuizAssessmentChallenge> challenges = query.getResultList();
								
								                for (int i = 0; i < challenges.size(); i++) {
								                	QuizAssessmentChallenge challenge = challenges.get(i);
								    %>
								    				<div class="added-challenges">
													<b>Question <%= i+1 %> : <%= challenge.getQuestion() %></b>
													<span style="flex: 1"></span>
													<!--  <b style="font-size: 15px; cursor: pointer;"> &times;</b> -->
													</div>
								    <%
								                }
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
								<div class="form-div" style="margin: 20px;">
									<% if(module.equals("Coding")) { %>
								    	<button type="button" onclick="openCodingModal()" style="background-color: #0bbfff; border: none; color: #fff; width: auto; margin-left: 0px;">Add Challenge +</button>
								    	<span style="font-size: 10px; margin-left: 10px;">Note : You can add more challenges to this assessment later also, but only today !</span> 
									<% } else {%>
										<button type="button" onclick="openCodingModal()" style="background-color: #0bbfff; border: none; color: #fff; width: auto; margin-left: 0px;">Add Question +</button>
										<span style="font-size: 10px; margin-left: 10px;">Note : You can add more Questions to this assessment later also, but only today !</span> 
									<% } %> 
								</div>  
								<button type="submit" value="generate" style="align-items: left; width: 100%; margin-left: 20px;">Generate Assessment</button>
				            </form>
				        </div>
				    </div> 
		        </fieldset>
		        <fieldset style="background-color: #002233; border: 4px solid #000; padding-right: 10px;">
		            <legend style="color: white; font-weight: bold;">Previous Assessments</legend> 
		            <div class="student-details">  
				        	<table>
				        		<tr>
				        			<th>Sr No.</th>
				        			<th>Topic</th>
				        			<th>Instructor</th>
				        			<th>Assigned Date</th>
				        			<th>Last Date</th>
				        			<th>Performance</th>
				        			<th></th> 
				        		</tr> 
				                 
				        		<%  
						            SessionFactory factory1 = new Configuration().configure().buildSessionFactory();
						            Session studentSession1 = factory1.openSession(); 
						            
						            try { 
						                Query<Assessment> query1 = studentSession1.createQuery("FROM Assessment WHERE type =:type AND instructor =:instructor", Assessment.class);
						                query1.setParameter("type", module);
						                query1.setParameter("instructor", name);
						                List<Assessment> assessments = query1.getResultList();
						
						                for (int i = 0; i < assessments.size(); i++) {
						                	Assessment assessment = assessments.get(i);
						        %>
									        <tr style="background-color: #002233; height: 8px"></tr>
									        <tr>
									            <td style="border-bottom-left-radius: 10px; border-top-left-radius: 10px;"><%= i + 1 %></td>
									            <td><%= assessment.getTopic() %></td>
									            <td><%= assessment.getInstructor() %></td>
									            <td><%= assessment.getAssignedDate() %></td> 
									            <td><%= assessment.getLastDate() %><img src="./media/edit-text.png" title="Change Date" width="15px" height="15px" onclick="openModal('changeLastDate')" style="margin-left: 10px; cursor: pointer;"></td>
									            <td><a class="performance" href="#">View Performance</a></td> 
									            <td style="border-bottom-right-radius: 10px; border-top-right-radius: 10px;"><img src="./media/trash-bin.png" title="Delete Assessment" width="20px" height="20px" onclick="openModal('deleteAssessment')" style="cursor: pointer;"></td>
									        </tr> 
						        <% 
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
						        <tr style="background-color: #002233; height: 8px"></tr>
						        <tr> 
									<td colspan="7" style="border-radius: 10px;">No more Records !</td> 
								</tr>
				        	</table> 
				    </div>
		        </fieldset> 
        	</div>
        </div>
        
        <div id="addChallenge" class="modal-container">
		    <!-- Modal Login -->
		    <div class="modal-content" style="max-width: 1000px; margin: auto; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); font-weight: bold;">
		        <span style="color: black" onclick="closeModal('addChallenge')" class="close">&times;</span>
		        <% if(module.equals("Coding")) { %>
					<h2 style="text-align: center; color: black">Add Challenge</h2>
				<% } else {%>
					<h2 style="text-align: center; color: black">Add Question</h2> 
				<% } %>
		        
		        <div class="add-challenge">
		        	<% if(module.equals("Coding")) { %>
			            <form action="AddCodingChallenge" method="post" style="margin: 0px; padding: 0px;">
			            	<input type="hidden" id="CodingAssessmentTopic" name="CodingAssessmentTopic">
			            	<input type="hidden" id="CodingAssessmentInstruction" name="CodingAssessmentInstruction">
			            	<input type="hidden" id="CodingAssessmentDate" name="CodingAssessmentDate">
			            	<input type="hidden" id="CodingAssessmentLastDate" name="CodingAssessmentLastDate"> 
			            	<input type="hidden" id="CodingAssessmentDuration" name="CodingAssessmentDuration">
			            	
			            	<div style="display: flex; gap: 20px;">
				                <div class="form-div"> 
				                    <label for="CodingchallengeTopic">Title:</label>
				                    <input id="CodingchallengeTopic" name="CodingchallengeTopic" required></input>
				                </div>
				                <div class="form-div">
				                    <label for="description">Description:</label>
				                    <input id="description" name="description" required></input>
				                </div>
			                </div>
			                <div style="display: flex; gap: 20px;">
				                <div class="form-div">
				                    <label for="CodingQuestion">Question:</label>
				                    <input id="CodingQuestion" name="CodingQuestion" required></input>
				                </div>
				                <div class="form-div">
				                    <label for="function_desc">Function Description:</label>
				                    <input id="function_desc" name="function_desc" required></input>
				                </div>
			                </div>
			                <div style="display: flex; gap: 20px;">
				                <div class="form-div">
				                    <label for="input_format">Input Format:</label>
				                    <input id="input_format" name="input_format" required></input>
				                </div>
				                <div class="form-div">
				                    <label for="input_format">Output Format:</label>
				                    <input id="output_format" name="output_format" required></input>
				                </div>
			                </div>
			                <div style="display: flex; gap: 20px;">
				                <div class="form-div">
				                    <label for="sample_input">Sample Input:</label>
				                    <input id="sample_input" name="sample_input" required></input> 
				                </div>
				                <div class="form-div"> 
				                    <label for="required_output">Required Output:</label>
				                    <input id="required_output" name="required_output" required></input>
				                </div>
				            </div>
				                <div class="form-div">
				                    <label for="explanation">Explanation:</label>
				                    <input id="explanation" name="explanation" required style="width: 98%"></input>
				                </div>  
			                <button type="submit" value="Submit" style="margin-left: 10px; margin-top: 20px; background-color: #ffa200; color: #002233;">Add Challenge</button>
			            </form>
			    	<% } else { %>
			    		<form action="AddQuizQuestion" method="post" style="margin: 0px; padding: 0px;">
			            	<input type="hidden" id="CodingAssessmentTopic" name="CodingAssessmentTopic">
			            	<input type="hidden" id="CodingAssessmentInstruction" name="CodingAssessmentInstruction">
			            	<input type="hidden" id="CodingAssessmentDate" name="CodingAssessmentDate">
			            	<input type="hidden" id="CodingAssessmentLastDate" name="CodingAssessmentLastDate"> 
			            	<input type="hidden" id="CodingAssessmentDuration" name="CodingAssessmentDuration">
			            	
			            	 <div class="form-div">
						        <label for="question">Question:</label>
						        <input id="question" name="question" required style="width: 98%"></input>
						    </div>
						    <div style="display: flex; gap: 20px;">
							    <div class="form-div">
							        <label for="option1">Option 1:</label>
							        <input id="option1" name="option1" required oninput="updateCorrectOption(this.value, 'correctOption1')">
							    </div>
							    <div class="form-div">
							        <label for="option2">Option 2:</label>
							        <input id="option2" name="option2" required oninput="updateCorrectOption(this.value, 'correctOption2')">
							    </div>
							</div>
							<div style="display: flex; gap: 20px;">
							    <div class="form-div">
							        <label for="option3">Option 3:</label>
							        <input id="option3" name="option3" required oninput="updateCorrectOption(this.value, 'correctOption3')">
							    </div>
							    <div class="form-div">
							        <label for="option4">Option 4:</label>
							        <input id="option4" name="option4" required oninput="updateCorrectOption(this.value, 'correctOption4')">
							    </div>
							</div>
							<div class="form-div">
							    <label for="correctOption">Correct Option:</label>
							    <select id="correctOption" name="correctOption" required style="width: 98%; padding: 10px; margin: 10px 0px; border: 2px solid #000; border-radius: 5px; font-weight: bold;">
							        <option id="correctOption1">Option 1</option>
							        <option id="correctOption2">Option 2</option>
							        <option id="correctOption3">Option 3</option>
							        <option id="correctOption4">Option 4</option>
							    </select>
							</div>
							
							<script type="text/javascript">
							    function updateCorrectOption(value, optionId) {
							        document.getElementById(optionId).innerText = value;
							    }
							</script>
						    
			                <button type="submit" value="Submit" style="margin-left: 10px; margin-top: 20px; background-color: #ffa200; color: #002233;">Add Question</button>
			            </form>
			    	<% } %>
		        </div>
		    </div>
		</div>
         
        <div id="deleteAssessment" class="modal-container">
            <!-- Modal content -->
            <div class="modal-content" style="max-width: 300px; margin: auto; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
                <form id="delete-assessment" action=" " method="post">
                    <p style="color: black">Do you want to delete Assessment ?</p>
                    <div style="display: flex; gap: 10px; align-item: center"> 
                    	<input type="hidden" name="module" value="<%= module %>">
                        <input type="button" class="login" style="background-color: #ffa200; border: none" value="Yes"
                            onclick="deleteAssessment()">
                        <input type="button" class="login" style="background-color: #d2d2e0; border: none" value="No"
                            onclick="closeModal('deleteAssessment')">
                    </div>
                </form>
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
        
        <div id="changeLastDate" class="modal-container">
		    <!-- Modal Login -->
		    <div class="modal-content" style="max-width: 550px; margin: auto; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%); font-weight: bold;">
		        <span style="color: black" onclick="closeModal('changeLastDate')" class="close">&times;</span>
		        <h2 style="text-align: center; color: black">Update Submission Date :</h2>
		        <div class="add-challenge">
		            <form action=" " method="post" style="margin: 0px; padding: 0px;">
		            	 <div class="form-div" style="display: flex; align-items: center; justify-content: center;"> 
							<div style="margin-left: 10px;">
								<input type="hidden" name="module" value="<%= module %>">
								<label for="newLastdate">Last Date :</label>
								<input type="date" id="newLastdate" name="newLastdate" required style="width: 200px"></input> 
							</div>
							<button type="submit" value="Submit" style="margin-left: 20px; background-color: #ffa200; color: #002233;">Update</button>
						</div>  
		                
		            </form>
		        </div>
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
	        
	        function deleteAssessment() {
	        	document.getElementById("delete-assessment").submit();
	        }
	        
	        function openCodingModal() {
	             
	            var topicInput = document.getElementById("topic");
	            var instructionInput = document.getElementById("Instruction");
	            var assignedDateInput = document.getElementById("assignedDate");
	            var lastDateInput = document.getElementById("lastDate");
	            var durationInput = document.getElementById("duration");

	            var topic = topicInput.value.trim();
	            var instruction = instructionInput.value.trim();
	            var assignedDate = assignedDateInput.value.trim();
	            var lastDate = lastDateInput.value.trim();
	            var duration = durationInput.value.trim();

	            if (topic === '') {
	                topicInput.style.borderColor = 'red';
	                return;
	            } else {
	                topicInput.style.borderColor = '';
	            }

	            if (instruction === '') {
	                instructionInput.style.borderColor = 'red';
	                return;
	            } else {
	                instructionInput.style.borderColor = '';
	            }

	            if (assignedDate === '') {
	                assignedDateInput.style.borderColor = 'red';
	                return;
	            } else {
	                assignedDateInput.style.borderColor = '';
	            }

	            if (lastDate === '') {
	                lastDateInput.style.borderColor = 'red';
	                return;
	            } else {
	                lastDateInput.style.borderColor = '';
	            }

	            if (duration === '') {
	                durationInput.style.borderColor = 'red';
	                return;
	            } else {
	                durationInput.style.borderColor = '';
	            }
	            
	            var CodingAssessmentTopic = document.getElementById("CodingAssessmentTopic");
	            var CodingAssessmentInstruction = document.getElementById("CodingAssessmentInstruction");
	            var CodingAssessmentDate = document.getElementById("CodingAssessmentDate");
	            var CodingAssessmentLastDate = document.getElementById("CodingAssessmentLastDate");
	            var CodingAssessmentDuration = document.getElementById("CodingAssessmentDuration");
				
	            console.log("CodingAssessmentTopic"+topic);
	            console.log("CodingAssessmentDate"+assignedDate);
	            
	            CodingAssessmentTopic.value = topic;
	            CodingAssessmentInstruction.value = instruction;
	            CodingAssessmentDate.value = assignedDate;
	            CodingAssessmentLastDate.value = lastDate;
	            CodingAssessmentDuration.value = duration;
	            
	            var modal = document.getElementById("addChallenge");
	            modal.style.display = 'block';
	            
	        }
        </script>
        
        <script type="text/javascript">
        	function changeLastDate() {
				
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