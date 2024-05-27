<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="techcraft.dao.VideoDao"%>
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
			margin-left: 5px;
			text-align: center;
		}
		
		.about {
			display: flex;
			flex-direction: column;
			flex: 1;
			width: 100%;
		}
		
		.progress b {
			letter-spacing: 1px;
			font-size: 13px; 
		}
	    .progress-container { 
	        width: 300px;
	        height: 10px;
	        background-color: #002233;
	        border-radius: 5px; 
	        margin: 10px; 
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
		
		.roadmap-main {
			width: auto;
		    height: auto;
		    background-size: cover;
		    padding: 10px 0px;  
		    background-image: url("./media/techback.jpg"); 
		    text-align: center; 
		}
		 
		.roadmap-main fieldset { 
			color: white;
			letter-spacing: 1px;
			margin: 30px 0px;
			background-color: #002233;  
			height: auto;
			margin-top: 10px;
			font-weight: bold;
			padding: 30px;
			padding-right: 35px;
			font-size: 20px;
			text-align: left;
		}  
		
		iframe {
			width: 100%;
			height: 600px;
			border: solid 4px #fff;
			border-radius: 10px;
		}
		
		.roadmap-main button {
			color: #fff;
		    cursor: pointer;  
		    letter-spacing: 1px;
		    background-color: #0bbfff;
		    border: none;
		    padding: 20px;
		    margin: 10px;
		    margin-top: 40px;  
		    border-radius: 10px; 
		    width: 230px; 
		    font-weight: bold;
		    transition: transform 0.3s ease;
		}
		
		.roadmap-main button:hover { 
			transform: scale(1.1);
		} 
		 
    </style>
     
    <body>
    	
    	<% session.setAttribute("nextLectureClicked", "false"); %>
    	<%
	        String name = (String) session.getAttribute("name");
    		String nextLectureClicked = (String) session.getAttribute("nextLectureClicked");
	        if (name == null) {
	            response.sendRedirect("index.jsp");
	        } else {
	    %>
	    
	    <script type="text/javascript">
    window.onload = function () {
        if (window.history && window.history.pushState) {
            window.history.pushState(null, null, document.URL); // Create a history entry for the current page
            window.addEventListener('popstate', function (event) {
                // Check if the state has changed and if it's a backward navigation
                if (event.state && event.state.navigation === 'back') {
                    // Handle back button click
                    <% session.setAttribute("nextLectureClicked", false); %>
                }
                window.history.pushState({ navigation: 'back' }, null, document.URL); // Create a new history entry
            });
        }
    };
</script>

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
        			<p>At TechCraft Learning Hub, we believe in empowering learners with structured guidance that supports them through their video-based learning journey.</p> 
        			<div style="display: flex; margin: 0px 60px; margin-top: 20px;">
	        		<div class="dashboard-heading" style="margin: 10px 10px;"> 
	        			<% 	String technology = request.getParameter("technology");
	        				int number = Integer.parseInt(request.getParameter("number")) ;
	        				String topic = request.getParameter("topic");
	        				String resource = request.getParameter("resource");
	        			%>
			        	<span style="font-size: 15px; color: #888888">Learn:</span>
			        	<span style="color: black; font-size: 25px;"><%= technology %> |<b style="font-size: 15px;"> Lecture : <%= number %></b></span>
			        </div> 
			        <span style="flex: 1"></span>
			        <div style="display: flex;">
						<div class="progress">
							<b id="completed">Complete all to get your Certificate !</b>
							<a id="get-certificate" href="studentProfile.jsp" style="display: none; color: #0bbfff; text-decoration: none;"><b>Certificate !</b></a>
							<div class="progress-container">
							    <div class="progress-barr" id="progressBar"></div>
							</div> 
						</div>
						<div class="progress-text" id="progressText"></div> 
					</div>
				</div>
		        <fieldset>   
		            <iframe id="videoScreen" class="video-screen" src="https://www.youtube.com/embed/<%= resource %>" allowfullscreen>Video</iframe>
					<div style="display: flex; margin: 0px 20px; justify-content: center; align-items: center;">
					<div>
					<p><b id="lecture" style="color: #0bbfff;">Lecture <%= number %> :</b></p>
					<span id="topic"><%= topic %></span>
					</div>
					<span style="flex: 1"></span>
					
					<% 
					    int totalChallenges = VideoDao.totalChallenges(technology);
					    int totalSubmitedChllenges = VideoDao.totalSubmittedChallenges(technology, name); 
					    if (number == totalChallenges) { %>
					        <form action="SetSessionValueServlet" method="post">
					            <% session.setAttribute("nextLectureClicked", "false"); %>
					            <input type="hidden" name="lastLecture" value="true">
					            <input type="hidden" name="technology" id="video-technology" value="<%= technology %>">
					            <input type="hidden" name="topic" id="video-topic" value="<%= topic %>"> 
					            <input type="hidden" name="studentName" id="video-resource" value="<%= name %>">
					            <button type="submit" style="background-color: #ffa200">Proceed to Lectures</button>
					        </form>
					    <% } else { %>
					        <form action="SetSessionValueServlet" method="post">
					            <% session.setAttribute("nextLectureClicked", "false"); %>
					            <input type="hidden" name="lastLecture" value="false">
					            <input type="hidden" name="technology" id="video-technology" value="<%= technology %>">
					            <button type="submit" style="background-color: #ffa200">Go to Lectures</button>
					        </form>
					        <div style="width: 20px;"></div>
					        <form action="SubmitVideoProgress" method="post">
					            <% session.setAttribute("nextLectureClicked", "true"); %>
					            <input type="hidden" name="technology" id="video-technology" value="<%= technology %>">
					            <input type="hidden" name="number" id="video-number" value="<%= number %>">
					            <input type="hidden" name="topic" id="video-topic" value="<%= topic %>"> 
					            <input type="hidden" name="studentName" id="video-resource" value="<%= name %>">
					            <button type="submit">Next Lecture</button>
					        </form>
					    <% } %>
					    
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
	        function playVideo(n, url, topicName) {
	       		
	        	const videoNumber = document.getElementById('video-number');
	            const videoTopic = document.getElementById('video-topic');
	            const videoResource = document.getElementById('video-resource');
	            const submitVideoProgressForm = document.getElementById('submit-video-progress');
	         
	            videoNumber.value = n;
	            videoTopic.value = topicName;
	            videoResource.value = url;
	            submitVideoProgressForm.submit();
	        }
        </script>
         
        <script type="text/javascript">
		    const progressBar = document.getElementById('progressBar');
		    const progressText = document.getElementById('progressText');
		     
		    let width = 0;
		    const interval = setInterval(() => {
		        if (width == 100) {
		        	const completed = document.getElementById('completed');
		        	const getcertificate = document.getElementById('get-certificate');
		        	
		        	completed.innerText = "Completed, collect your ";
		        	getcertificate.style.display = 'inline-block';
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