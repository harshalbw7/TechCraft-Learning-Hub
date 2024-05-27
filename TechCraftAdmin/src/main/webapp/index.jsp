<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>TechCraft Learning Hub</title>
        <link rel="stylesheet" href="adminIndex.css" type="text/css">
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
            <span>Administrator</span>
        </header>

        <div class="main">
            <img src="./media/remote-team.svg">
            <div class="about">
                <h1>Welcome to TechCraft</h1>
                <div class="modal-content">
	                <h2 style="text-align: center; color: black">Administrator Sign In</h2>
	                <form id="login-user" action="AdminLogin" method="post">
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
                <form id="forgot-password" action="AdminForgotPssword" method="post">
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