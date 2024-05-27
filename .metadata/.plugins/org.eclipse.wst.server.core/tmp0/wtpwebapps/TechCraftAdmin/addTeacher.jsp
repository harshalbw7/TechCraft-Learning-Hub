<%@page import="techcraft.admin.model.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.Session, org.hibernate.Transaction, org.hibernate.cfg.Configuration, org.hibernate.query.Query, techcraft.admin.model.Student, java.util.List" %>
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
		        transform: scale(1.1);
		    }
		}
				
		.roadmap-main p {
			letter-spacing: 1px;
			margin: 0px 100px;
		}
		
		.roadmap-main fieldset {
	        letter-spacing: 1px;
	        margin: 10px 50px;
	        margin-bottom: 50px;
	        background-color: #fff;
	        font-weight: bold;
	        border: solid 4px #00bfff;
	        border-radius: 20px;
	        height: auto; 
	        padding-right: 30px;
	        padding-top: 0px;
	    }
		
		legend {
			background-color: #ffa200;
			border-radius: 10px;
			padding: 15px;
			font-size: 13px;
		}
		  
		.socialMedia img {
		    width: 10%;
		    height: 10%;
		    margin-left: 15px;
		    cursor: pointer;
		}
		
		.pre-footer {
			display: flex; 
			align-items: center; 
			justify-content: center; 
			width: 100%;
		}
		
		.pre-footer button {
			color: #002233;
		    cursor: pointer;
		    font-weight: bold;
		    background-color: #ffa200;
		    letter-spacing: 1px;
		    border: none;
		    padding: 15px 30px;
		    margin: 10px;
		    margin-left: 40px;
		    border-radius: 15px;
		    font-size: large;
		    animation: zoomInOut 0.5s infinite alternate;
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
		
		.add-student {
			display: flex;
			justify-content: center;
			align-items: center;
			
		}
		
		.add-student img {
			width: 700px;
			height: 500px;
			margin: 0px 40px;
		}
		
		.add-form {
			margin: 20px;
			width: 100%;
		}
		
		.add-form input {
			width: 100%;
	        padding: 15px;
	        margin: 5px 0px;
	        border-radius: 5px;
	        box-sizing: border-box;
	        border: 2px solid #000;
	        font-weight: bold;
	        letter-spacing: 1px;
	        transition: transform 0.3s ease;
		}
		
		.add-form input:hover {
	    	transform: scale(1.02);
	    	border: 2px solid #0bbfff;
	    }
		
		.add-form button {
			color: #fff;
	        cursor: pointer;
	        font-weight: bold;
	        background-color: #00334d;
	        letter-spacing: 1px;
	        border: none;
	        padding: 15px 50px;
	        margin-left: 20px;
	        border-radius: 10px;
	        font-size: 15px; 
	        transition: transform 0.3s ease; 
		}
		
		.add-form button:hover {
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
	    
	    <% 
	        String status = (String)request.getAttribute("status");
	        if (status != null && status.equals("Success")) {
	    %>
	            <script type="text/javascript">
		            Swal.fire({
		            	title: "Congrates !",
		            	text: "Teacher added Successfully !",
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
	    %>

        <header>
            <img src="./media/code-simple.png" width=30px height=30px style="margin-left: 20px">
            <h1>TechCraft</h1>
            <div class="vl"></div>
            <div class="heading">
                <a href="adminHome.jsp" style="margin-top: 10px;">Student Details</a>
                <a href="addStudent.jsp" style="margin-top: 10px;">Add Student</a>
                <a href="addTeacher.jsp" style="border-bottom: 2px solid #ffa200; margin-top: 10px; padding-bottom: 10px;">Add Teacher</a>
                <a href="viewFeedbacks.jsp" style="margin-top: 10px; ">View Feedback</a>
            </div>
            <span style="flex: 1; margin-right: 0px;"></span>
            <img src="./media/user.png" width=20px height=20px style="margin-right: 15px">
        	<div class="popup">
			  <label for="user" class="userName"><%= name %><img class="dropdown-icon" alt="" src="./media/play.png"></label>    
			  <div class="popup-content">  
			    <a href="#">Profile</a> 
			    <p></p>
			    <a href="#" onclick="openModal('logoutModal')">Logout</a>
			  </div>
			</div> 
        </header>
        
        <div class="dashboard-heading">
        	<span style="font-size: 15px; color: #888888">Dashboard:</span>
        	<span style="color: white"> Add Student</span>
        </div>
        
        <div class="roadmap-main">
        	<div class="roadmap-heading"> <br>
        		<p>Register a new student to the TechCraft Learning Hub by entering their details, ensuring they can access and benefit from our comprehensive learning resources and track their progress within the platform :</p> <br>
        		<fieldset>
		            <legend style="color: white; font-weight: bold;">Add Student</legend> 
		            <div class="add-student">
		            	<img src="./media/add-teacher.png"> 
		                <div class="add-form">
			                <h2 style="text-align: center; color: black">Add Teacher</h2>
			                <form id="register-user" action="AddTeacher" method="post">
		                	<div style="display: flex; margin-bottom: 20px">
		                		<img src="./media/black-user.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 15px;">
		                		<input type="text" id="firstName" name="firstName" placeholder="First Name" required><br>
		                	</div>
		                	<div style="display: flex;margin-bottom: 20px">
		                		<img src="./media/black-user.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 15px;">
		                		<input type="text" id="lastName" name="lastName" placeholder="Last Name" required><br>
		                	</div>
		                	<div style="display: flex;margin-bottom: 20px">
		                		<img src="./media/email.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 15px;">
		                		<input type="email" id="email" name="email" placeholder="Email ID" required><br>
		                	</div>
		                	<div style="display: flex;margin-bottom: 20px">
		                		<img src="./media/mobile.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 15px;">
		                		<input type="text" id="number" name="number" placeholder="Mobile No" required><br>
		                	</div>
		                	<div style="display: flex;margin-bottom: 20px">
		                		<img src="./media/lock.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 15px;">
		                		<input type="password" id="password" name="password" placeholder="Password" required><br>
		                	</div>
		                	<div style="display: flex;margin-bottom: 20px">
		                		<img src="./media/confirm.png" style="width: 20px; height: 20px; margin-right: 10px; margin-top: 15px;">
		                		<input type="password" id="confirmPassword" name="confirmPassword" placeholder="Confirm Password" required><br>
		                	</div> 
						    <div style="display: flex; align-items: center; text-align: center; margin-left: 35px">
							    <div class="register-container">
							    	<input type="button" class="register" value="add student" id="signUpButton" onclick="registerClicked('registrationModal')" style="background-color: #ffa200; cursor: pointer; margin-left: 40px;">
							    	<div class="progress-bar hidden" id="proBar" style="margin-left: 40px;"></div>
							    </div>
							    <p id="error" style="font-size: 10px; color: red; margin-left: 60px;"></p>
						    </div> 
						</form>
		            	</div>
		            </div>
		        </fieldset>
        	</div>
        </div>
         
        <div id="logoutModal" class="modal-container">
            <!-- Modal content -->
            <div class="modal-content" style="max-width: 300px; margin: auto; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);">
                <form id="logoutForm" action="AdminLogout">
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
        			<a href="teacherHome.jsp">Technology Roadmaps</a><p></p>
	                <a href="videoLecture.jsp">Video Lectures</a><p></p>
	                <a href="codingEnhancement.jsp">Coding Enhancement</a><p></p>
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