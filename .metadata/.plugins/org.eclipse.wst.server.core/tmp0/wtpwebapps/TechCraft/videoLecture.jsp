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
		        transform: scale(1.05);
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
			padding: 20px; 
			margin-bottom: 50px;
		}
		
		.roadmap-main legend {
			background-color: #ffa200;
			border-radius: 10px;
			padding: 15px;
			font-size: 13px;
		} 
		
		.roadmap-main form { 
			border-radius: 10px;
			text-align: left;
			background-color: #002233;
			color: white;
			cursor: pointer;
			margin: 20px;
			transition: transform 0.3s ease;
		}
		
		.roadmap-main form:hover {
			background-color: #0bbfff;
			transform: scale(1.1);
		} 
		
		.roadmap-main img {
			border-radius: 5px;
			height: 150px;
			width: 270px;
			margin: 10px;
			border: solid 2px #fff;
			background-color: white;
		}
		
		.roadmap-main p {
			margin: 0px 20px;
			padding: 0px;
			margin-bottom: 10px;
		}
		
		.roadmap-main span {
			margin: 20px; 
			padding: 0px;
			font-weight: normal;
			font-size: 13px;
		}
		
    </style>
     
    <body>
    	
    	<% session.setAttribute("nextLectureClicked", "false"); %>
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
                <a href="videoLecture.jsp" style="border-bottom: 2px solid #ffa200; margin-top: 10px; padding-bottom: 10px;">Video Lectures</a>
                <a href="codingInhancement.jsp" style="margin-top: 10px; color: #fff">Coding Enhancement</a>
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
        	<span style="color: white">Video Lectures</span>
        </div>
        
        <div class="roadmap-main">
        	<div class="roadmap-heading">
        		<h2>Dive Into Video-Based Learning !</h2>
        		<p>At TechCraft Learning Hub, we believe in empowering learners with structured guidance that supports them through their video-based learning journey.</p> 
        		
		        <fieldset>
		            <legend style="color: white; font-weight: bold;">BackEnd Learning</legend> 
		            <div style="display: flex; flex-direction: row;">						            
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Java" src="./media/java.png">
						    <p>Java</p>
						    <span>Total 50 Videos</span><br><br>
						    <input type="hidden" name="technology" value="Java">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Spring Boot" src="./media/spring-boot.png">
						    <p>Spring Boot</p>
						    <span>Total 40 Videos</span><br><br>
						    <input type="hidden" name="technology" value="SpringBoot">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Hibernate" src="./media/hibernate.png">
						    <p>Hibernate</p>
						    <span>Total 35 Videos</span><br><br>
						    <input type="hidden" name="technology" value="Hibernate">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Python" src="./media/python.png">
						    <p>Python</p>
						    <span>Total 45 Videos</span><br><br>
						    <input type="hidden" name="technology" value="Python">
						</form>
					</div>
					<hr>
					<div style="display: flex; flex-direction: row;">						            
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Django" src="./media/django.png">
						    <p>Django</p>
						    <span>Total 30 Videos</span><br><br>
						    <input type="hidden" name="technology" value="Django">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick">
						    <img alt="Flask" src="./media/flask.png">
						    <p>Flask</p>
						    <span>Total 35 Videos</span><br><br>
						    <input type="hidden" name="technology" value="Flask">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Node.js" src="./media/nodejs.png">
						    <p>Node.js</p>
						    <span>Total 40 Videos</span><br><br>
						    <input type="hidden" name="technology" value="Node.js">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Express.js" src="./media/expressjs.png">
						    <p>Express.js</p>
						    <span>Total 30 Videos</span><br><br>
						    <input type="hidden" name="technology" value="Express.js">
						</form> 
					</div>
					<hr>
					<div style="display: flex; flex-direction: row;">						            
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Kotlin" src="./media/kotlin.png">
						    <p>Kotlin</p>
						    <span>Total 40 Videos</span><br><br>
						    <input type="hidden" name="technology" value="Kotlin">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="C++" src="./media/cpp.png">
						    <p>C++</p>
						    <span>Total 50 Videos</span><br><br>
						    <input type="hidden" name="technology" value="C++">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Data Structures and Algorithms" src="./media/dsa.png">
						    <p>Data Structures & Algorithms</p>
						    <span>Total 60 Videos</span><br><br>
						    <input type="hidden" name="technology" value="Data Structure & Algorithm">
						</form>
					</div>
		        </fieldset>
        		<fieldset>
				    <legend style="color: white; font-weight: bold;">FrontEnd Learning</legend>
				    <div style="display: flex; flex-direction: row;">
				        <form action="SetSessionValueServlet2" class="submitOnFormClick" method="post"> 
				            <img alt="" src="./media/html-css-js.png">
				            <p>HTML, CSS & JavaScript</p>
				            <span>Total 35 Videos</span><br><br>
				            <input type="hidden" name="technology" value="HTML CSS & JavaScript">
				        </form>
				        <form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
				            <img alt="React.js" src="./media/react.png">
				            <p>React.js</p>
				            <span>Total 50 Videos</span><br><br>
				            <input type="hidden" name="technology" value="React.js">
				        </form> 
				        <form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
				            <img alt="Bootstrap" src="./media/bootstrap.png">
				            <p>Bootstrap</p>
				            <span>Total 40 Videos</span><br><br>
				            <input type="hidden" name="technology" value="Bootstrap">
				        </form>
				        <form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
				            <img alt="jQuery" src="./media/jquery.png">
				            <p>jQuery</p>
				            <span>Total 35 Videos</span><br><br>
				            <input type="hidden" name="technology" value="jQuery">
				        </form>
				    </div>
				    <hr>
				    <div style="display: flex; flex-direction: row;">
				        <form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
				            <img alt="Vue.js" src="./media/vue.png">
				            <p>Vue.js</p>
				            <span>Total 40 Videos</span><br><br>
				            <input type="hidden" name="technology" value="vue.js">
				        </form>
				        <form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
				            <img alt="TypeScript" src="./media/typeScript.png">
				            <p>TypeScript</p>
				            <span>Total 30 Videos</span><br><br>
				            <input type="hidden" name="technology" value="Typescript">
				        </form>
				        <form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
				            <img alt="Angular" src="./media/angular.png">
				            <p>Angular</p>
				            <span>Total 45 Videos</span><br><br>
				            <input type="hidden" name="technology" value="Angular">
				        </form> 
				        <form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
				            <img alt="Flutter" src="./media/flutter.png">
				            <p>Flutter</p>
				            <span>Total 50 Videos</span><br><br>
				            <input type="hidden" name="technology" value="Flutter">
				        </form>
				    </div> 
				    <hr>
				    <div style="display: flex; flex-direction: row;">
				        <form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
				            <img alt="React Native" src="./media/reactNative.png">
				            <p>React Native</p>
				            <span>Total 55 Videos</span><br><br>
				            <input type="hidden" name="technology" value="React Native">
				        </form> 
				        <form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
				            <img alt="UX Design" src="./media/ux.png">
				            <p>UX Design</p>
				            <span>Total 35 Videos</span><br><br>
				            <input type="hidden" name="technology" value="UX Design">
				        </form> 
				    </div> 
				</fieldset>
		        <fieldset>
		            <legend style="color: white; font-weight: bold;">Databases Learning</legend> 
		            <div style="display: flex; flex-direction: row;">						            
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="MySQL" src="./media/mysql.png">
						    <p>MySQL</p>
						    <span>Total 50 Videos</span><br><br>
						    <input type="hidden" name="technology" value="mySQL">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="PostgreSQL" src="./media/Postgresql.png">
						    <p>PostgreSQL</p>
						    <span>Total 40 Videos</span><br><br>
						    <input type="hidden" name="technology" value="postgresql">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="MongoDB" src="./media/mongodb.png">
						    <p>MongoDB</p>
						    <span>Total 35 Videos</span><br><br>
						    <input type="hidden" name="technology" value="mongodb">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Oracle Database" src="./media/oracle.png">
						    <p>Oracle Database</p>
						    <span>Total 45 Videos</span><br><br>
						    <input type="hidden" name="technology" value="oracle">
						</form>
					</div>
					<hr>
					<div style="display: flex; flex-direction: row;">						            
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Microsoft SQL Server" src="./media/mssql.png">
						    <p>Microsoft SQL Server</p>
						    <span>Total 40 Videos</span><br><br>
						    <input type="hidden" name="technology" value="mssql">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="SQLite" src="./media/sqlite.png">
						    <p>SQLite</p>
						    <span>Total 30 Videos</span><br><br>
						    <input type="hidden" name="technology" value="sqlite">
						</form>
					</div> 
		        </fieldset>
		        <fieldset>
		            <legend style="color: white; font-weight: bold;">DevOps and Full Stack</legend>
		            <div style="display: flex; flex-direction: row;">						            
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="DevOps" src="./media/devops.png">
						    <p>DevOps</p>
						    <span>Total 50 Videos</span><br><br>
						    <input type="hidden" name="technology" value="devops">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Android" src="./media/android.png">
						    <p>Android</p>
						    <span>Total 45 Videos</span><br><br>
						    <input type="hidden" name="technology" value="android">
						</form>
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Docker" src="./media/docker.png">
						    <p>Docker</p>
						    <span>Total 40 Videos</span><br><br>
						    <input type="hidden" name="technology" value="docker">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Kubernetes" src="./media/kubernetes.png">
						    <p>Kubernetes</p>
						    <span>Total 35 Videos</span><br><br>
						    <input type="hidden" name="technology" value="kubernetes">
						</form>
					</div>
					<hr>
					<div style="display: flex; flex-direction: row;">						            
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="AWS" src="./media/aws.png">
						    <p>AWS</p>
						    <span>Total 40 Videos</span><br><br>
						    <input type="hidden" name="technology" value="aws">
						</form> 
						<form action="SetSessionValueServlet2" class="submitOnFormClick" method="post">
						    <img alt="Prompt Engineering" src="./media/prompt.png">
						    <p>Prompt Engineering</p>
						    <span>Total 30 Videos</span><br><br>
						    <input type="hidden" name="technology" value="prompt">
						</form>
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
        
        <script type="text/javascript">
		    document.querySelectorAll('.submitOnFormClick').forEach(form => {
		        form.addEventListener('click', function() {
		            <% session.setAttribute("nextLectureClicked", "false"); %>
		            this.submit();
		        });
		    });
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