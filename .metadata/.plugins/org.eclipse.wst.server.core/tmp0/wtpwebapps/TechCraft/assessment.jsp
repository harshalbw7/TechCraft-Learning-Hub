<%@page import="techcraft.dao.CodingDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>TechCraft Learning Hub</title>
        <link rel="stylesheet" href="index.css" type="text/css"> 
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
		}
		
		.roadmap-main fieldset {
	        letter-spacing: 1px;
	        margin: 30px 50px;
	        background-color: #fff;
	        font-weight: bold;
	        border: solid 4px #00bfff;
	        border-radius: 20px;
	        height: auto; 
	        padding: 0px 50px;
	    }
	    
	    legend {
			background-color: #ffa200;
			border-radius: 10px;
			padding: 15px;
			font-size: 13px;
		}
		
		.assessment-module {
			display: flex;
			margin: 20px 0px; 
			align-items: center;
			justify-content: space-between;
		}
		
		.module {
			display: flex;
			gap: 20px;
			width: 500px;  
			border: solid 4px #000;
			border-radius: 20px;
			padding: 20px 30px; 
			margin-top: 0px;
			align-items: center;
			justify-content: center; 
			transition: transform 0.3s ease;
		}
		
		.module:hover {
			transform: scale(1.02);
		}
		 
		.module-heading {
			color: #002233;
			font-size: 20px;
			font-weight: bold;  
		}
		
		.your-progress {
			color: #002233;
			font-size: 13px;
			margin: 20px;
		}
		
		.progress {}
		 
	    .progress-container { 
	        width: 280px;
	        height: 30px;
	        background-color: #002233;
	        border-radius: 5px; 
	        margin: 10px; 
	        align-items: center;
			justify-content: center; 
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
	    
	    .assessment-module button {
			color: #fff;
		    cursor: pointer;  
		    letter-spacing: 1px;
		    background-color: #00334d;
		    border: none;
		    padding: 15px 15px;
		    margin: 10px;  
		    border-radius: 10px;
		    font-weight: bold;
		    font-size: 12px;
		    width: 230px; 
		    transition: transform 0.3s ease;
		}
		
		.assessment-module button:hover {
			background-color: #0bbfff;
			transform: scale(1.1);
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
        
        <div class="dashboard-heading">
        	<span style="font-size: 15px; color: #888888">Dashboard:</span>
        	<span style="color: white"> Technical Assessments</span>
        </div>
        
        <div class="roadmap-main">
        	<div class="roadmap-heading"> 
        		<h2>Technical Assessments</h2> 
        		<p>Technical assessment of TechCraft Learning Hub is a platform to be a comprehensive resource with a wealth of learning opportunities. The interactive quizzes and coding challenges were particularly beneficial, allowing for hands-on learning.</p> 
        		<fieldset>
		            <legend style="color: white; font-weight: bold;">Technical Assessments</legend> 
		        	<div class="assessment-module">
		        		<div class="module"> 
		        			<img src="./media/software-engineer.svg" alt="Illustration of a student" style="width: 200px">
		        			<div> 
			        			<span class="module-heading">Coding Assessment</span><br><br>
				        		<div class="progress-text" id="progressText">40 %</div>
				        		<div style="display: flex;">
									<div class="progress"> 
										<div class="progress-container">
											<div class="progress-barr" id="progressBar"></div>
										</div> 
									</div> 
								</div><br>
								<span class="your-progress" id="completedCodingAssessment" style="color: #0bbfff;">Completed Assessment : 7</span><br> 
								<span class="your-progress" id="pendingCodingAssessment">Pending Assessment : 13</span><br><br>
								<form action="assessmentDashboard.jsp"> 
									<button type="submit" name="module" value="Coding">Conclude Assessments</button>
								</form>
							</div>
				        </div>
		        		<div style="height: 350px; width: 0px; border: solid 4px #002233; margin: 20px;"></div> 
		        		<div class="module">
		        			<img src="./media/quiz.png" alt="Illustration of a student" style="width: 200px; margin-bottom: 20px; margin-top: 10px">
			        		<div>
		        				<span class="module-heading">Quiz Assessment</span><br><br>
				        		<div class="progress-text" id="progressTextt">40 %</div>
				        		<div style="display: flex;">
									<div class="progress"> 
										<div class="progress-container">
											<div class="progress-barr" id="progressBarr"></div>
										</div> 
									</div> 
								</div><br>
								<span class="your-progress" id="completedQuizAssessment" style="color: #0bbfff;">Completed Assessment : 9</span><br> 
								<span class="your-progress" id="pendingQuizAssessment">Pending Assessment : 11</span><br><br>
								<form action="assessmentDashboard.jsp"> 
									<button type="submit" name="module" value="Quiz">Conclude Assessments</button>
								</form>
							</div>
		        		</div>
		        	</div>
		        </fieldset> 
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
        </script>
        
        <%
        	int totalChallenges = CodingDao.totalAssessment("Coding");
        	int totalSubmitedChllenges = CodingDao.totalSubmitedAssessment(name, "Coding");
        %>
          
        <script type="text/javascript">
		    const progressBar = document.getElementById('progressBar');
		    const progressText = document.getElementById('progressText');
		    
		    var pendingChallenges = <%=totalChallenges %> - <%=totalSubmitedChllenges %>;
		    document.getElementById('pendingCodingAssessment').innerHTML = "Pending Assessment : "+pendingChallenges;
		    document.getElementById('completedCodingAssessment').innerHTML = "Completed Assessment : "+<%=totalSubmitedChllenges %>;
		    
		    console.log("Total coding assignments = "+<%=totalChallenges %>);
		    console.log("Submited coding assignments = "+<%=totalSubmitedChllenges %>);
		     
		    let width = 0;
		    const interval = setInterval(() => {
		        if (width == 100) { 
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
		
		<%
			int totalChallengess = CodingDao.totalAssessment("Quiz");
    		int totalSubmitedChllengess = CodingDao.totalSubmitedAssessment(name, "Quiz");
        %>
          
        <script type="text/javascript">
		    const progressBarr = document.getElementById('progressBarr');
		    const progressTextt = document.getElementById('progressTextt');
		    
		    var pendingChallengess = <%=totalChallengess %> - <%=totalSubmitedChllengess %>;
		    document.getElementById('pendingQuizAssessment').innerHTML = "Pending Assessment : "+pendingChallengess;
		    document.getElementById('completedQuizAssessment').innerHTML = "Completed Assessment : "+<%=totalSubmitedChllengess %>;
		    
		    console.log("Total Quiz assignments = "+<%=totalChallengess %>);
		    console.log("Submited Quiz assignments = "+<%=totalSubmitedChllengess %>);
		    
		    let widthh = 0;
		    const intervall = setInterval(() => {
		        if (widthh == 100) { 
		        	clearInterval(intervall);
		        } 
		        else {
		        	if(<%=totalSubmitedChllengess %> == 0 && <%=totalChallengess %> == 0) {
		        		progressBarr.style.width = 0 + '%'; 
			            progressTextt.innerText = 0 + '%';
		        	}
		        	else {
		        		 widthh = (<%=totalSubmitedChllengess %>/<%=totalChallengess %>) * 100;
				         progressBarr.style.width = widthh + '%'; 
				         progressTextt.innerText = widthh.toFixed(0) + '%';
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
        
		<% } %>
    </body>
    </html>