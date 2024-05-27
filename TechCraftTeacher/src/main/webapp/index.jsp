<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
		
		.footer-content h4{
			font-weight: bold;
			padding-bottom: 20px;
			border-bottom: solid 2px #fff;
		}
				
		.footer-content div{  
			font-size: 13px; 
			max-width: 400px;
			text-align: left;
			color: white;
		}
				
		.footer-content a{  
			color: white;
			text-decoration: none;
			cursor: pointer;
		}
				
		.footer-content a:hover{  
			color: #ffa200; 
		}
				
		.footer-social-media img{   
			color: white;
			width: 30px;
			height: 30px; 
			padding: 5px; 
			cursor: pointer; 
			border: solid 2px #002233;
		}
				
		.footer-social-media img:hover{   
			border: solid 2px #ffa200;
			padding: 5px;
			border-radius: 5px;
		}
    
    </style>
		
    <body>
    	
    	<% 
	        String status = (String)request.getAttribute("status");
	        if (status != null && status.equals("Success")) {
	    %>
	            <script type="text/javascript">
		            Swal.fire({
		            	title: "Congrates !",
		            	text: "Acount Created Successfully !",
		            	icon: "success",
		            	showConfirmButton: false,
		            	timer: 2500,
	            	});
	            </script>
	    <%
	        }
	        if (status != null && status.equals("error")) {
	    %>
	    		<script type="text/javascript">
	    		            Swal.fire({
	    		            	title: "Sign In Failed !",
	    		            	text: "Wrong Email or Password !",
	    		            	icon: "error",
	    		            	showConfirmButton: false,
	    		            	timer: 2500,
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
                <a href="index.jsp">Home</a>
                <a onclick="openModal('AboutModel')">About</a>
                <a href="#">Contact</a>
                <a href="#">Feedback</a>
            </div>
            <span style="flex: 1"></span>
            <img src="./media/user.png" width=20px height=20px style="margin-right: 20px">
            <span>Teacher</span>
        </header>

        <div class="main">
        	<img src="./media/team-meeting.svg">
            <div class="about">
                <h1>Welcome to TechCraft</h1>
                <div class="modal-content">
	                <h2 style="text-align: center; color: black">Teacher Sign In</h2>
	                <form id="login-user" action="TeacherLogin" method="post">
	                	<div style="display: flex;">
	                		<img src="./media/email.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 7px;">
	                		<input id="loginEmail" type="email" name="email" placeholder="Email ID" required><br>
	                	</div>
	                	<div style="display: flex;">
	                		<img src="./media/lock.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 7px;">
	                		<input id="loginPass" type="password" name="password" placeholder="Password" required><br>
	                	</div>
	                    
	                    <div style="display: flex; margin-left: 35px">
	                        <div class="login-container">
							  <input type="button" class="login" value="Sign In" id="signInButton" onclick="loginClicked()" style="background-color: #ffa200">
							  <div class="progress-bar hidden" id="progressBar"></div>
							</div> 
	                    </div>
	                    <hr>
	                    <a class="clickLogin" style="font-size: small; text-align: center;" onclick="openModal('forgotPassword')">Forgot Password ?</a>
	                </form>
            	</div>
            </div>
        </div>
        
        <button onclick="scrollToTop()" id="scrollBtn" title="Go to top"><img class="go-top" alt="" src="./media/play.png"></button>

        <div id="AboutModel" class="modal-container">
            <!-- Modal about -->
            <div class="site-content">
                <div style="padding: 20px; display: flex; border-radius: 10px">
                    <img src="./media/success.svg">
                    <div>
                        <span style="color: black" onclick="closeModal('AboutModel')" class="close">&times;</span>
                        <h2 style="text-align: center; color: #ffa200; animation: zoomInOut 0.5s infinite alternate;">
                            About TechCraft</h2>
                        <p>TechCraft Learning Hub is an online learning platform that helps you to
                            learn and develop your skills.</p>
                        <p>Mission Statement:</p>
                        <div class="sub-about">At TechCraft Learning Platform, our mission is to democratize access to
                            quality tech education and empower learners worldwide to achieve their professional goals.
                            We believe that by providing comprehensive learning resources and fostering a supportive
                            learning community, we can inspire individuals to pursue their passion for technology and
                            thrive in today's digital landscape.</div>
                        <p>Join Us Today:</p>
                        <div class="sub-about">Embark on your learning journey with TechCraft Learning Platform and
                            unlock your full potential in the world of technology. Whether you're a student, a working
                            professional, or a tech enthusiast, our platform offers something for everyone. Join our
                            vibrant community of learners today and take the first step towards a successful tech
                            career! make it spell correct</div>
                        <p style="color: #ffa200; animation: zoomInOut 0.5s infinite alternate;">All The Best !</p>
                    </div>
                </div>
            </div>
        </div>
        
        <div id="forgotPassword" class="modal-container">
            <!-- Modal Login -->
            <div class="modal-content" style="margin: auto; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
                <span style="color: black" onclick="closeModal('forgotPassword')" class="close">&times;</span>
                <h2 style="text-align: center; color: black">Forgot Password</h2>
                <form id="forgot-password" action="ForgotPassword" method="post">
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
        			<a onclick="openModal('loginModal')">Technology Roadmaps</a><p></p>
	                <a onclick="openModal('loginModal')">Video Lectures</a><p></p>
	                <a onclick="openModal('loginModal')">Coding Enhancement</a><p></p>
	                <a onclick="openModal('loginModal')">Technical Quiz</a><p></p>
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

        <script type="text/javascript">

            function openModal(modalId) {
                var modal = document.getElementById(modalId);
                modal.style.display = 'block';
            }

            function closeModal(modalId) {
                var modal = document.getElementById(modalId);
                modal.style.display = 'none';
            }
            
        </script>
        
        <script type="text/javascript">
        
	        function loginClicked() { 
	        	var loginEmail = document.getElementById("loginEmail");
	        	var loginPass = document.getElementById("loginPass");
	        	
	        	 if (loginEmail.value.trim().length === 0) {
	                 loginEmail.style.border = "1px solid red";
	                 return;
	             }
	        	 else {
	        		 loginEmail.style.border = ""; // Reset border
			     }
	             if (loginPass.value.trim().length === 0) {
	                 loginPass.style.border = "1px solid red";
	                 return;
	             }
	             else {
	            	 loginPass.style.border = ""; // Reset border
			     }
	            document.getElementById("signInButton").style.display = "none"; 
	            document.getElementById("progressBar").classList.remove("hidden"); 
	            setTimeout(function() { 
	            	document.getElementById("login-user").submit();
	            }, 1500);  
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
        
    </body>

</html>