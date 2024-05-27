<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.Session, org.hibernate.Transaction, org.hibernate.cfg.Configuration, org.hibernate.query.Query, techcraft.model.Feedback, java.util.List" %>
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
		
    	.student-details { 
			font-weight: bold;
			font-size: 12px;
			justify-content: center;
			align-items: center;
			height: 500px;
			overflow-y: auto; 
			padding-right: 50px;  
		}
		
		.student-details img {
			width: 550px;
			height: 550px;
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
	        if (status != null && status.equals("failed")) {
	    %>
	    	            <script type="text/javascript">
	    		            Swal.fire({
	    		            	title: "Email already Exist !",
	    		            	text: "Please select different email !",
	    		            	icon: "error",
	    		            	showConfirmButton: false,
	    		            	timer: 3000,
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
                <a onclick="openModal('feedbackModel')">Feedback</a>
            </div>
            <span style="flex: 1"></span>
            <img src="./media/user.png" width=20px height=20px style="margin-right: 20px">
            <span onclick="openModal('loginModal')">Sign In</span>
        </header>
        
        <div style="width: 100%; height: 100px;"></div>

        <div class="main">
            <div class="about">
                <h1>Welcome to TechCraft</h1>
                <p style="font-weight: bold;">TechCraft Learning Hub is an online learning platform that helps you to
                    learn and develop your skills.</p> <!-- Corrected typo -->
                <p class="moto" >An innovative online learning hub designed to empower individuals with the skills and
                    knowledge needed to excel in the rapidly evolving world of technology. Our platform offers a
                    comprehensive range of resources, including technology roadmaps, video lectures, coding enhancement
                    tools, and technical quizzes, aimed at catering to learners of all levels, from beginners to
                    advanced professionals !</p>
                <button onClick="openModal('registrationModal')">Get Started<img src="./media/play.png"
                        style="margin-left: 10px; margin-top: 5px; width: 15px; height: 15px"></button>
                <p style="color: #002133; font-size: 15px">Join our community today and start your journey towards
                    mastering the latest technologies !</p>
            </div>
            <img src="./media/freelancer.svg">
        </div>
        
        <button onclick="scrollToTop()" id="scrollBtn" title="Go to top"><img class="go-top" alt="" src="./media/play.png"></button>
         
        <div class="features">
        	<img alt="" src="./media/organizational-agility.svg">
        	<div>
        		<h1>Technology Roadmaps</h1>
        		<div class="feature" style="background-color:#ff9900;">
	        		<h4>Technology Roadmaps</h4>
	                <p>Our platform's technology roadmaps are meticulously crafted to guide learners through the intricacies of various technologies. Whether you're a novice or an experienced professional, our roadmaps provide clear pathways for skill acquisition and career progression. With curated resources and expert advice, you can navigate the ever-evolving landscape of technology with confidence. </p>
        		</div>
        	</div>
        </div>
         
        <div class="features">
	        <div>
	        	<h1>Video Lectures</h1>
	        	<div class="feature">
	        		<h4>Video Lectures</h4>
	                <p>Dive deep into the world of technology with our extensive library of video lectures. Delivered by industry experts, these lectures cover a diverse array of topics, ensuring that learners receive a comprehensive education. From foundational principles to cutting-edge advancements, our videos cater to individuals at every stage of their learning journey.</p>
	        	</div>
	        </div>
        	<img alt="" src="./media/website.svg">
        </div>
         
        <div class="features">
        	<img alt="" src="./media/easter-egg-hunt.svg">
        	<div>
        		<h1>Coding Enhancement</h1>
	        	<div class="feature" style="background-color:#ff9900;">
	        		<h4>Coding Enhancement</h4>
	                <p>Elevate your coding prowess with our suite of interactive tools designed to hone your skills. Whether you're brushing up on the basics or tackling advanced concepts, our platform provides the resources you need to excel. With real-time feedback and personalized recommendations, you can sharpen your coding abilities and unlock new opportunities in the digital realm.</p>
	        	</div>
        	</div>
        </div>
         
        <div class="features"> 
        	<div>
        		<h1>Technical Quiz</h1>
	        	<div class="feature">
	        		<h4>Technical Quiz</h4>
	                <p> Put your technical knowledge to the test with our engaging quizzes designed to challenge and educate. Covering a wide range of subjects, our quizzes offer insight into your strengths and areas for improvement. Whether you're preparing for exams or simply seeking to expand your understanding, our interactive quizzes are an invaluable tool for growth and learning.</p>
	        	</div>
        	</div>
        	<img alt="" src="./media/task.svg">
        </div>

        <div id="registrationModal" class="modal-container">
            <!-- Modal Registration -->
            <div class="modal-content">
                <span style="color: black" onclick="closeModal('registrationModal')" class="close">&times;</span>
                <h2 style="text-align: center; color: black">Sign Up</h2>
                <form id="register-user" action="StudentRegistration" method="post">
                	<div style="display: flex;">
                		<img src="./media/black-user.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 7px;">
                		<input type="text" id="firstName" name="firstName" placeholder="First Name" required><br>
                	</div>
                	<div style="display: flex;">
                		<img src="./media/black-user.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 7px;">
                		<input type="text" id="lastName" name="lastName" placeholder="Last Name" required><br>
                	</div>
                	<div style="display: flex;">
                		<img src="./media/email.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 7px;">
                		<input type="email" id="email" name="email" placeholder="Email ID" required><br>
                	</div>
                	<div style="display: flex;">
                		<img src="./media/mobile.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 7px;">
                		<input type="text" id="number" name="number" placeholder="Mobile No" required><br>
                	</div>
                	<div style="display: flex;">
                		<img src="./media/lock.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 7px;">
                		<input type="password" id="password" name="password" placeholder="Password" required><br>
                	</div>
                	<div style="display: flex;">
                		<img src="./media/confirm.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 7px;">
                		<input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required><br>
                	</div> 
				    <div style="display: flex; align-items: center; text-align: center; margin-left: 35px">
				    	<div class="register-container">
				    		<input type="button" class="register" value="Sign Up" id="signUpButton" onclick="registerClicked('registrationModal')" style="background-color: #ffa200">
				    		<div class="progress-bar hidden" id="proBar"></div>
				    	</div>
				        <p id="error" style="font-size: 10px; color: red; margin-left: 20px;"></p>
				    </div>
				    <hr>
				    <p style="text-align: center; color: black">If already registered | <a onclick="openAndClose()"
				            class="clickLogin">Sign In</a> </p>
				    <div class="socialMedia" style="display: flex">
				        <img src="./media/Google.gif" style="margin-left: 95px">
				        <img src="./media/Facebook.gif">
				        <img src="./media/Linkedin.gif" onclick="toSocialAccount()">
				        <img src="./media/Instagram.gif">
				    </div>
				</form>
            </div>
        </div>
        
        <script type="text/javascript">
        	function toSocialAccount() {
        		window.location.href = "https://www.linkedin.com/company/technolearn-trainings-institute/about/";
        	}
        </script>

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
        
        <div id="feedbackModel" class="modal-container">
            <!-- Modal about -->
            <div class="site-content" style="position: fixed; left: 10%">
                <div style="padding: 20px; border-radius: 10px">
                	 <span style="color: black" onclick="closeModal('feedbackModel')" class="close">&times;</span>
                	 <h2>Student's Feedbacks</h2>
                     <div class="student-details">  
				        	<table>
				        		<tr>
				        			<th>Sr No.</th>
				        			<th>Name</th>
				        			<th>Rating</th>
				        			<th>Comment</th>
				        			<th>Suggestion</th>
				        			<th>Date</th>
				        		</tr> 
				                 
				        		<%  
						            SessionFactory factory = new Configuration().configure().buildSessionFactory();
						            Session studentSession = factory.openSession();
						            Transaction transaction = null;
						            
						            try {
						                transaction = studentSession.beginTransaction();
						                
						                Query<Feedback> query = studentSession.createQuery("FROM Feedback", Feedback.class);
						                List<Feedback> Feedbacks = query.getResultList();
						
						                for (int i = 0; i < Feedbacks.size(); i++) {
						                	Feedback feedback = Feedbacks.get(i);
						        %>
									        <tr style="background-color: #002233; height: 8px"></tr>
									        <tr>
									            <td><%= i + 1 %></td>
									            <td><%= feedback.getStudentName() %></td>
									            <td><%= feedback.getRating() %></td>
									            <td><%= feedback.getComment() %></td>
									            <td><%= feedback.getSuggession() %></td> 
									            <td><%= feedback.getDate() %></td> 
									        </tr> 
						        <% 
						                }
						                transaction.commit();
						            } 
						            catch (Exception e) { 
						                if (transaction != null) {
						                    transaction.rollback();
						                }
						                e.printStackTrace();
						            } 
						            finally {
						                studentSession.close();
						                factory.close();
						            }
						        %>
				        	</table> 
				    </div>
                </div>
            </div>
        </div>

        <div id="loginModal" class="modal-container">
            <!-- Modal Login -->
            <div class="modal-content">
                <span style="color: black" onclick="closeModal('loginModal')" class="close">&times;</span>
                <h2 style="text-align: center; color: black">Sign In</h2>
                <form id="login-user" action="StudentLogin" method="post">
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
						  <input type="button" class="login" value="Sign In" id="signInButton" onclick="loginClicked('loginModal')" style="background-color: #ffa200">
						  <div class="progress-bar hidden" id="progressBar"></div>
						</div>
                        <a class="clickLogin" style="font-size: small;" onclick="openForgot()">Forgot Password ?</a>
                    </div>
                    <hr>
                    <p style="text-align: center; color: black;">If not registered | <a onclick="closeAndOpen()"
                            class="clickLogin">Sign Up</a> </p>
                </form>
            </div>
        </div>
        
        <div id="forgotPassword" class="modal-container">
            <!-- Modal Login -->
            <div class="modal-content">
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
						  <input type="button" class="login" value="Get Credentials" id="getCredential" onclick="getCredentialClicked('forgotPassword')" style="margin-top: 10px; background-color: #ffa200">
						  <div class="progress-bar hidden" id="forgotProgress"></div>
					</div> 
                </form>
            </div>
        </div>
        
        <div class="pre-footer">
            <p style="color: #fff; font-size: 15px; letter-spacing: 1px;">Start your journey towards mastering the latest technologies !</p>
            <button onClick="openModal('registrationModal')">Get Started<img src="./media/play.png"
                        style="margin-left: 10px; width: 15px; height: 15px"></button>
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

            function openAndClose() {
                openModal('loginModal');
                closeModal('registrationModal');
            }

            function closeAndOpen() {
                openModal('registrationModal');
                closeModal('loginModal');
            }

            function openModal(modalId) {
                var modal = document.getElementById(modalId);
                modal.style.display = 'block';
            }

            function closeModal(modalId) {
                var modal = document.getElementById(modalId);
                modal.style.display = 'none';
            }
            
            function openForgot(){
            	openModal('forgotPassword');
                closeModal('loginModal');
            }
            
        </script>
        
        <script type="text/javascript">
	        function getCredentialClicked(modalId) {
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
		            setTimeout(function() {  
		            	document.getElementById("getCredential").style.display = "block"; 
			            document.getElementById("forgotProgress").classList.add("hidden");
			            closeModal(modalId);
		            }, 10000); 
	        }
        </script>
        
        <script type="text/javascript">
        
	        function loginClicked(modalId) { 
	        	var loginEmail = document.getElementById("loginEmail");
	        	var loginPass = document.getElementById("loginPass");
	        	
	        	 if (loginEmail.value.trim().length === 0) {
	                 loginEmail.style.border = "1px solid red";
	                 return;
	             }
	        	 else {
	        		 loginEmail.style.border = "";  
			     }
	             if (loginPass.value.trim().length === 0) {
	                 loginPass.style.border = "1px solid red";
	                 return;
	             }
	             else {
	            	 loginPass.style.border = ""; 
			     }
	            document.getElementById("signInButton").style.display = "none"; 
	            document.getElementById("progressBar").classList.remove("hidden"); 
	            setTimeout(function() { 
	            	document.getElementById("login-user").submit(); 
	            }, 1500);  
	            setTimeout(function() {  
	            	document.getElementById("signInButton").style.display = "block"; 
		            document.getElementById("progressBar").classList.add("hidden");
		            closeModal(modalId);
	            }, 10000);  
	        }
        
        </script>
        
        <script type="text/javascript">
        
	        function registerClicked(modalId) { 
	        	if (validateForm()) {
	        		document.getElementById("signUpButton").style.display = "none"; 
		            document.getElementById("proBar").classList.remove("hidden");
		            setTimeout(function() {
		            	document.getElementById("register-user").submit(); 
		            }, 500); 
		        } 
	        }
         
		    function validateForm() {
		        var firstName = document.getElementById("firstName");
		        var lastName = document.getElementById("lastName");
		        var email = document.getElementById("email");
		        var number = document.getElementById("number");
		        var password = document.getElementById("password");
		        var confirmPassword = document.getElementById("confirmPassword");
		
		        var valid = true;
		 
		        var nameRegex = /^[a-zA-Z]+$/;  
		        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
		        var passwordRegex = /^(?=.*[A-Z])(?=.*\d).{6,}$/;  
		        var mobileRegex = /^[6-9]\d{9}$/;  
		        
		        var error = document.getElementById("error");
		        error.innerHTML = ""; 
		
		      
		        if (!nameRegex.test(firstName.value.trim())) {
		            error.innerHTML = "Please enter a valid first name (only letters).";
		            firstName.style.border = "1px solid red";
		            valid = false;
		            return valid; 
		        } else {
		            firstName.style.border = ""; 
		        }
		
		        if (!nameRegex.test(lastName.value.trim())) {
		            error.innerHTML = "Please enter a valid last name (only letters).";
		            lastName.style.border = "1px solid red";
		            valid = false;
		            return valid;  
		        } else {
		            lastName.style.border = "";  
		        }
		
		        if (!emailRegex.test(email.value.trim())) {
		            error.innerHTML = "Please enter a valid email address.";
		            email.style.border = "1px solid red";
		            valid = false;
		            return valid;  
		        } else {
		            email.style.border = ""; 
		        }
		 
		        if (!mobileRegex.test(number.value.trim())) {
		            error.innerHTML = "Please enter a valid 10-digit mobile number starting with 6, 7, 8, or 9.";
		            number.style.border = "1px solid red";
		            valid = false;
		            return valid;  
		        } else {
		            number.style.border = "";  
		        }
		 
		        if (!passwordRegex.test(password.value.trim())) {
		            error.innerHTML = "Password must be at least 6 characters long, have at least one uppercase letter, and one number.";
		            password.style.border = "1px solid red";
		            valid = false;
		            return valid;  
		        } else {
		            password.style.border = "";  
		        }
		 
		        if (confirmPassword.value.trim() !== password.value.trim()) {
		            error.innerHTML = "Confirm Password and Passwords do not match.";
		            confirmPassword.style.border = "1px solid red";
		            valid = false;
		            return valid; 
		        } else {
		            confirmPassword.style.border = "";  
		        }
		
		        return valid;
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