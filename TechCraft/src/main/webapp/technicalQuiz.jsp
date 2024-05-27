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
		
		.roadmap-main h2 {
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
				
		.roadmap-main p {
			letter-spacing: 1px;
			margin: 0px 100px;
		}
		
		.roadmap-main fieldset {
			display: flex;
			align-items: center;
			letter-spacing: 1px;
			margin: 30px 50px;
			background-color: #fff;
			font-weight: bold;
			border: solid 4px #00bfff;
			border-radius: 20px;
			height: auto;
			width: 500px;
			padding: 20px 40px;
			margin-bottom: 50px;
			justify-content: center;
		}
		
		legend {
			background-color: #ffa200;
			border-radius: 10px;
			padding: 15px;
			font-size: 13px;
		}
		
		.roadmap-main img {
			width: 300px;
			height: 250px; 
			margin: 20px;
		}
		
		.quiz-technologies {
			justify-content: center;
		}
		
		.quiz-technologies button {
			color: #fff;
		    cursor: pointer;  
		    letter-spacing: 1px;
		    background-color: #00334d;
		    border: none;
		    padding: 15px 15px;
		    margin: 10px;  
		    border-radius: 10px;
		    font-size: 12px;
		    width: 200px; 
		    transition: transform 0.3s ease;
		}
		
		.quiz-technologies button:hover {
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
        	<div class="roadmap-heading">
        		<h2>Unlock Knowledge, Quiz Your Way to Success!</h2>
        		<p>Embark on an Enlightening Knowledge Quest with TechCraft Learning Hub's Expertly Crafted Guided Quizzes, Molding Your Personalized Learning journey.</p> 
        		<br>
        		<div style="display: flex; justify-content: center;">
        		<fieldset>
				    <legend style="color: white; font-weight: bold;">FrontEnd Technologies</legend> 
				    <div class="quiz-technologies">
				        <div style="display: flex; flex-direction: row;">
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="HTML CSS">HTML CSS</button>
				            </form> 
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="Angular">Angular</button>
				            </form>   
				        </div> 
				        <hr> 
				        <div style="display: flex; flex-direction: row;">
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="React JS">React JS</button>
				            </form> 
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="JQuery">JQuery</button>
				            </form>  
				        </div>
				        <hr> 
				        <div style="display: flex; flex-direction: row;">
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="TypeScript">TypeScript</button>
				            </form>   
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="Vue JS">Vue JS</button>
				            </form>   
				        </div>  
				    </div> 
				</fieldset>
				<fieldset>
				    <legend style="color: white; font-weight: bold;">BackEnd Technologies</legend> 
				    <div class="quiz-technologies">
				        <div style="display: flex; flex-direction: row;">
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="Java">Java</button>
				            </form> 
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="Python">Python</button>
				            </form>   
				        </div> 
				        <hr> 
				        <div style="display: flex; flex-direction: row;">
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="JavaScript">JavaScript</button>
				            </form> 
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="C++">C++</button>
				            </form>  
				        </div> 
				        <hr>
				        <div style="display: flex; flex-direction: row;">
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="Kotlin">Kotlin</button>
				            </form>   
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="Node JS">Node JS</button>
				            </form>   
				        </div>
				    </div> 
				</fieldset>
				</div>
				<div style="display: flex; justify-content: center;">
				<fieldset>
				    <legend style="color: white; font-weight: bold;">Database Technologies</legend> 
				    <div class="quiz-technologies">
				        <div style="display: flex; flex-direction: row;">
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="MySQL">MySQL</button>
				            </form> 
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="PostgreSQL">PostgreSQL</button>
				            </form>   
				        </div> 
				        <hr> 
				        <div style="display: flex; flex-direction: row;">
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="MongoDB">MongoDB</button>
				            </form> 
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="Microsoft SQL Server">Microsoft SQL Server</button>
				            </form>  
				        </div>
				        <hr> 
				        <div style="display: flex; flex-direction: row;">
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="Oracle Database">Oracle Database</button>
				            </form>   
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="Firebase">Firebase</button>
				            </form>   
				        </div> 
				    </div> 
				</fieldset>
				<fieldset>
				    <legend style="color: white; font-weight: bold;">DevOps And Full stack</legend> 
				    <div class="quiz-technologies">
				        <div style="display: flex; flex-direction: row;">
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="DevOps">DevOps</button>
				            </form> 
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="Android">Android</button>
				            </form>   
				        </div> 
				        <hr> 
				        <div style="display: flex; flex-direction: row;">
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="Docker">Docker</button>
				            </form> 
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="Kubernetes">Kubernetes</button>
				            </form>  
				        </div> 
				        <hr>
				        <div style="display: flex; flex-direction: row;">
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="AWS">AWS</button>
				            </form>   
				            <form action="Quizes.jsp"> 
				                <button type="submit" name="submitButton" value="Hibernate">Hibernate</button>
				            </form>   
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