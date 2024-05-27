<%@page import="techcraft.dao.QuizDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.Session, org.hibernate.Transaction, org.hibernate.cfg.Configuration, org.hibernate.query.Query, techcraft.model.Quiz, techcraft.model.QuizProgress, java.util.List" %>
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
		 
		.roadmap-main {
			width: auto;
		    height: auto;
		    background-size: cover; 
		    background-image: url("./media/techback.jpg"); 
		    text-align: center;
		    padding: 10px 0px;
		}
		
		.roadmap-main h3 {
			color: #002233;
			letter-spacing: 1px;
			margin-bottom: 30px; 
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
			display: flex; 
			letter-spacing: 1px;
			margin: 10px 0px;
			background-color: #002233;
			font-weight: bold; 
			border: none;
			height: auto; 
			width: 100%; 
			margin-bottom: 30px;
			padding: 10px; 
		}
		 
		.quiz-main {
			display: flex; 
			width: 100%;
		}
		
		.quiz-topics {
			width: 600px;
			border: solid 2px #000;
			border-radius: 10px;
			background-color: white;
			height: auto; 
			margin: 10px; 
			text-align: left;
			padding: 0px 30px;
			padding-bottom: 30px;
		}
		
		.topic-name {
			cursor: pointer;
			border-bottom: solid 2px #000;
			padding-bottom: 20px;
			width: 100%;
			margin: 10px 0px;
			align-items: center;
			justify-content: center;
			background-color: white;
			font-size: 13px;
			color: black;
			transition: transform 0.3s ease;
		}
		
		.topic-name:hover {
			color: #0bbfff;
			transform: scale(1.02);
		}
		
		.question {   
			text-align: left;
			padding: 20px 0px;
			padding-bottom: 0px;
		}
		
		.quiz-questions {
			width: 100%; 
			border: solid 2px #000;
			border-radius: 10px;
			background-color: white;
			margin: 10px;
			text-align: left;
			padding: 20px 40px;
			font-size: 13px;
		}
		 
		.quiz-option {
			cursor: pointer;
			border: solid 2px #000;
			border-radius: 10px;
			padding: 10px;
			width: auto;
			margin: 10px 0px;
			align-items: center;
			justify-content: center;
			background-color: white;
			color: black;
			transition: transform 0.3s ease;
		}
		
		.quiz-option label {
			cursor: pointer;
		}
		  
		.quiz-option:hover { 
			border: solid 2px #0bbfff; 
			transform: scale(1.01);
		}
		
		.selected {
            color: #fff;
            background-color: #002233; 
        }
        
        .Answer {
        	display: flex;
        	gap: 15px;  
			margin-bottom: 30px; 
			align-items: center; 
        }
        
        .explanation { 
        	font-weight: normal;
        	width: 100%;
        }
		
		.quiz-questions button {
			color: #fff;
		    cursor: pointer;  
		    letter-spacing: 1px;
		    background-color: #ffa200;
		    border: none;
		    padding: 15px 20px;
		    font-weight: bold;
		    margin: 10px 5px;  
		    border-radius: 10px;
		    font-size: 12px;
		    width: 180px; 
		    transition: transform 0.3s ease;
		}
		
		.quiz-questions button:hover { 
			transform: scale(1.05);
		}
    </style>

    <body>
    
    	<%
	        String name = (String) session.getAttribute("name");
	        if (name == null) {
	            response.sendRedirect("index.jsp");
	        } else {
	    %>
	    <input type="hidden" id="alert-topic" value="<%= request.getParameter("topic") %>">
	    <% 
	        String status = request.getParameter("status");
	    	System.out.print(status);
	        if (status != null && status.equals("success")) {
	    %>
	            <script type="text/javascript">
	            	var alertTopic = document.getElementById("alert-topic").value;  
		            Swal.fire({
		            	title: "Quiz Submited Successfully !",
		            	text: "For Topic : "+alertTopic+".",
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
                <a href="studentHome.jsp" style="margin-top: 10px; color: #fff">Technology Roadmaps</a>
                <a href="videoLecture.jsp" style="margin-top: 10px; color: #fff">Video Lectures</a>
                <a href="codingInhancement.jsp" style="margin-top: 10px; color: #fff">Coding Enhancement</a>
                <a href="technicalQuiz.jsp" style="border-bottom: 2px solid #ffa200; margin-top: 10px; padding-bottom: 10px;">Technical Quiz</a>
            </div>
            <span style="flex: 1; margin-right: 0px;"></span>
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
        	<span style="color: white"> Technical Quiz</span>
        </div> 
        
        <div class="roadmap-main">
        	<div class="roadmap-heading"><br> 
        		<p>Embark on an Enlightening Knowledge Quest with TechCraft Learning Hub's Expertly Crafted Guided Quizzes, Molding Your Personalized Learning journey.</p> 
        		<div style="display: flex; margin: 0px 50px; margin-top: 20px;">
	        		<div class="dashboard-heading" style="margin: 10px 10px;"> 
	        			<% String technology = request.getParameter("submitButton"); %>
			        	<span style="font-size: 15px; color: #888888">prepare:</span>
			        	<span style="color: black; font-size: 25px;"><%= technology %></span>
			        </div> 
			        <span style="flex: 1"></span>
			        <div style="display: flex;">
						<div class="progress">
							<b id="completed">Complete all to get your Certificate !</b>
							<a id="get-certificate" href="studentProfile.jsp" style="display: none; color: #0bbfff; text-decoration: none;"><b>Certificate !</b></a>
							<div class="progress-container">
							    <div class="progress-barr" id="progressBar"></div>
							</div> 
						</div>
						<div class="progress-text" id="progressText"></div> 
					</div>
				</div>
        		<div style="display: flex; justify-content: center;">
        		<fieldset> 
				    <div class="quiz-main">
				         <div class="quiz-topics">
				         	<br><h3><%= technology %> Quiz Topics :</h3>
				         	<%
							    SessionFactory factory = new Configuration().configure().buildSessionFactory();
							    Session studentSession = factory.openSession(); 
							            
							    try { 
							        Query<String> query = studentSession.createQuery("SELECT DISTINCT topic FROM Quiz WHERE technology = :technology", String.class);
							        query.setParameter("technology", technology);
							        List<String> topics = query.getResultList();
							    
							        for (String topic : topics) {
							%>
							            <div style="display: flex; width: auto; gap: 20px; align-items: center;">
							            <div class="topic-name" onclick="setTopic('<%= topic %>')"><%= topic %></div>
							            <%
								            try {
									            Query<QuizProgress> query1 = studentSession.createQuery("FROM QuizProgress WHERE studentName = :studentName AND technology = :technology AND topic = :topic", QuizProgress.class);
										        query1.setParameter("studentName", name);
										        query1.setParameter("technology", technology);
										        query1.setParameter("topic", topic);
										        QuizProgress existingProgress = query1.uniqueResult();
										
										        if (existingProgress == null) {
									    %>
									            	<div style="width: 25px;"></div>
									    <%   
											    } 
										        else {
										%>
											        <img alt="completed" src="./media/accept.png" width="25px" height="25px" style="padding-bottom: 20px;">
										<% 
										        }  
										    } 
						            		catch (Exception e) {
										        e.printStackTrace(); 
										    }
										%> 
							            </div> 
							<% 
							        }  
							%>
				         </div>
				         <div class="quiz-questions">
						    <%  
						            String topic = request.getParameter("topic");
						    		String selectedTopic ;
						    		if(topic == null) {
						    			selectedTopic = topics.get(0);	
						    		}
						    		else {
						    			selectedTopic = topic;
						    		}  
						    		int totalQuestions = QuizDao.totalQuestions(technology, selectedTopic); 
						    		
						            Query<Quiz> query2 = studentSession.createQuery("FROM Quiz WHERE technology = :technology AND topic = :topic", Quiz.class);
						            query2.setParameter("technology", technology);
						            query2.setParameter("topic", selectedTopic);
						            List<Quiz> quizzList = query2.getResultList();
						 			
						    %>
						    		<h2 id="selected-topic">Topic : <%= selectedTopic %></h2><br>
						    <%
						            
						            for (int i = 0; i < quizzList.size(); i++) { 
						                Quiz quiz = quizzList.get(i);
						    %>
						                <span>Question <%= i+1 %> :</span> 
						                <div class="question">
						                    <b><%= quiz.getQuestion() %></b>
						                    <br><br>
						                    <div class="quiz-option" onclick="selectOption('correct-answer<%= i %>', 'explanation<%= i %>', 'q<%= i %>-option-a', this)">
						                        <input type="radio" id="q<%= i %>-option-a" name="q<%= i %>" value="<%= quiz.getOption1() %>"> 
						                        <label for="q<%= i %>-option-a">A) <%= quiz.getOption1() %></label>
						                    </div>
						                    <div class="quiz-option" onclick="selectOption('correct-answer<%= i %>', 'explanation<%= i %>', 'q<%= i %>-option-b', this)">
						                        <input type="radio" id="q<%= i %>-option-b" name="q<%= i %>" value="<%= quiz.getOption2() %>"> 
						                        <label for="q<%= i %>-option-b">B) <%= quiz.getOption2() %></label>
						                    </div>
						                    <div class="quiz-option" onclick="selectOption('correct-answer<%= i %>', 'explanation<%= i %>', 'q<%= i %>-option-c', this)">
						                        <input type="radio" id="q<%= i %>-option-c" name="q<%= i %>" value="<%= quiz.getOption3() %>"> 
						                        <label for="q<%= i %>-option-c">C) <%= quiz.getOption3() %></label>
						                    </div>
						                    <div class="quiz-option" onclick="selectOption('correct-answer<%= i %>','explanation<%= i %>', 'q<%= i %>-option-d', this)">
						                        <input type="radio" id="q<%= i %>-option-d" name="q<%= i %>" value="<%= quiz.getOption4() %>"> 
						                        <label for="q<%= i %>-option-d">D) <%= quiz.getOption4() %></label>
						                    </div>
						                </div>
						                <div class="Answer">
						                    <button id="correct-answer<%= i %>" onclick="setExplanation('correct-answer<%= i %>','explanation<%= i %>', getSelectedOption('q<%= i %>'),'<%= quiz.getCorrectOption() %>', '<%= quiz.getExplanation() %>', <%= i %>)">Check Answer</button>
						                    <div class="explanation" id="explanation<%= i %>"></div>
						                </div>
						    <% 
						            } 
						    %>			
						    			<hr>
						    			<form action="SubmitQuizProgress" method="post" style="display: flex; gap: 20px; align-items: center;" id="Submit-Quiz">
						    				<input type="hidden" name="studentName" id="video-resource" value="<%= name %>">
						    				<input type="hidden" name="technology" value="<%= technology %>">
						    				<input type="hidden" name="topic" value="<%= selectedTopic %>">
						    				<div class="register-container"> 
									    		<button type="button" class="register" id="signUpButton" onclick="registerClicked('<%= totalQuestions %>')" style="background-color: #0bbfff;">Submit Quiz</button>
									    		<div class="progress-bar hidden" id="proBar" style="margin: 10px 50px;"></div>
									    	</div> 
						    				<b id="note"></b>
						    			</form>
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
						</div>
				    </div> 
				</fieldset> 
		        </div> 
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
        
        <form id="topicForm" action="Quizes.jsp">
        	<input type="hidden" name="totalQuestions" value="">
        	<input type="hidden" name="submitButton" value="<%= technology %>">
		    <input type="hidden" id="topicInput" name="topic" value="">  
		</form>
		
		<form id="generate-certificate" action="GenerateCertificate" method="post">
        	<input type="hidden" name="name" value="<%= name %>">
        	<input type="hidden" name="type" value="Quiz">
        	<input type="hidden" name="technology" value="<%= technology %>"> 
        </form>
        
        <script type="text/javascript">
        	function setTopic(topic) { 
        		document.getElementById('topicInput').value = topic; 
                document.getElementById('topicForm').submit();
        	}
        	
        	function getSelectedOption(name) {
        	    var options = document.getElementsByName(name); 
        	    for (var i = 0; i < options.length; i++) {
        	        if (options[i].checked) { 
        	            return options[i].value;
        	        }
        	    }
        	    return null; 
        	}
        	
        	let count = 0; 
        	const answeredQuestions = {};

        	function setExplanation(result, explanationID, selectedOption, correctOption, explanation, questionIndex) {
        	    const explanationId = document.getElementById(explanationID);
        	    const resultButton = document.getElementById(result);

        	    if (selectedOption === null) {
        	        explanationId.innerHTML = "<span style='color: red'>Please select one option!</span>";
        	    } 
        	    else if (selectedOption === correctOption) {
        	        resultButton.innerHTML = "Correct Answer";
        	        resultButton.style.backgroundColor = "#33cc33";
        	        explanationId.innerHTML = "";
        	        explanationId.innerHTML = "<b>Explanation:</b> " + explanation; 
        	        
        	        if (!answeredQuestions[questionIndex]) { 
        	            count++; 
        	            answeredQuestions[questionIndex] = true;
        	        }
        	    } 
        	    else {
        	        resultButton.innerHTML = "Wrong Answer";
        	        resultButton.style.backgroundColor = "red";
        	        explanationId.innerHTML = "";
        	        
        	        if (answeredQuestions[questionIndex]) {
        	            count--; 
        	            answeredQuestions[questionIndex] = false;
        	        }
        	    } 
        	    console.log("Total correct answers:", count);
        	}
        </script>
        
        <script>
	        function selectOption(result, explanationID, optionId, clickedOption) { 
	        	const resultButton = document.getElementById(result);
	        	
	            clickedOption.parentElement.querySelectorAll('.quiz-option').forEach(option => {
	                option.classList.remove('selected');
	            }); 
	            clickedOption.classList.add('selected'); 
	            document.getElementById(optionId).checked = true;
	            resultButton.innerHTML = "Check Answer";
    	        resultButton.style.backgroundColor = "#ffa200";
    	        document.getElementById(explanationID).innerHTML = "";
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
	        function registerClicked(totalQuestions) { 
	        	if(totalQuestions == count) {
	        		document.getElementById("note").innerHTML = "";
	        		document.getElementById("signUpButton").style.display = "none"; 
		            document.getElementById("proBar").classList.remove("hidden");
		            setTimeout(function() {
		            	document.getElementById("Submit-Quiz").submit(); 
		            }, 500);
	        	}
	        	else {
	        		document.getElementById("note").innerHTML = "<b style='color: red'>Note : Attempt all the questions correctly to submit quiz !</b>";
	        	}
	        }
        </script>
        
        <%
        	int totalChallenges = QuizDao.totalTopics(technology);
        	int totalSubmitedChllenges = QuizDao.totalSubmittedTopics(technology, name);
        %>
        
        <script type="text/javascript">
		    if (<%= totalSubmitedChllenges %> === <%= totalChallenges %>  && <%= totalSubmitedChllenges %> != 0 && <%= totalChallenges %> != 0) {
		        Swal.fire({
		            title: "Congrats!",
		            text: "Progress Completed, Collect your Certificate!",
		            icon: "success",
		            showConfirmButton: false,
		            timer: 2500
		        });
		        console.log("certificate adding");
		        const name = "<%= name %>";
		        const type = "Quiz";
		        const technology = "<%= technology %>";
 
		        const uniqueKey = name+type+technology;

		        //localStorage.removeItem(uniqueKey);
		        if (!localStorage.getItem(uniqueKey)) { 
		            localStorage.setItem(uniqueKey, 'true'); 
		            document.getElementById('generate-certificate').submit();
		            console.log("certificate added");
		        }
		    }
		    else if (<%= totalChallenges %> == 0) {
		    	Swal.fire({
		            title: "Oops Sorry!",
		            text: "There is nothing right Now!",
		            icon: "info",
		            showConfirmButton: false,
		            timer: 2500
		        });
		    }
		</script>
         
        <script type="text/javascript">
		    const progressBar = document.getElementById('progressBar');
		    const progressText = document.getElementById('progressText');
		     
		    let width = 0;
		    const interval = setInterval(() => {
		        if (width == 100) {
		        	const completed = document.getElementById('completed');
		        	const getcertificate = document.getElementById('get-certificate');
		        	
		        	completed.innerText = "Completed, collect your ";
		        	getcertificate.style.display = 'inline-block';
		        	clearInterval(interval);
		        } 
		        else {
		        	if(<%=totalSubmitedChllenges %> == 0 && <%=totalChallenges %> == 0) {
		        		progressBar.style.width = 0 + '%'; 
			            progressText.innerText = 0 + '%';
		        	}
		        	else {
		        		 width = (<%=totalSubmitedChllenges %>/<%=totalChallenges %>) * 100;
				         progressBar.style.width = width + '%'; 
				         progressText.innerText = width.toFixed(0) + '%';
		        	} 
		        }
		    }, 50);
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