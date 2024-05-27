<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>TechCraft Learning Hub</title>
        <link rel="stylesheet" href="index.css" type="text/css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.3/html2pdf.bundle.min.js"></script>
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
	        align-items: center;
	        justify-content: center;
	    }
	    
	    legend {
			background-color: #ffa200;
			border-radius: 10px;
			padding: 15px;
			font-size: 13px;
		}
		
		.certificte-container { 
			display: flex;
			margin: 0px 40px; 
			justify-content: center;
			align-items: center;
			letter-spacing: 1px;  
		}
		
		.certificate { 
			text-align:left;
			border-radius: 5px;
			margin: 15px; 
			width: 1000px; 
			height: 600px;
			padding: 0px 20px;
			background-image: url("./media/certificate13.jpg");  
            background-repeat: no-repeat;
            background-size: cover;
            background-position: center; 
		}
		 
		.certificate span {
			font-weight: bold;
			color: #0bbfff;
			font-size: 40px; 
		}
		
		.certificate b {
			font-weight: bold;
			color: #00334d;
			font-size: 50px; 
		}
	     
	     button {
	        color: #fff;
	        cursor: pointer;
	        font-weight: bold;
	        background-color: #0bbfff;
	        letter-spacing: 1px;
	        border: none;
	        padding: 15px 30px;
	        margin: 10px;
	        border-radius: 10px;
	        font-size: 15px; 
	        margin-top: 0px;
	        transition: transform 0.3s ease;
	    }
	    
	    button:hover {
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
	    
	    <%
		    String type = request.getParameter("type");
	        String technology = request.getParameter("technology");
	        String date = request.getParameter("date");
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
        	<span style="color: white"> Student's Certificate</span>
        </div>
        
        <div class="roadmap-main">
        	<div class="roadmap-heading"> 
        		<h2>Certificate</h2> 
        		<p>Here is the certificate of your progress, We celebrate your exceptional dedication and achievements through the TechCraft Learning Hub:</p> 
        		<fieldset>
		            <legend style="color: white; font-weight: bold;">Student's Certificate</legend>
		            	<div class="certificte-container">
		            		<div class="certificate" id="download-certificate"> 
		            			<div style="height: 100px"></div>
		            			<span style="margin-left: 385px">CERTIFICATE</span>
		            			<h3 style="margin-left: 420px">OF ACHIEVEMENT</h3>
		            			<h4 style="margin-left: 360px">This certificate proudly presented to :</h4>
		            			<div style="display: flex;">
			            			<span style="flex: 1"></span>
			            			<b><%= name %></b><br><br>
			            			<span style="flex: 1"></span>
		            			</div> <br>
		            			<div style="display: flex;">
			            			<span style="flex: 1"></span>
			            			<div>
			            				<strong style="margin-left: 15px; font-size: 15px;">This certificate is proudly awarded to Harshal Wandhare for successfully completing<br></strong>
										<strong style="margin-left: 0px; font-size: 15px;">the <%= type %> topic '<%= technology %>' and demonstrating significant enhancement of skills and<br></strong>
										<strong style="margin-left: 230px; font-size: 15px;">knowledge in this area!</strong><br><br>
									</div>
			            			<span style="flex: 1"></span>
		            			</div>
		            			
		            			<div style="display: flex; gap: 140px; margin-left: 330px;">
		            				<h4><%= date %></h4>
		            				<img alt="signature" src="./media/signature.png" width="120px" height="50px">
		            			</div>
		            			<div style="display: flex; gap: 170px; margin-left: 360px;">
		            				<h5>Date</h5>
		            				<h5>Head, Technolearn <br>Trainings</h5>
		            			</div>
		            		</div>
		            	</div> 
		              	<button onclick="downloadCertificate()">Download Certificate</button><br><br><br>
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
        	function downloadCertificate() {
        		
        		var element = document.getElementById('download-certificate');
        		var fileName = "<%= name%>-<%= type%>-<%= technology%>.pdf";
        		var opt = {
        		  margin:       0,
        		  filename:     fileName,
        		  image:        { type: 'jpeg', quality: 1 },
        		  html2canvas:  { scale: 5 },
        		  jsPDF:        { unit: 'in', format: 'letter', orientation: 'landscape' }
        		};
 
        		html2pdf().set(opt).from(element).save();   
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