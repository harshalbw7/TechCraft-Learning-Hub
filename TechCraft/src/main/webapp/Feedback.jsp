<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
			animation: zoomInOut 0.5s infinite alternate;
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
	    
	    .student-details {
	        display: flex;
	        font-weight: normal;
	        font-size: 14px;
	        justify-content: center;
	        align-items: center;
	    }
	    
	    .student-details img { 
	        width: 600px;
	        height: 600px;
	        animation: zoomInOut 0.5s infinite alternate;
	    }
	    
	    .give-feedback { 
	        letter-spacing: 1px;
	        width: 100%; 
	        border: solid 4px #000;
	        border-radius: 20px;
	        margin: 40px;
	        margin-left: 0px;
	        font-size: 15px; 
	        text-align: left;
	        font-weight: bold;
	        background-color: #002233;
	        color: white;
	    }
	    
	    .give-feedback form {
	        margin: 20px;
	        padding: 20px;
	    }
	    
	    .form-div {  
	        width: auto; 
	        margin: 20px;
	    }
	     
	    .form-div input, .form-div textarea {
	        width: 100%;
	        padding: 10px; 
	        border-radius: 10px; 
	        border: 2px solid #000;
	        letter-spacing: 1px;
	    } 
	    
	    .give-feedback button {
	        color: #fff;
	        cursor: pointer;
	        font-weight: bold;
	        background-color: #0bbfff;
	        letter-spacing: 1px;
	        border: none;
	        padding: 10px;
	        margin: 10px;
	        border-radius: 10px;
	        font-size: 15px;
	        width: 100%;
	        transition: transform 0.3s ease;
	    }
	    
	    .give-feedback button:hover { 
	        background-color: #0bbfff;
	        transform: scale(1.03);   
	    }
	    
	    .rating {
		    display: inline-block;
		    unicode-bidi: bidi-override;
		    direction: rtl;
		    margin-left: 20px;
		}
		.rating input {
		    display: none;
		}
		.rating label {
		    font-size: 60px;
		    color: #ccc;
		    cursor: pointer;
		    transition: transform 0.3s ease;
		}
		
		.rating label:hover {
			transform: scale(1.1);
		}
		
		.rating input:checked ~ label {
		    color: orange;
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
		            	title: "Submited !",
		            	text: "Feedback submited Successfully !",
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
	    		            	title: "Submission Failed !",
	    		            	text: "Please try again !",
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
        	<span style="color: white"> Student's Feedback</span>
        </div>
        
        <div class="roadmap-main">
        	<div class="roadmap-heading"> 
        		<h2>Feedback</h2> 
        		<p>Provide your feedback and experience using TechCraft Learning Hub, elaborating on your overall experience, features you found useful, and any suggestions for improvement:</p> 
        		<fieldset>
		            <legend style="color: white; font-weight: bold;">Student's Feedback</legend> 
		             <div class="student-details">  
		             	<img src="./media/young.svg" alt="Illustration of a student">
		             	<div class="give-feedback">
				        	<form id="feedbackForm" action="StudentFeedback" method="post" onsubmit="return validateForm()"> 
							    <div class="form-div" style="margin-bottom: 40px;"> 
							        <label for="input_format">Name:</label> 
							        <input type="hidden" name="studentName" value="<%= name %>">
							        <label style="color: #002233;"><%= name %></label>
							    </div> 
							    <div class="form-div" style="margin-bottom: 0px;"> 
							        <label for="input_format">How likely are you to recommend TechCraft Learning Hub to others?</label>
							    </div> 
							    <div class="rating" style="margin-bottom: 10px;">
							        <input type="radio" id="star5" name="rating" value="5">
							        <label for="star5">&#9733;</label>
							        <input type="radio" id="star4" name="rating" value="4">
							        <label for="star4">&#9733;</label>
							        <input type="radio" id="star3" name="rating" value="3">
							        <label for="star3">&#9733;</label>
							        <input type="radio" id="star2" name="rating" value="2">
							        <label for="star2">&#9733;</label>
							        <input type="radio" id="star1" name="rating" value="1">
							        <label for="star1">&#9733;</label>
							        <input type="hidden" id="ratingInput" name="rating">
							    </div> <br>
							    <div class="form-div" style="margin-bottom: 40px;"> 
							        <label for="comment">Share your experience with TechCraft Learning Hub :</label><br><br>
							        <input id="comment" name="comment" required></input> 
							    </div> 
							    <div class="form-div"> 
							        <label for="suggession">Any suggestions for improving TechCraft Learning Hub :</label><br><br>
							        <textarea id="suggession" name="suggession" rows="5" required></textarea>
							    </div>  
							    <button type="submit" value="Submit">Submit Feedback</button>
							</form>
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
        
        <script type="text/javascript"> 
        
	        function validateForm() {
	            const stars = document.querySelectorAll('.rating input');
	            let starSelected = false;
	            
	            stars.forEach((star) => {
	            	star.addEventListener('change', function () {
		                console.log('Rating:', this.value); 
		                document.getElementById('ratingInput').value = this.value;   
		            });
	                if (star.checked) {
	                    starSelected = true;
	                }
	            });

	            if (!starSelected) {
	                alert('Please select a star rating.');
	                return false; 
	            } 
	            return true;  
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