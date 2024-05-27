<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.Session, org.hibernate.Transaction, org.hibernate.cfg.Configuration, org.hibernate.query.Query, techcraft.model.QuizAssessmentChallenge, java.util.List" %>
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
    		
    	body {
    		height: 100%;
    	}
    	
    	.dashboard-heading {
			margin: 10px 20px;
			letter-spacing: 1px;
		}
		
		.dashboard-heading span {
			font-weight: bold;
			font-size: 25px;
			text-align: center;
			letter-spacing: 1px;
		}
		
			.counting {
                font-size: 40px;
                margin-top: 0px;
                font-weight: bold;
                letter-spacing: 2px;
                color: #002233;
            }

            .timeRemaining {
                color: red;
                animation: zoomInOut 0.5s infinite alternate;
            }
    	
    	.roadmap-main {
			width: auto;
		    min-height: 580px;
		    padding: 0px 30px;
		    border-radius: 20px;
		    background-size: cover; 
		    border: 2px solid #000; 
		    background-image: url("./media/techback.jpg"); 
		    text-align: center;
		    letter-spacing: 1px;
		} 
		
		@keyframes zoomInOut {
		    0% {
		        transform: scale(1);
		    }
		    100% {
		        transform: scale(1.05);
		    }
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
	    
	    .question {   
			text-align: left;
			padding: 20px 0px;
			padding-bottom: 0px;
		}
		
		.quiz-questions {
			width: auto; 
			border: solid 2px #000;
			border-radius: 10px;
			background-color: white;
			margin: 10px;
			text-align: left;
			padding: 20px 40px;
			font-size: 13px;
			padding-bottom: 40px;
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
		
		button {
			color: #fff;
	        cursor: pointer;
	        font-weight: bold; 
			border-radius: 10px;
	        background-color: #ffa200;
	        letter-spacing: 1px; 
	        padding: 15px 40px;
	        margin: 10px; 
	        font-size: 15px;
	        border: none;
	        transition: transform 0.3s ease;
		}
		
		button:hover {
			color: #fff;
			transform: scale(1.1);   
		}
		
		.submit-assessment-button {
			background-color: #00334d;
			margin: 20px; 
			margin-bottom: 40px; 
			padding: 20px 40px;
		}
		.submit-assessment-button:hover {
			background-color: #0bbfff;
		}
		
		.submit-button-style {
			pointer-events: none; background-color: #0bbfff;
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
        	String module = request.getParameter("module");
        	String topic = request.getParameter("topic");	        
        	String date = request.getParameter("date");
        	String time = request.getParameter("time"); 
        	String instructor = request.getParameter("instructor");
        	
        	System.out.println("Module: " + module);
        	System.out.println("Topic: " + topic);
        	System.out.println("Date: " + date);
        	System.out.println("Time: " + time); 
        %>
        
        <header style="justify-content:initial; letter-spacing: 1px; display: flex;">
            <img src="./media/code-simple.png" width=30px height=30px style="margin-left: 20px">
            <h1>TechCraft</h1>
            <div class="vl"></div> 
            <div class="dashboard-heading"> 
        	<span style="color: white"> <%= module %> Assessments</span>
        	<img src="./media/user.png" width=20px height=17px style="margin-right: 10px; margin-left: 630px"> 
        	<b style="color: #ffa200; font-size: 18px; "><%= name %></b>
        </div> 
        </header>
        <div style="width: 100%; height: 81px; background-color: #002233"></div>
         
        <div class="roadmap-main">
        	<div class="roadmap-heading"><br>
        		<div style="display: flex; background-color: white; padding: 0px 30px; align-items: center; position: fixed; z-index: 1; width: 93%;">    
	        		<div class="dashboard-heading" style="margin: 10px 10px;"> 
		        		<span style="font-size: 15px; color: #888888">topic:</span>
				        <span style="color: black; font-size: 25px;"><%= topic %></span>
				    </div>
				    <span style="flex: 1"></span>
				    <div id="timer-div" style="display:flex; gap: 10px; text-align: center; align-items: center; font-size: 15px; margin-top: 0px; font-weight: bold; letter-spacing: 1px; color: #002233;"> 
	                    <input type="hidden" id="time" value="<%= time %>">
	                    <b > Time left : </b>
	                    <span class="counting" id="timer" style="font-size: 30px;"></span>
	                    <audio id="myAudio">
						  <source src="./media/warning.mp3" type="audio/mpeg"> 
						</audio>
            		</div> 
            	</div> 
            	<div style="width: 100%; height: 50px; background-color: #fff"></div>
        		<fieldset>
		             <div class="quiz-questions">
						    <%  
							    SessionFactory factory = new Configuration().configure().buildSessionFactory();
							    Session studentSession = factory.openSession(); 
							            
							    try { 
							    	 Query<QuizAssessmentChallenge> query = studentSession.createQuery("FROM QuizAssessmentChallenge where topic = :topic AND assignedDate =:assignedDate", QuizAssessmentChallenge.class);
									    query.setParameter("topic", topic);
									    query.setParameter("assignedDate", date);
									    List<QuizAssessmentChallenge> challenges = query.getResultList();
									 	
									    int totalQuestions = challenges.size();
									    
									    for (int i = 0; i < challenges.size(); i++) {
									    	QuizAssessmentChallenge quiz = challenges.get(i);
						    %>
						                <br><br><br>
						                <span>Question <%= i+1 %> :</span> 
						                <div class="question">
						                    <b><%= quiz.getQuestion() %></b>
						                    <input type="hidden" name="question">
						                    <br><br>
						                    <div class="quiz-option" onclick="selectOption('<%= quiz.getCorrectOption() %>', '<%= quiz.getOption1() %>', 'q<%= i %>-option-a', '<%= i %>', this)">
						                        <input type="radio" id="q<%= i %>-option-a" name="q<%= i %>" value="<%= quiz.getOption1() %>"> 
						                        <label for="q<%= i %>-option-a">A) <%= quiz.getOption1() %></label>
						                    </div>
						                    <div class="quiz-option" onclick="selectOption('<%= quiz.getCorrectOption() %>', '<%= quiz.getOption2() %>','q<%= i %>-option-b', '<%= i %>', this)">
						                        <input type="radio" id="q<%= i %>-option-b" name="q<%= i %>" value="<%= quiz.getOption2() %>"> 
						                        <label for="q<%= i %>-option-b">B) <%= quiz.getOption2() %></label>
						                    </div>
						                    <div class="quiz-option" onclick="selectOption('<%= quiz.getCorrectOption() %>', '<%= quiz.getOption3() %>','q<%= i %>-option-c', '<%= i %>', this)">
						                        <input type="radio" id="q<%= i %>-option-c" name="q<%= i %>" value="<%= quiz.getOption3() %>"> 
						                        <label for="q<%= i %>-option-c">C) <%= quiz.getOption3() %></label>
						                    </div>
						                    <div class="quiz-option" onclick="selectOption('<%= quiz.getCorrectOption() %>', '<%= quiz.getOption4() %>','q<%= i %>-option-d', '<%= i %>', this)">
						                        <input type="radio" id="q<%= i %>-option-d" name="q<%= i %>" value="<%= quiz.getOption4() %>"> 
						                        <label for="q<%= i %>-option-d">D) <%= quiz.getOption4() %></label>
						                    </div>
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
		        </fieldset> 
		        <div class="submit-assessment-div">
		        	<form id="sumbit-challenge"  action="SubmitAssessment" method="post"> 
		                <input type="hidden" name="name" value="<%= name %>">
		                <input type="hidden" name="module" value="<%= module %>">
		                <input type="hidden" name="topic" id="topic" value="<%= topic %>">
    					<input type="hidden" name="date" id="date" value="<%= date %>">
    					<input type="hidden" name="instructor" value="<%= instructor %>">
    					<input type="hidden" name="totalQuestions" id="totalQuestion">
    					<input type="hidden" name="correctAnswers" id="correctAnswers">
		                <button class="submit-assessment-button" type="button" onclick="openModal('confirmation')">Submit Assessment</button>
		            	<span>Note : Attempt all the Questions before submitting the assessment !</span>
		            </form>  
		        </div> 
        	</div>
        </div>
        
        <div id="confirmation" class="modal-container">
            <!-- Modal content -->
            <div class="modal-content" style="max-width: 350px;">
                <form id="logoutForm" action="StudentLogout">
                    <p style="color: black">Are you sure, you want Submit Assessment ?</p>
                    <div style="display: flex; gap: 10px; align-item: center">
                        <input type="button" class="login" style="background-color: #ffa200; border: none" value="Yes"
                            onclick="submitAssessment()">
                        <input type="button" class="login" style="background-color: #d2d2e0; border: none" value="Cancel"
                            onclick="closeModal('confirmation')">
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
        
        <button onclick="scrollToTop()" id="scrollBtn" title="Go to top"><img class="go-top" alt="" src="./media/play.png"></button>
        
        <script>
        	let count = 0; 
    		const answeredQuestions = {};
    		
    		var inputs = document.querySelectorAll('input[name="question"]'); 
    		console.log("Number of Challenges:", inputs.length);
    		let totalQuestions = inputs.length;
    		document.getElementById("totalQuestion").value = totalQuestions;
    		
	        function selectOption(correctAnswer, clickedOption, optionId, questionIndex, instance) { 
	        	console.log("Correct Option = "+correctAnswer);
	        	console.log("clicked Option = "+clickedOption);
	        	instance.parentElement.querySelectorAll('.quiz-option').forEach(option => {
	                option.classList.remove('selected');
	            }); 
	        	instance.classList.add('selected'); 
	            document.getElementById(optionId).checked = true; 
	            
	            if(clickedOption === correctAnswer) {
	            	if (!answeredQuestions[questionIndex]) { 
        	            count++; 
        	            answeredQuestions[questionIndex] = true;
        	        } 
	            }
	            else {
            		if (answeredQuestions[questionIndex]) {
        	            count--; 
        	            answeredQuestions[questionIndex] = false;
        	        }
            	}
	            console.log("Total correct answers:", count);
	            document.getElementById("correctAnswers").value = count;
	        }
	    </script> 
        
        <script type="text/javascript">
        	function submitAssessment() {
        		localStorage.removeItem('endTime');
        		
        		closeModal("confirmation");
        		const Toast = Swal.mixin({
                    toast: true,
                    showConfirmButton: false,
                    timer: 2000,
                    timerProgressBar: true,
                    didOpen: (toast) => {
                        toast.onmouseenter = Swal.stopTimer;
                        toast.onmouseleave = Swal.resumeTimer;
                    } 
                });
                Toast.fire({
                    icon: "success",
                    title: "Submmiting Assessment ..."
                });
                setTimeout(function() {  
                	document.getElementById("sumbit-challenge").submit();
	            }, 2000);
			}
        </script>
        
        <script>
		    // Function to get or set the end time in local storage
		    function getSetEndTime(timeInSeconds) {
		        if (localStorage.getItem('endTime')) {
		            return parseInt(localStorage.getItem('endTime'));
		        } else {
		            var endTime = new Date().getTime() + (timeInSeconds * 1000);
		            localStorage.setItem('endTime', endTime.toString());
		            return endTime;
		        }
		    }
		
		    // Function to start the countdown timer
		    function startCountdown(timeInSeconds) { 
		    	
		        var endTime = getSetEndTime(timeInSeconds);
		        console.log("endTime ="+endTime);
		        var countdownInterval = setInterval(function () {
		            var currentTime = new Date().getTime();
		            var remainingTimeSeconds = Math.floor((endTime - currentTime) / 1000);
		            remainingTimeSeconds = Math.max(0, remainingTimeSeconds);
					
		         	// Assign remainingTimeSeconds to each input element
		            var inputs = document.querySelectorAll('input[name="time"]');
		            for (var i = 0; i < inputs.length; i++) {
		                inputs[i].value = remainingTimeSeconds / 60;
		            }
		            
		            var hours = Math.floor(remainingTimeSeconds / 3600);
		            var minutes = Math.floor((remainingTimeSeconds % 3600) / 60);
		            var seconds = remainingTimeSeconds % 60;
		
		            minutes = String(minutes).padStart(2, '0');
		            seconds = String(seconds).padStart(2, '0');
		
		            var countdownDisplay = minutes + ":" + seconds;
		            if (hours > 0) {
		                hours = String(hours).padStart(2, '0');
		                countdownDisplay = hours + ":" + countdownDisplay;
		            }
		
		            document.getElementById("timer").innerHTML = countdownDisplay;
		
		            if (remainingTimeSeconds <= 10) {
		                document.getElementById("timer").classList.add("timeRemaining");
		                document.getElementById("myAudio").play();
		            }
		
		            if (remainingTimeSeconds <= 0) {
		                clearInterval(countdownInterval);
		                localStorage.removeItem('endTime'); // Remove the end time from local storage
		                handleTimerExpiration(); // Handle timer expiration
		            }
		        }, 1000);
		    }
		
		    function handleTimerExpiration() {
		    	localStorage.removeItem('endTime');
		    	
		        const Toast = Swal.mixin({
		            toast: true,
		            showConfirmButton: false,
		            timer: 2000,
		            timerProgressBar: true,
		            didOpen: (toast) => {
		                toast.onmouseenter = Swal.stopTimer;
		                toast.onmouseleave = Swal.resumeTimer;
		            }
		        });
		        Toast.fire({
		            icon: "success",
		            title: "Submitting Assessment ..."
		        });
		        setTimeout(function() {
		            document.getElementById("sumbit-challenge").submit();
		        }, 2000);
		    }
		
		    // Start the countdown when the page loads
		    window.onload = function () {
		        const minutes = parseInt(document.getElementById("time").value);
		        console.log("Minutes ="+minutes);
		        var timeLimitSeconds = minutes * 60;
		        startCountdown(timeLimitSeconds);
		    };
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
		<footer>
            <p>&copy; 2024 TechCraft Learning Hub. @ Harshal Wandhare</p>
        </footer>
		<% } %>
    </body>
    </html>