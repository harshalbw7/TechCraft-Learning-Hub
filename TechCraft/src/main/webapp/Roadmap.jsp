<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.Session, org.hibernate.Transaction, org.hibernate.cfg.Configuration, org.hibernate.query.Query, techcraft.model.Roadmaps, techcraft.model.RoadmapSubTopics, java.util.List" %>
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
			animation: zoomInOut 0.5s infinite alternate;
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
		
		fieldset {
			letter-spacing: 1px;
			margin: 30px 50px;
			background-color: #fff;
			font-weight: bold;
			border: solid 4px #00bfff;
			border-radius: 20px;
			height: auto;
			padding: 10px;
			margin-bottom: 50px;
		}
		
		.roadmap {
			display: flex; 
			justify-content: space-between; 
			align-items: center; 
			text-align: center;
		}
		
		.roadmap-subtopic {
			justify-content: center;
			align-items: center;
			text-align: center;
		}
		
		.upskill { 
			width: 300px;
			border: solid 4px #000; 
			border-radius: 10px; 
			padding: 20px 50px;
			font-weight: normal;
		}
		 
		.roadmap button {
			color: #fff;
		    cursor: pointer;  
		    letter-spacing: 1px;
		    background-color: #00334d; 
		    padding: 12px 50px; 
		    border-radius: 10px;
		    border: none;
		    font-size: 12px; 
		    transition: transform 0.3s ease;
		}
		
		.roadmap button:hover {
			background-color: #0bbfff;
			transform: scale(1.1);
		} 
		
		.close {
			color: black;
			cursor: pointer;
	    	font-size: 25px;
			font-weight: bold;
		}
		 
		.modal-content a {
			font-weight: bold;
			text-align: left;
			color: #00bfff;
			text-align: left;
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
                <a href="studentHome.jsp" style="border-bottom: 2px solid #ffa200; margin-top: 10px; padding-bottom: 10px;">Technology Roadmaps</a>
                <a href="videoLecture.jsp" style="margin-top: 10px; color: #fff">Video Lectures</a>
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
        	<span style="color: white"> Technology Roadmaps</span>
        </div>
        
        <div class="roadmap-main">
        	<div class="roadmap-heading"> <br>
        		<p>Technical Roadmap is a community effort to create roadmaps, guides and other educational content to help guide developers in picking up a path and guide their learnings.</p> 
        		<fieldset>
		            <% String buttonValue = request.getParameter("submitButton"); %>
			        <h1><%=buttonValue %> Roadmap</h1>
			        
			        <% 
				        SessionFactory factory = new Configuration().configure().buildSessionFactory();
			            Session studentSession = factory.openSession();
			            Transaction transaction = null; 
			            
			            try {
			                transaction = studentSession.beginTransaction();
			                
			                Query<Roadmaps> query = studentSession.createQuery("FROM Roadmaps WHERE technology= :technology", Roadmaps.class);
			                query.setParameter("technology", buttonValue);
			                List<Roadmaps> topics = query.getResultList();
			
			                for (int k = 0; k < topics.size(); k++) {
			                	Roadmaps roadmaps = topics.get(k);
			                	
			                	Query<RoadmapSubTopics> query1 = studentSession.createQuery("FROM RoadmapSubTopics WHERE topic= :topic", RoadmapSubTopics.class);
				                query1.setParameter("topic", roadmaps.getTopic());
				                List<RoadmapSubTopics> subTopics = query1.getResultList();
			                	
			                	if(k%2 == 0) {
			        %>
			        
							        <div class="roadmap"> 
							        	<span style="flex: 1;"></span>
								        <div class="roadmap-subtopic">
								        	 	<div style="display: flex;">
								             		<span style="flex: 1;"></span>
								             		<div style="height: 30px; width: 0px; border: solid 4px #00bfff;"></div>
								             		<span style="flex: 1;"></span>
								             	</div>
								             	<button style="background-color: #ffa200; cursor: default;transform: scale(1);"><%=roadmaps.getTopic() %></button>
								             	<div style="display: flex;">
									             	<span style="flex: 1;"></span>
									             	<div style="height: 10px; width: 0px; border: solid 4px #00bfff;"></div>
									             	<span style="flex: 1;"></span>
									             </div>
								             	
								             <% for(int i=0; i<subTopics.size(); i++) {
								            		RoadmapSubTopics roadmapSubTopics = subTopics.get(i);  
								             %> 
								            	 	<button onclick="openSidebar('resource', '<%= roadmapSubTopics.getSubTopic() %>', '<%= roadmapSubTopics.getDescription() %>', '<%= roadmapSubTopics.getResource() %>')"><%= roadmapSubTopics.getSubTopic() %></button>
								              
									             	<div style="display: flex;">
									             		<span style="flex: 1;"></span>
									             		<div style="height: 10px; width: 0px; border: solid 4px #00bfff;"></div>
									             		<span style="flex: 1;"></span>
									             	</div>
								             <% 
								             	}
								             %>
								        </div> 
								        <span style="width: 100px;"></span>
								        <div class="upskill">Step by step guide to up skill in<br> <%=roadmaps.getTopic() %> <br><br><b><%=roadmaps.getDuration() %></b></div>
								        <span style="flex: 1;"></span>
							        </div>
							        
							        <div style="display: flex;">
							             <span style="flex: 1;"></span> 
							             <div style="width: 508px; border-top: solid 8px #00bfff; border-right: solid 8px #00bfff;"></div>
							             <span style="flex: 1;"></span>
							        </div>
							        
					<%
			                	}else {
					%>
							        
							        <div class="roadmap">
							        	<span style="flex: 1;"></span>
								        <div class="upskill">Step by step guide to up skill in<br> <%=roadmaps.getTopic() %> <br><br><b><%=roadmaps.getDuration() %></b></div>
								        <span style="width: 100px;"></span>
								        <div class="roadmap-subtopic">
								        	 	<div style="display: flex;">
								             		<span style="flex: 1;"></span>
								             		<div style="height: 30px; width: 0px; border: solid 4px #00bfff;"></div>
								             		<span style="flex: 1;"></span>
								             	</div>
								             	<button style="background-color: #ffa200; cursor: default;transform: scale(1);"><%=roadmaps.getTopic() %></button>
								             	<div style="display: flex;">
									             	<span style="flex: 1;"></span>
									             	<div style="height: 10px; width: 0px; border: solid 4px #00bfff;"></div>
									             	<span style="flex: 1;"></span>
									             </div>
								             	
								             <% for(int i=0; i<subTopics.size(); i++) {
								            		RoadmapSubTopics roadmapSubTopics = subTopics.get(i);  
								             %> 
								            	 	<button onclick="openSidebar('resource', '<%= roadmapSubTopics.getSubTopic() %>', '<%= roadmapSubTopics.getDescription() %>', '<%= roadmapSubTopics.getResource() %>')"><%= roadmapSubTopics.getSubTopic() %></button>
								              
									             	<div style="display: flex;">
									             		<span style="flex: 1;"></span>
									             		<div style="height: 10px; width: 0px; border: solid 4px #00bfff;"></div>
									             		<span style="flex: 1;"></span>
									             	</div>
								             <% 
								             	}
								             %>
								        </div>
								        <span style="flex: 1;"></span>
							        </div>
							        
							        <div style="display: flex;">
							             <span style="flex: 1;"></span> 
							             <div style="width: 508px; border-top: solid 8px #00bfff; border-left: solid 8px #00bfff;"></div>
							             <span style="flex: 1;"></span>
							        </div>
			        
			        <% 
			                	}
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
		   	        <br>continue learning ! <br><br><br>
		        </fieldset> 
        	</div>
        </div>
        
        <div id="resource" class="modal-container"> 
		<!-- Modal content -->
			<div class="modal-content" style="left: 85%; right: 0; height: 95vh; text-align: left; font-size: 13px;">
			<br>
			<span onclick="closeModal('resource')" class="close">&times;</span>
			<h3 id="topic" style="text-align: left; color: black;">hello</h3><hr><br>
			<span id="topic-description" style="text-align: left; font-weight: normal;">Angular is a popular open-source web application framework maintained by Google. It simplifies the development of dynamic single-page applications (SPAs) by providing a structured framework for building client-side applications. Understanding the basics of Angular, its core features, and architecture is essential for developing modern web applications.</span> 
			<hr><br>
			<span style="text-align: left; font-weight: normal;"><b>Visit the following resources to learn more:</b></span><br><br>
			<a id="video-link" href="#" target=" ">Learn from Resource</a>
			</div>
		</div>
         
        <div id="logoutModal" class="modal-container">
            <!-- Modal content -->
            <div class="modal-content" style="max-width: 300px;">
                <form id="logoutForm" action="StudentLogout">
                    <p style="color: black">Are you sure, you want to Logout ?</p>
                    <div style="display: flex; gap: 10px; align-items: center">
                        <input type="button" class="login" style="background-color: #ffa200; border: none" value="Yes"
                            onclick="logOut()">
                        <input type="button" class="login" style="background-color: #d2d2e0; border: none" value="Cancel"
                            onclick="closeModal('logoutModal')">
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
        			<a href="userHome.jsp">Technology Roadmaps</a><p></p>
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
	        function openSidebar(modalId, topic, description, url) {
	        	
	            var modal = document.getElementById(modalId); 
	            var headingElement = document.getElementById('topic');
	            var spanElement = document.getElementById('topic-description');
	            var linkElement = document.getElementById('video-link');
	
	            modal.style.display = 'block';
	            headingElement.innerText = topic; 
	            
	            if(description == "null") {
	            	spanElement.innerText = "In the context of a technology topic or a learning roadmap, a description typically refers to an explanatory text that provides an overview, details, or key points about the topic. This description aims to give the reader a clear understanding of what the topic is about, its significance, and possibly how it fits into the broader context of the technology or subject being studied. The description serves as a foundational piece of information that helps learners grasp the essence and significance of the topic before diving into more detailed content or practical exercises related to that topic.";
	            }else {
	            	spanElement.innerText = description;
	            } 
	            linkElement.href = 'https://www.youtube.com/watch?v=' + url;
	        }
		</script>
        
		<% } %>
    </body>
    </html>