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
		
		.about {
			display: flex;
			flex-direction: column;
			flex: 1;
			width: 100%;
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
		
		.roadmap-main fieldset {
			letter-spacing: 1px;
			margin: 30px 50px;
			background-color: #fff;
			font-weight: bold;
			border: solid 4px #00bfff;
			border-radius: 20px;
			height: auto;
		}
		
		legend {
			background-color: #ffa200;
			border-radius: 10px;
			padding: 15px;
			font-size: 13px;
		}
		
		.coding-dashboard {
			display: flex;
			justify-content: center;
			align-items: center;
		}
		
		.coding-dashboard img{ 
            margin-left: 30px;
			width: 500px;
			height: 500px;
			animation: zoomInOut 0.5s infinite alternate;
		}
		 
		.coding-dashboard button {
			color: #fff;
		    cursor: pointer;  
		    letter-spacing: 1px;
		    background-color: #00334d;
		    border: none;
		    padding: 15px 15px;
		    margin: 10px;  
		    border-radius: 10px;
		    font-size: 12px;
		    width: 230px; 
		    transition: transform 0.3s ease;
		}
		
		.coding-dashboard button:hover {
			background-color: #0bbfff;
			transform: scale(1.1);
		}
		
		.coding-topics {  
			display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            margin: 20px;
            height: auto; 
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
                <a href="studentHome.jsp" style="margin-top: 10px; color: #fff">Technology Roadmaps</a>
                <a href="videoLecture.jsp" style="margin-top: 10px; color: #fff">Video Lectures</a>
                <a href="codingInhancement.jsp" style="border-bottom: 2px solid #ffa200; margin-top: 10px; padding-bottom: 10px;">Coding Enhancement</a>
                <a href="technicalQuiz.jsp" style="margin-top: 10px; color: #fff">Technical Quiz</a>
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
        	<span style="color: white"> Coding Enhancement</span>
        </div>
        
        <div class="roadmap-main">
        	<div class="roadmap-heading">
        		<h2>Enhance Your Coding Skills !</h2>
        		<p>At TechCraft Learning Hub, we believe in empowering learners to enhance their coding skills through structured programs that guide them on their coding journey.</p> 
        		<fieldset>
		            <legend style="color: white; font-weight: bold;">Prepare by topics</legend>
		            <div class="coding-dashboard">
				        <img src="./media/software-engineer.svg" alt="Illustration of a student">  
				        <div class="coding-topics">
				        	 <div>
					        	 <div style="display: flex; flex-direction: row;">
						            <form action="codingQuestions.jsp"> 
									    <button type="submit" name="submitButton" value="Coding Basics">Coding Basics</button>
									</form> 
									<form action="codingQuestions.jsp"> 
									    <button type="submit" name="submitButton" value="Design Pattern">Design Pattern</button>
									</form> 
									<form action="codingQuestions.jsp"> 
									    <button type="submit" name="submitButton" value="Arrays">Arrays</button>
									</form>  
						        </div> 
						        <hr>
					        </div>
					        <div> 
					            <div style="display: flex; flex-direction: row;">
						            <form action="codingQuestions.jsp"> 
									    <button type="submit" name="submitButton" value="String">String</button>
									</form> 
									<form action="codingQuestions.jsp"> 
									    <button type="submit" name="submitButton" value="Recursion">Recursion</button>
									</form> 
									<form action="codingQuestions.jsp"> 
									    <button type="submit" name="submitButton" value="Object Oriented Programming">Object Oriented Programming</button>
									</form>  
						        </div>
					            <hr>
					        </div>
					        <div> 
					            <div style="display: flex; flex-direction: row;">
						            <form action="codingQuestions.jsp"> 
									    <button type="submit" name="submitButton" value="Data Structure">Data Structure</button>
									</form> 
									<form action="codingQuestions.jsp"> 
									    <button type="submit" name="submitButton" value="Dynamic Programming">Dynamic Programming</button>
									</form> 
									<form action="codingQuestions.jsp"> 
									    <button type="submit" name="submitButton" value="Exception Handling">Exception Handling</button>
									</form>  
						        </div>
					            <hr>
					        </div>
					        <div> 
					            <div style="display: flex; flex-direction: row;">
						            <form action="codingQuestions.jsp"> 
									    <button type="submit" name="submitButton" value="Regex">Regex</button>
									</form> 
									<form action="codingQuestions.jsp"> 
									    <button type="submit" name="submitButton" value="Multithreading">Multithreading</button>
									</form> 
									<form action="codingQuestions.jsp"> 
									    <button type="submit" name="submitButton" value="Backtracking">Backtracking</button>
									</form>  
						        </div>
					            <hr>
					        </div>
					        <div>  
					            <div style="display: flex; flex-direction: row;">
						            <form action="codingQuestions.jsp"> 
									    <button type="submit" name="submitButton" value="Brute Force">Brute Force</button>
									</form> 
									<form action="codingQuestions.jsp"> 
									    <button type="submit" name="submitButton" value="Problem solving">Problem solving</button>
									</form>  
						        </div> 
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