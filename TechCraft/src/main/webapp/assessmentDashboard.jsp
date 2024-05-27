<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="techcraft.model.AssessmentResult"%>
<%@page import="techcraft.dao.CodingDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.Session, org.hibernate.Transaction, org.hibernate.cfg.Configuration, org.hibernate.query.Query, techcraft.model.Assessment, java.util.List" %>
<!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>TechCraft Learning Hub</title>
        <link rel="stylesheet" href="index.css" type="text/css"> 
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
		        transform: scale(1.05);
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
	    }
	    
	    legend {
			background-color: #ffa200;
			border-radius: 10px;
			padding: 15px;
			font-size: 13px;
		}
		 
	    .progress b {
			letter-spacing: 1px;
			font-size: 13px; 
		}
	    .progress-container { 
	        width: 300px;
	        height: 10px;
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
	        font-size: 30px;
	        margin: 10px;
	        margin-bottom: 0px;
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
		    padding: 10px;
		    font-weight: normal;
		    border: none;
		    padding: 30px;  
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
	    
	    button {
			color: #fff;
		    cursor: pointer;  
		    letter-spacing: 1px;
		    background-color: #ffa200;
		    border: none;
		    padding: 10px 15px;
		    margin: 10px 0px;  
		    border-radius: 5px;
		    font-size: 12px;
		    font-weight: bold; 
		    transition: transform 0.3s ease;
		}
		
		button:hover {
			background-color: #0bbfff;
			transform: scale(1.1);
		}
		
		.modal-content span {
			font-size: 12px;
			letter-spacing: 1px;
			margin: 10px;
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
        
        <% String module = request.getParameter("module"); %>
        
        <div class="dashboard-heading">
        	<span style="font-size: 15px; color: #888888">Dashboard:</span>
        	<span style="color: white"> <%= module %> Assessments</span>
        </div>
        
        <div class="roadmap-main">
        	<div class="roadmap-heading"><br>   
        		<p>Technical assessment of TechCraft Learning Hub is a platform to be a comprehensive resource with a wealth of learning opportunities. The interactive quizzes and coding challenges were particularly beneficial, allowing for hands-on learning.</p> 
        		<div style="display: flex; margin: 0px 50px; margin-top: 20px;">
	        		<div class="dashboard-heading" style="margin: 10px 10px;">   
			        	<span style="color: black; font-size: 25px;"><%= module %> Assessments</span>
			        </div> 
			        <span style="flex: 1"></span>
			        <div style="display: flex;">
						<div class="progress">
							<b id="completed">Complete all the assessments !</b> 
							<div class="progress-container">
							    <div class="progress-barr" id="progressBar"></div>
							</div> 
						</div>
						<div class="progress-text" id="progressText"></div> 
					</div>
				</div>
        		<fieldset>
		            <table>
					    <tr>
					        <th width="50px">Sr No.</th>
					        <th>Topic</th> 
					        <th width="300px">Instruction</th>
					        <th width="140px">Assigned Date</th>
					        <th>Instructor</th>
					        <th width="140px">Last Date</th>
					        <th width="100px">Status</th>
					        <th width="170px">Performance</th>
					    </tr> 
					    <% 
					    	SessionFactory factory1=new Configuration().configure().buildSessionFactory(); 
					    	Session studentSession1=factory1.openSession(); 
					    	try { 
					    		Query<Assessment> query1 = studentSession1.createQuery("FROM Assessment WHERE type =:type", Assessment.class);
					    		query1.setParameter("type", module); 
						    	List<Assessment> assessments = query1.getResultList();
						
						    	for (int i = 0; i < assessments.size(); i++) { 
						    		Assessment assessment = assessments.get(i); 
						%> 
								    <tr style="background-color: #002233; height: 8px"></tr>
								    <tr>  
								        <td style="border-bottom-left-radius: 10px; border-top-left-radius: 10px;"><%= i+1 %></td>
								        <td><%= assessment.getTopic() %></td> 
								        <td><%= assessment.getInstruction() %></td>
								        <td><%= assessment.getAssignedDate() %></td>
								        <td><%= assessment.getInstructor() %></td>
								        <td><%= assessment.getLastDate() %></td>
								        <%  
								        	LocalDate currentDate = LocalDate.now(); 
								        	String lastDate = assessment.getLastDate();
								        	String currentDateString = currentDate.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
								        	
									        Query<AssessmentResult> query = studentSession1.createQuery("FROM AssessmentResult WHERE studentName = :studentName AND assignedDate = :assignedDate AND topic = :topic AND type = :type", AssessmentResult.class);
									        query.setParameter("studentName", name);
									        query.setParameter("assignedDate", assessment.getAssignedDate());
									        query.setParameter("topic", assessment.getTopic());
									        query.setParameter("type", module);
									        AssessmentResult existingAssessment = query.uniqueResult();
										
									        if(existingAssessment != null) {
									    %>
									    	<td><button type="button" style="pointer-events: none; background-color: #0bbfff; width: 120px;">Submitted !</button></td>
											<td style="border-bottom-right-radius: 10px; border-top-right-radius: 10px;"><a class="performance" onclick="viewPerformance('<%= existingAssessment.getTopic() %>','<%= existingAssessment.getInstructor() %>','<%= existingAssessment.getAssignedDate() %>','<%= existingAssessment.getCorrectAnswers() %>','<%= existingAssessment.getTotalQuestions() %>')">View Performance</a></td> 
									    <% 
									        }
									        else {
										        if (lastDate.compareTo(currentDateString) < 0) {
											%>
													<td><button type="button" style="pointer-events: none; background-color: #fff; color: black; width: 120px;">Expired !</button></td>
													<td></td> 
											<%
										        }
												else {
											%>
											        <% if(module.equals("Coding")) { %>
											        	<td><button type="button" onclick="openCodingAssessment('coding-instruction','<%= assessment.getTopic() %>','<%= assessment.getAssignedDate() %>', '<%= assessment.getInstructor() %>','<%= assessment.getDuration() %>','<%= assessment.getLastDate() %>')">Pending</button></td>
											        <% }
											           else { %>
											        	<td><button type="button" onclick="openQuizAssessment('quiz-instruction','<%= assessment.getTopic() %>','<%= assessment.getAssignedDate() %>', '<%= assessment.getInstructor() %>','<%= assessment.getDuration() %>','<%= assessment.getLastDate() %>')">Pending</button></td>
											        <% }
											        %>
											        	<td></td>
											        <%
										        } 
									        }
										%> 
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
					</table><br><br>
					<span style="color: white; font-weight: bold;">No more Assessments !</span>
		        </fieldset>  
        	</div>
        </div>
        
        <div id="coding-instruction" class="modal-container">
            <!-- Modal Login -->
            <div class="modal-content" style="max-width: 500px;">
                <span style="color: black" onclick="closeModal('coding-instruction')" class="close"><h2>&times;</h2></span>
                <h2 style="text-align: center; color: black">Assessment Instruction</h2>
                <form id="coding-instruction-form" action="CodingAssessment.jsp">
                	<input type="hidden" name="topic" id="coding-instruction-topic">
                	<input type="hidden" name="date" id="coding-instruction-firstdate">
                	<input type="hidden" name="time" id="coding-instruction-time">
                	<input type="hidden" name="instructor" id="coding-instruction-instructor">
                	<input type="hidden" name="module" value="<%= module %>">
                	<p id="coding-instruction-topic2" style="margin: 10px;"><b>Topic : String and Array</b></p>
                	<span id="coding-instruction-lastdate"><b>Last Date :</b> 5-May-2024 upto 11:59 pm</span><br>
                	<pre></pre>
                	<span id="coding-instruction-duration"><b>Duration :</b> 45 minutes</span>  
                	<hr><br>
                	<b style="margin: 10px">Instructions :</b><br> 
					<span style="display: block; margin: 10px">You are required to write code to solve each problem.</span>  
					<span style="display: block; margin: 10px">Make sure to thoroughly test your code before submission.</span>   
					<span style="display: block; margin: 10px">There is no negative marking for incorrect answers.</span>
					<span style="display: block; margin: 10px">You can submit the challenge only once.</span>
					<span style="display: block; margin: 10px">Make sure to solve all challenges before submitting.</span> 
					<span style="display: block; margin: 10px">Click the "Submit Assessment" button to submit your challenges.</span>
					<span style="display: block; margin: 10px">Once submitted, you cannot modify your challenge.</span>
                    <br>
                    <p style="font-size: 12px; margin-left: 10px;"><b style="font-size: 15px;">Important :</b><br><br> Once you start an assessment, it will automatically submit after the allotted time unless you manually submit it !</p>
                    <br>
                    <div class="login-container">
                    	<input type="hidden" name="topic" value="Arrays"> 
						<input type="button" class="login" value="Start Assessment" id="start-coding-Assessment" onclick="startAssessment('start-coding-Assessment','start-coding-Progress','coding-instruction-form','coding-instruction')" style="margin-top: 10px; background-color: #ffa200">
						<div class="progress-bar hidden" id="start-coding-Progress"></div>
					</div> 
                </form>
            </div>
        </div>
        
        <div id="quiz-instruction" class="modal-container">
            <!-- Modal Login -->
            <div class="modal-content" style="max-width: 500px;">
                <span style="color: black" onclick="closeModal('quiz-instruction')" class="close"><h2>&times;</h2></span>
                <h2 style="text-align: center; color: black">Assessment Instruction</h2>
                <form id="quiz-instruction-form" action="QuizAssessment.jsp">
                	<input type="hidden" name="topic" id="quiz-instruction-topic">
                	<input type="hidden" name="date" id="quiz-instruction-firstdate">
                	<input type="hidden" name="instructor" id="quiz-instruction-instructor">
                	<input type="hidden" name="time" id="quiz-instruction-time">
                	<input type="hidden" name="module" value="<%= module %>">
                	<p id="quiz-instruction-topic2" style="margin: 10px;"><b>Topic : String and Array</b></p>
                	<span id="quiz-instruction-lastdate"><b>Last Date :</b> 5-May-2024 upto 11:59 pm</span><br>
                	<pre></pre>
                	<span id="quiz-instruction-duration"><b>Duration :</b> 45 minutes</span>  
                	<hr><br>
                	<b style="margin: 10px">Instructions :</b><br> 
					<span style="display: block; margin: 10px">Each question has Four options.</span>    
					<span style="display: block; margin: 10px">There is no negative marking for incorrect answers.</span> 
					<span style="display: block; margin: 10px">You can only submit the quiz once.</span>
					<span style="display: block; margin: 10px">Make sure to answer all questions before submitting.</span>
					<span style="display: block; margin: 10px">Click the "Submit Assessment" button to submit your answers.</span>
					<span style="display: block; margin: 10px">Once submitted, you cannot modify your answers.</span>
                    <br> 
                    <p style="font-size: 12px; margin-left: 10px;"><b style="font-size: 15px;">Important :</b><br><br> Once you start an assessment, it will automatically submit after the allotted time unless you manually submit it !</p>
                    <br>
                    <div class="login-container">
                    	<input type="hidden" name="topic" value="Arrays"> 
						<input type="button" class="login" value="Start Assessment" id="start-quiz-Assessment" onclick="startAssessment('start-quiz-Assessment','start-quiz-Progress','quiz-instruction-form','quiz-instruction')" style="margin-top: 10px; background-color: #ffa200">
						<div class="progress-bar hidden" id="start-quiz-Progress"></div>
					</div> 
                </form>
            </div>
        </div>
        
        <div id="view-performance" class="modal-container">
            <!-- Modal Login -->
            <div class="modal-content" style="max-width: 360px;">
                <span style="color: black" onclick="closeModal('view-performance')" class="close"><h2>&times;</h2></span>
                <h2 style="text-align: center; color: black">Assessment Performance</h2>
                <p style="margin-left: 35px; font-size: 13px;" id="performance-topic">Topic : Arrays</p>
                <p style="margin-left: 35px; font-size: 13px;" id="performance-instructor">Instructor : Amol Dixit</p>
                <p style="margin-left: 35px; font-size: 13px;" id="performance-date">Assigned Date : 2024-05-10</p>
                <p style="margin-left: 35px; font-size: 13px;" id="performance-answers">Correct Answers : 7</p>
                <p style="margin-left: 35px; font-size: 13px;" id="performance-questions">Total Questions : 10</p> 
                <p style="margin-left: 35px; font-size: 13px;" id="performance-accuracy">Accuracy : 70 %</p> 
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
        
        <button onclick="scrollToTop()" id="scrollBtn" title="Go to top"><img class="go-top" alt="" src="./media/play.png"></button>
        
        <script type="text/javascript">
		    function startAssessment(start, progress, form, modalId) {
		        document.getElementById(start).style.display = "none"; 
		        document.getElementById(progress).classList.remove("hidden"); 
		        setTimeout(function() { 
		            document.getElementById(form).submit(); 
		        }, 1000);
		        setTimeout(function() {  
		            document.getElementById(start).style.display = "block"; 
		            document.getElementById(progress).classList.add("hidden");
		            closeModal(modalId);
		        }, 1500);
		    }
		</script>
        
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
        
        <script type="text/javascript">
        	function openCodingAssessment(formId, topic, firstdate, instructor, duration, lastdate) {
        		console.log(topic+" "+firstdate+" "+duration+" "+lastdate+" "+instructor);
        		
        		document.getElementById("coding-instruction-topic").value = topic; 
        		document.getElementById("coding-instruction-topic2").innerHTML = "<b>Topic : "+topic+"</b>";
        		document.getElementById("coding-instruction-firstdate").value = firstdate;
        		document.getElementById("coding-instruction-instructor").value = instructor;
        		document.getElementById("coding-instruction-time").value = duration;
        		document.getElementById("coding-instruction-lastdate").innerHTML = "<b>Last Date of Submission:</b> "+lastdate+" upto 11:59 pm ";
        		document.getElementById("coding-instruction-duration").innerHTML = "<b>Duration :</b> "+duration+" minutes ";
        		
                var modal = document.getElementById(formId);  
	            modal.style.display = 'block';
        	}
        	function openQuizAssessment(formId, topic, firstdate, instructor, duration, lastdate) {
        		console.log(topic+" "+firstdate+" "+duration+" "+lastdate);
        		
        		document.getElementById("quiz-instruction-topic").value = topic; 
        		document.getElementById("quiz-instruction-topic2").innerHTML = "<b>Topic : "+topic+"</b>";
        		document.getElementById("quiz-instruction-firstdate").value = firstdate;
        		document.getElementById("quiz-instruction-instructor").value = instructor;
        		document.getElementById("quiz-instruction-time").value = duration;
        		document.getElementById("quiz-instruction-lastdate").innerHTML = "<b>Last Date of Submission:</b> "+lastdate+" upto 11:59 pm ";
        		document.getElementById("quiz-instruction-duration").innerHTML = "<b>Duration :</b> "+duration+" minutes ";
        		
                var modal = document.getElementById(formId);  
	            modal.style.display = 'block';
        	}
        </script>
         
        <%
        	int totalAssessment = CodingDao.totalAssessment(module);
        	int totalSubmitedAssessments = CodingDao.totalSubmitedAssessment(name, module);
        %>
          
        <script type="text/javascript">
		    const progressBar = document.getElementById('progressBar');
		    const progressText = document.getElementById('progressText');
		     
		    let width = 0;
		    const interval = setInterval(() => {
		        if (width == 100) { 
		        	const progressTopText = document.getElementById('completed');
		        	progressTopText.innerHTML = "All assessments are completed !";
		        	clearInterval(interval);
		        } 
		        else {
		        	if(<%=totalSubmitedAssessments %> == 0 && <%=totalAssessment %> == 0) {
		        		progressBar.style.width = 0 + '%'; 
			            progressText.innerText = 0 + '%';
		        	}
		        	else {
		        		 width = (<%=totalSubmitedAssessments %>/<%=totalAssessment %>) * 100;
				         progressBar.style.width = width + '%'; 
				         progressText.innerText = width.toFixed(0) + '%';
		        	} 
		        }
		    }, 50);
		</script>
		
		<script type="text/javascript">
			function viewPerformance(topic, instructor, date, answers, questions) {
				document.getElementById("performance-topic").innerHTML = "<b>Topic : </b>"+topic;
			    document.getElementById("performance-instructor").innerHTML = "<b>Instructor : </b>"+instructor;
			    document.getElementById("performance-date").innerHTML = "<b>Assigned Date : </b>"+date;
			    document.getElementById("performance-answers").innerHTML = "<b>Correct Answers : </b>"+answers;
			    document.getElementById("performance-questions").innerHTML = "<b>Total Questions : </b>"+questions;
			    document.getElementById("performance-accuracy").innerHTML = "<b>Performnace Accuracy : </b>"+((answers*100)/questions).toFixed(2)+" %";
			    
				openModal('view-performance');
			}
		</script>
		
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
        
		<% } %>
    </body>
    </html>