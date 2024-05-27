<%@page import="techcraft.model.VideoProgress"%>
<%@page import="techcraft.dao.VideoDao"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.Session, org.hibernate.Transaction, org.hibernate.cfg.Configuration, org.hibernate.query.Query, techcraft.model.Videos, java.util.List" %>
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
		    border: 3px solid #000;
		    border-radius: 20px; 
		    background-image: url("./media/techback.jpg");
		    margin: 0px 20px;
		    text-align: center;
		}
		 
		.roadmap-main fieldset {
			display: flex;
			letter-spacing: 1px;
			margin: 30px;
			background-color: #002233; 
			border: solid 4px #000;
			border-radius: 20px;
			height: auto;
			margin-top: 10px;
		}  
		
		.videos-list {
			width: 100%;
			height: auto; 
			background-color: #002233;
			border-radius: 15px;
			text-align: left; 
		} 
		 
		.video-option {
			display: flex;
			justify-content: center;
			align-items: center;
			gap: 20px;
			width: auto;
			color: black;
	        cursor: pointer; 
	        background-color: #fff;  
	        letter-spacing: 1px; 
	        padding: 20px;
	        padding-bottom: 10px;
	        margin: 30px 50px;
	        padding: 30px;  
	        border: solid 2px #000;
	        border-radius: 10px;
	        transition: transform 0.3s ease; 
		}
		 
		.video-option:hover {  
			transform: scale(1.02);  
		}
    </style>
     
    <body>
    
    	<%
	        String name = (String) session.getAttribute("name");
			String nextLectureClicked = (String) session.getAttribute("nextLectureClicked"); 
	        if (name == null && nextLectureClicked == null) {
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
        			<p>At TechCraft Learning Hub, we believe in empowering learners with structured guidance that supports them through their video-based learning journey.</p> 
        			<div style="display: flex; margin: 0px 60px; margin-top: 20px;">
	        		<div class="dashboard-heading" style="margin: 10px 10px;"> 
	        			<% 	String technology = request.getParameter("technology"); 
	        			%>
			        	<span style="font-size: 15px; color: #888888">Learn:</span>
			        	<span style="color: black; font-size: 25px;"><%= technology %></span>
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
		            <div class="videos-list">
		        		<%  	
			        		SessionFactory factory = new Configuration().configure().buildSessionFactory();
							Session studentSession = factory.openSession();
							 
							try { 
							    Query<Videos> query = studentSession.createQuery("FROM Videos where technology = :technology", Videos.class);
							    query.setParameter("technology", technology);
							    List<Videos> challenges = query.getResultList();
							    
							    if(nextLectureClicked == "true") {
							    	int number = Integer.parseInt(request.getParameter("number"));
							    	Videos videos = challenges.get(number);
						%>			
									<% session.setAttribute("nextLectureClicked", "false"); %>
							    	<form id="submit-video-progress" action="VideoScreen.jsp"> 
							    		<% session.setAttribute("nextLectureClicked", "false"); %>
							        	<input type="hidden" name="technology" id="video-technology" value="<%= technology %>">
							        	<input type="hidden" name="number" id="video-number" value="<%= number+1%>">   
									    <input type="hidden" name="topic" id="video-topic" value="<%= videos.getTopic() %>"> 
									    <input type="hidden" name="resource" id="video-resource" value="<%= videos.getResource() %>">  
									</form>
									<script type="text/javascript">
										document.getElementById('submit-video-progress').addEventListener('submit', function() {
									        <% session.setAttribute("nextLectureClicked", "false"); %>
									    });
										document.getElementById('submit-video-progress').submit();
									</script>
						<%
							    } 
							    for (int i = 0; i < challenges.size(); i++) {
							    	Videos videos = challenges.get(i);
						%>			
								<div id="videoOption" class="video-option" onclick="playVideo(<%=i+1 %>, '<%= videos.getResource() %>','<%= videos.getTopic() %>')">			        		 
						        	<img alt="Play this video" src="./media/youtube.png" width="70px" height="70px">
						        	<div>
							        	<span style="font-size: 13px;">Video Lecture <%=i+1 %></span>
							        	<p><b><%= videos.getTopic() %></b></p> 
						        	</div>
						        	<span style="flex: 1"></span>
					        		<% 
									    try { 
									        SessionFactory factory1 = new Configuration().configure().buildSessionFactory();
									        Session studentSession1 = factory.openSession();
									        
									        Query<VideoProgress> query1 = studentSession.createQuery("FROM VideoProgress WHERE studentName = :studentName AND technology = :technology AND topic = :topic", VideoProgress.class);
									        query1.setParameter("studentName", name);
									        query1.setParameter("technology", technology);
									        query1.setParameter("topic", videos.getTopic());
									        VideoProgress existingProgress = query1.uniqueResult();
									
									        if (existingProgress != null) {
									%>
							        		<img alt="completed" src="./media/accept.png" width="30px" height="30px">
							        		<div id="replacement" style="width: 30px; display: none;"></div>
					        		<% } 
									        else { %>
			        						<img alt="completed" src="./media/accept.png" width="30px" height="30px;" style="display: none;">
							        		<div id="replacement" style="width: 30px;"></div>
		        					<% 
									        } 
									        studentSession1.close();
									        factory1.close();
									    } 
					            	catch (Exception e) {
									        e.printStackTrace(); 
									    }
									%>
					        	</div> 
						        <form id="submit-video-progress" action="VideoScreen.jsp"> 
						        	<input type="hidden" name="technology" id="video-technology" value="<%= technology %>">
						        	<input type="hidden" name="number" id="video-number">   
								    <input type="hidden" name="topic" id="video-topic"> 
								    <input type="hidden" name="resource" id="video-resource">  
								</form>
		        		<% 		
						        } 
							  
						   } 
						   catch (Exception e) {  
						        e.printStackTrace();
						   } 
						   finally {
						        studentSession.close();
						        factory.close();
						   }
						%> 
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
        
        <form id="generate-certificate" action="GenerateCertificate" method="post">
        	<input type="hidden" name="name" value="<%= name %>">
        	<input type="hidden" name="type" value="Video">
        	<input type="hidden" name="technology" value="<%= technology %>"> 
        </form>
        
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
        
        <%
        	int totalChallenges = VideoDao.totalChallenges(technology);
    		int totalSubmitedChllenges = VideoDao.totalSubmittedChallenges(technology, name);
        %>
        
        <script type="text/javascript">
		    if (<%= totalSubmitedChllenges %> === <%= totalChallenges %>  && <%= totalSubmitedChllenges %> != 0 && <%= totalChallenges %> != 0) {
		        Swal.fire({
		            title: "Congrats!",
		            text: "Progress Completed, Collect your Certificate!",
		            icon: "success",
		            showConfirmButton: false,
		            timer: 2500
		        });
		        console.log("certificate adding");
		        const name = "<%= name %>";
		        const type = "Video";
		        const technology = "<%= technology %>";
 
		        const uniqueKey = name+type+technology;

		        //localStorage.removeItem(uniqueKey);
		        if (!localStorage.getItem(uniqueKey)) { 
		            localStorage.setItem(uniqueKey, 'true'); 
		            document.getElementById('generate-certificate').submit();
		            console.log("certificate added");
		        }
		    }
		    else if (<%= totalChallenges %> == 0) {
		    	Swal.fire({
		            title: "Oops Sorry!",
		            text: "There is nothing right Now!",
		            icon: "info",
		            showConfirmButton: false,
		            timer: 2500
		        });
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