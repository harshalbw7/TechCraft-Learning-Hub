<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="org.hibernate.SessionFactory, org.hibernate.Session, org.hibernate.Transaction, org.hibernate.cfg.Configuration, org.hibernate.query.Query, techcraft.model.Coding, java.util.List" %>
    <!DOCTYPE html>
    <html>

    <head>
        <title>TechCraft Learning Hub</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
        
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="sweetalert2.min.js"></script>
		<link rel="stylesheet" href="sweetalert2.min.css"> 
        
        <!-- Ace Library : to implement code Editor functionality -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.8/ace.js" type="text/javascript" charset="utf-8"></script>
        
        <!-- Tell the browser to be responsive to screen width -->
        <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
        <meta name="description" content="Compile and Execute your C programs online. OnlineCPP .">
        <meta name="keywords" content="online c compiler, online c compiler gcc, compile c program">
        <meta name="author" content="online-ide.com">
        <meta name="copyright" content="dazzlecode">
        <meta name="robots" content="index, follow">
        <meta name="googlebot" content="index, follow">
        <meta name="apple-mobile-web-app-capable" content="yes">
        <meta name="apple-touch-fullscreen" content="yes">
        
        <link rel="icon" type="image/png" href="dazzlecode.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/components/dropdown.min.css" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/components/transition.min.css" />

        <!-- Bootstrap 3.3.7 -->
        <link rel="stylesheet" href="https://www.online-cpp.com/assets/bower_components/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
        <link rel="stylesheet" href="https://www.online-cpp.com/assets/dist/css/ide.css?v=b2">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
        <script src="https://www.online-cpp.com/assets/bower_components/jquery/dist/jquery.min.js"></script>
        <script src="https://www.online-cpp.com/assets/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
        <script src="https://www.online-cpp.com/assets/dist/js/ide.js?v=a7"></script>

        <!-- Ace Editor -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.8/ace.js" type="text/javascript" charset="utf-8"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.8/ext-language_tools.min.js" type="text/javascript" charset="utf-8"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.8/ext-settings_menu.min.js" type="text/javascript" charset="utf-8"></script>
        <script async src="https://cdnjs.cloudflare.com/ajax/libs/ace/1.4.8/ext-keybinding_menu.min.js" type="text/javascript" charset="utf-8"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/split.js/1.2.0/split.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.js"></script>
        <script async src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/components/dropdown.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/components/transition.min.js"></script>
        <script type="text/javascript" src="//script.crazyegg.com/pages/scripts/0119/2367.js" async="async"></script>
        <script async src="https://www.googletagmanager.com/gtag/js?id=UA-178434116-1"></script>

        <style>
        	body {
			    font-family: sans-serif;
			    margin: 0;
			    overflow-x: hidden;
			    align-items: center;
			    background-color: #002233;
			}
			
			header {
				position: fixed;
				z-index: 1;
			    background-color: #002233;
			    width: 100%;
			    height: auto;
			    border-radius: 10px;
			    display: flex;
			    justify-content: space-between; 
			    align-items: center;
			    padding: 10px;
			    box-sizing: border-box;
			}
			
			.ace_gutter {
				z-index: 0;
			}
			
			header h1 {
			    color: #ffa200;
			    letter-spacing: 1px;
			    margin-left: 20px;
			}
			
			.vl {
			    border-left: 6px solid #ffa200;
			    height: 30px;
			    margin-left: 40px;
			}
			
			.heading {
			    display: flex;
			    gap: 68px;
			    margin-left: 70px;
			}
			
			.heading a {
			    color: white;
			    letter-spacing: 1px;
			    text-decoration: none;
			    font-weight: bold;
			    background-color: #002233;
			    cursor: pointer;
			}
			
			.heading a:hover {
			    color: #ffa200;
			    text-decoration: none;
			    background-color: #002233;
			}
			
			header span {
			    color: #ffa200;
			    cursor: pointer;
			    margin-right: 90px;
			    font-weight: bold;
			    animation: zoomInOut 0.5s infinite alternate;
			}
			
			.userName {
				color: #ffa200;
			    cursor: pointer;
			    margin-top: 5px;
			    margin-right: 10px;
			    font-weight: bold;
			    letter-spacing: 1px;
			}
			
			.dropdown-icon {
				width: 10px;
				height: 10px;
				margin-left: 5px;
				margin-bottom: 2px;
				transform: rotate(90deg);
			}
        	
        	header a, label{
				font-size: 16px; 
				letter-spacing: 1px;       	
        	}
        	
        	.popup {
		        position: relative;
		        display: inline-block;
		    }
		
		    .popup-content {
		        display: none;
		        flex-direction: column;
		        position: absolute;
		        background-color: #f9f9f9;
		        margin-right: 40px; 
		        border-radius: 10px; 
		        padding: 10px 25px;
		        width: auto;
		        height: auto;
		        z-index: 1;
		        top: 100%;  
		        left: 0;
		    }
		
		    .popup:hover .popup-content {
		        display: block;
		    }
		    
		    .popup-content a {
				text-decoration: none;
				color: #002233; 
				font-weight: bold;
		        font-size: 15px;
			}
			
			.popup-content a:hover {
				color: #ffa200;
			}
			
			.dashboard-heading { 
				letter-spacing: 1px;
				width: 100%;
				background-color: #002233;
				padding: 10px 20px;
			}
			
			.dashboard-heading span {
				font-weight: bold;
				font-size: 25px;
				text-align: center;
			}
        	
        	.modal-container {
			    display: none;
			    position: fixed;
			    z-index: 1;
			    left: 0;
			    top: 0;
			    width: 100%;
			    height: 100%;
			    background-color: rgba(0, 0, 0, 0.8);
			    overflow: auto;
			}
			
			.modal-content {
			    background-color: #efeff5;
			    align-items: center;
			    justify-content: center;
			    margin: auto; 
			    padding: 30px;
			    width: 80%;
			    max-width: 400px; 
			    position: fixed;  
			    top: 50%;  
			    left: 50%;  
			    transform: translate(-50%, -50%); /* Move it back by half of its own width and height */
			    border: 2px solid #000;
			    border-radius: 15px;
			    letter-spacing: 1px;
			}
			
			.modal-content input[type="text"],
			.modal-content input[type="email"],
			.modal-content input[type="password"] {
			    width: 100%;
			    padding: 10px;
			    margin-bottom: 15px;
			    border-radius: 5px;
			    box-sizing: border-box;
			    border: 1px solid #000;
			}
			
			.modal-content input[type="button"] {
			    background-color: #ffa200;
			    font-weight: bold;
			    color: #000;
			    border: none;
			    padding: 10px 20px;
			    border-radius: 5px;
			    cursor: pointer;
			    animation: zoomHeading 0.5s infinite alternate;
			}
			
			.modal-content input[type="button"] {
			    background-color: #e6e6e6;
			    font-weight: bold;
			    color: #000;
			    border: none;
			    padding: 10px 20px;
			    border-radius: 5px;
			    cursor: pointer;
			}
			
			.modal-content input[type="submit"]:hover {
			    background-color: #ff9900;
			    border-radius: 5px;
			}
			
			.close {
			    position: absolute;
			    top: 15px; 
			    right: 20px; 
			    cursor: pointer;
			    font-size: 20px;
			    color: #fff;
			}
        
        	.pageBody{
        		background-color: #002233; 
        		background-size: cover;
        		border-radius: 10px; 
        		display: flex;
        		height: auto;
        		font-size: 13px;
        	}

            .question {
                background-color: #002233;
                margin: 10px;
                width: 150vh;
                height: 100vh;
                margin-right: 0px;
                flex-grow: 1;
                border-radius: 10px;
            }
            
            .que-detail {
	             background-color: #fff;
	             width:100%;
	             height: 48%;
	             border: 2px solid #000;
                 border-radius: 10px;
                 padding: 10px;
	        }
	        
	        .required-input {
	             background-color: #fff;
	             width:100%;
	             height: calc(20% - 40px);
	             border: 2px solid #000;
                 border-radius: 10px;
                 margin-top: 10px;
                 padding: 10px;
	        }
	 
	        .required-output {
	             background-color: #fff;
	             width:100%;
	             height: 19%;
	             border: 2px solid #000;
                 border-radius: 10px;
                 margin-top: 10px;
                 padding: 10px;
	        }
	        
	        .explination {
	        	background-color: #fff;
	             width:100%;
	             height: 14%;
	             border: 2px solid #000;
                 border-radius: 10px;
                 margin-top: 10px;
                 padding: 10px;
	        }

            .container {
                width: 100%;
                margin-top: 5px;
            }
          
            .split {
                border: 2px solid #000;
                margin-top: 5px;
                border-radius: 10px;
            }
            
            .display-result{
            	border: none;
            	cursor: default;
            	width: 25%;
            	height: 100%;
            	background-color: #c2c2d6; 
            	font-size: 15px;
            	font-weight: bold;
            	color: white;
            	border-radius: 5px;
            	padding: 2px;
            	margin: 3px;
            }
            
            .check-result{
            	border: none;
            	cursor: pointer;
            	width: 10%;
            	height: 100%;
            	background-color: #cccccc; 
            	font-size: 13px;
            	font-weight: bold;
            	color: black;
            	border-radius: 5px;
            	padding: 2px;
            	margin: 3px;
            }
            
            .check-result:hover{
            	background-color: #ff9900;
            }
            
            .submit-challenge {
            	display: none;
            	border: none;
            	cursor: pointer; 
            	background-color: #33cc33; 
            	font-size: 15px;
            	font-weight: bold;
            	color: white;
            	border-radius: 5px;
            	padding: 10px 50px;
            	margin: 20px;
            	margin-top: 0px;
            	animation: zoomIO 0.5s infinite alternate;
            }
              
			@keyframes zoomIO {
			    0% {
			        transform: scale(1);
			    }
			    100% {
			        transform: scale(1.05);
			    }
			}

            .show {
                display: block !important;
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
            
            footer {
			    background-color: #000;
			    color: #fff;
			    text-align: center;
			    padding: 20px;
			    border-radius: 10px;
			    margin-top: 10px;
			    letter-spacing: 2px;
			}
        </style>
    </head>
     
    <body>
    
    	<%
	        String name = (String) session.getAttribute("name");
	        if (name == null) {
	            response.sendRedirect("index.jsp");
	        } else {
	    %>

        <header>
            <img src="./media/code-simple.png" width=30px height=30px style="margin-left: 20px">
            <h1 style="margin-bottom: 24px; font-weight: bold; font-size: 32px; ">TechCraft</h1>
            <div class="vl"></div>
            <div class="heading">
                <a href="studentHome.jsp" style="margin-top: 10px; color: #fff">Technology Roadmaps</a>
                <a href="videoLecture.jsp" style="margin-top: 10px; color: #fff">Video Lectures</a>
                <a href="codingInhancement.jsp" style="border-bottom: 2px solid #ffa200; margin-top: 10px; padding-bottom: 10px;">Coding Enhancement</a>
                <a href="technicalQuiz.jsp" style="margin-top: 10px; color: #fff">Technical Quiz</a>
            </div>
            <span style="flex: 1; margin-right: 0px;"></span>
            <img src="./media/user.png" width=20px height=20px style="margin-right: 20px">
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
        <div style="width: 100%; height: 100px; background-color: #002233;"></div>
        
        <div class="dashboard-heading">
        	<span style="font-size: 15px; color: #888888">Dashboard:</span>
        	<span style="color: white"> Coding Enhancement</span>
        </div>
        
        <% 
	        String technology = request.getParameter("technology");
	        String topic = request.getParameter("challenge"); 
        %>
        <div style="width: 100%; padding: 10px; background-image: url('./media/techback.jpg'); background-size: cover;"><span style="color: black;letter-spacing: 1px; font-weight: bold; font-size: 20px;">Challenge : <%= topic %> </span></div>
        <div class="pageBody"> 
        	<%  
				SessionFactory factory = new Configuration().configure().buildSessionFactory();
				Session studentSession = factory.openSession();
				Transaction transaction = null;
						            
				try {
					transaction = studentSession.beginTransaction();         
					Query<Coding> query = studentSession.createQuery("FROM Coding WHERE topic = :topic", Coding.class);
					query.setParameter("topic", topic); 
					Coding coding = query.uniqueResult();

					if (coding != null) {
			%>
		                <div class="question">
		                	<div class="que-detail"> 
		                		<b>Problem: <%= topic %></b><br><br>
		                			<b>Question:</b><br>
									<%= coding.getQuestion() %>
									<br><br>
									<b>Function Description:</b> <br>
									<%= coding.getFunctionDetail() %>
									<br><br>
									<b>Input Format:</b> <br>
									<%= coding.getInputFormat() %>
									<br><br>
									<b>Output Format:</b> <br>
									<%= coding.getOutputFormat() %>
							</div>
		                	<div class="required-input">
		                		<p style="color: black; font-weight: bold">Sample Input :</p>
		                		<p><%= coding.getInput() %></p>
		                	</div>
		                	<div class="required-output">
		                		<p style="color: black; font-weight: bold">Sample Output :</p>
		                		<p id="sample-output"><%= coding.getOutput() %></p>
		                		<p id="match-result"></p>
		                	</div>
		                	<div class="explination">
		                		<b>explanation :</b><br>
		                		<%= coding.getExplination() %>
		                	</div>
		                </div>
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
                <div class="container" id="container">
                    <div id="header-control">
                        <div class="btn-group setting-btn" role="group" style="display: none;">
                            <button type="button" class="btn btn-default" id="toggle-theme" data-toggle="tooltip"
                                data-container="body" data-placement="left" title="Change Theme"><i
                                    class="fas fa-moon fa-lg"></i></button>

                            <button type="button" class="btn btn-default" onclick="about_modal()" id="info"
                                data-toggle="tooltip" data-container="body" data-placement="left" title="About Site"><i
                                    class="fas fa-info-circle"></i></button>

                            <button type="button" class="btn btn-default" onclick="ace_setting()" id="setting"
                                data-toggle="tooltip" data-container="body" data-placement="left" title="Settings"><i
                                    class="fas fa-cogs"></i></button>
                        </div>
                        <div class="btn-group">
                            <button style="border: 2px solid #000; border-radius: 10px" type="button"
                                class="btn btn-default btn-custom" id="open_file" onclick="openFile(dispFile)"
                                data-toggle="tooltip" data-container="body" data-placement="right"
                                title="Open File from Disk"><i class="fas fa-folder-open"></i></button>
                  
                        </div>
                        <div style="border: 2px solid #000; border-radius: 10px" class="ui fluid selection dropdown"
                            id="lang-select" data-toggle="popover" data-trigger="manual" data-placement="left"
                            data-content="Select the programming language">
                            <i class="dropdown icon"></i>
                            <div class="default text">Language</div>
                            <div class="menu">
                            	<div class="item" data-value="python">Python</div>
                                <div class="item" data-value="c">C</div>
                                <div class="item" data-value="cpp">C++</div>
                                <div class="item" data-value="java">Java</div>
                            </div>
                        </div>
                    </div>
                    <div id="mi" class="split">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="active" id="editor-1"><a data-toggle="tab">main.py</a></li>
                            <li style="display: none;" id="new_file_btn"><button type="button"
                                    class="btn btn-default btn-sm add-editor" id="create_tab" data-title="New File"><i
                                        class="fas fa-plus"></i></button></li>
                        </ul>
                        <div id="editor"></div>
                        <div class="boxed" id="editor_footer"></div>
                    </div>
                    <div class="control-bar" style="display: flex;">
                        <div id="control-btn" style="margin: 3px">
                            <button type="button" class="btn btn-success btn-sm" id="run-btn" onclick="run_python()"
                                data-toggle="popover" data-placement="bottom" data-trigger="hover"
                                data-content="Run Code" style="background-color: #39ac73; color: white;"><i
                                    class="fa fa-play"></i>&ensp;<strong>Run</strong></button>
                        </div>
                        <input style="display: none;" class="textbox" type="text" id="input_arguments"
                            placeholder=" Command Line Arguments">
                            <div style="display: flex; gap:10px; justify-content: flex-end; width: 100%;">
					        	<button id="submit" class="check-result" onclick="matchResult()" title="Check Answer">Check</button>
					        	<button id="display-result" class="display-result">Result</button>
					        </div>
                    </div>
                    <div id="d" class="split">
                        <div class="boxed1" id="output_header">
                            <div id="hint-section"></div>
                            <div class="btn-group status" id="tool-btn">
                                <button type="button" data-toggle="tooltip" data-container="body" data-placement="right"
                                    title="Clear" class="btn btn-default btn-sm status" onclick="clear_output()"><i
                                        class="fas fa-eraser"></i></button>
                            </div>
                            <button type="button" data-toggle="tooltip" data-container="body" data-placement="right"
                                title="Expand/Collapse" class="btn btn-default btn-sm status" id="term-expand"
                                onclick="term_expand()"><i class="fas fa-expand-alt fa-lg"></i></button>
                            &ensp;
                            <div id="output-status"></div>
                        </div>
                        <div id="terminal">
                            <div id="progress-status"></div>
                            <div class="boxed2" id="output">
                                <div class="wrapper" id="wrap"></div>
                                <form id="term-form">
                                    <input id="term-input" autocomplete="off">
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Save Result modal -->
                    <div class="modal fade" tabindex="-1" role="dialog" id="downloadResult">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                            aria-hidden="true">&times;</span></button>
                                    <h3 class="modal-title">Download Result</h3>
                                </div>
                                <div class="modal-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="name">File Name:</label>
                                            <input type="text" class="form-control" id="download_file_name"
                                                value="main_output.txt">
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                   </div>
              </div>
        </div>
        
        <div style="width: 100%; background-color: #002233; display: flex;">
        	<span style="flex: 1;"></span>
        	<form id="challenge-form" action="codingQuestions.jsp">
		        <input type="hidden" name="submitButton" value="<%= technology %>"> 
		        <button type="button" id="submit-challenge" class="submit-challenge" onclick="submitChallenge()">Submit Challenge</button>
		    </form> 
		</div>
		
		<form id="submit-coding-challenge" action="SubmitCodingChallenge" method="post">
		    <input type="hidden" name="studentName" value="<%= name %>"> 
		    <input type="hidden" name="technology" value="<%= technology %>"> 
		    <input type="hidden" name="topic" value="<%= topic %>">  
		</form>
         
        <div id="logoutModal" class="modal-container">
            <!-- Modal content -->
            <div class="modal-content">
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
         
        <div style="width: 100%; height: 30px; background-color: #fff;"></div>
        
        <script type="text/javascript">
		    function matchResult() {
		        const outputDiv = document.getElementById('term-output');
		        const sampleOutputDiv = document.getElementById('sample-output');
		        const result = document.getElementById('display-result');
		        const submit = document.getElementById('submit-challenge');
		
		        const textoutputDiv = outputDiv.textContent.replace(/\n/g, '');  
		        const textsampleOutputDiv = sampleOutputDiv.textContent.trim();  
		
		        console.log('textoutputDiv:', textoutputDiv);
		        console.log('textsampleOutputDiv:', textsampleOutputDiv);
		
		        if (textoutputDiv === textsampleOutputDiv) { 
		            result.style.backgroundColor = '#33cc33';
		            result.textContent = 'Correct Answer';
		            submit.style.display = 'block';
		        } else {
		            result.style.backgroundColor = 'red';
		            result.textContent = 'Wrong Answer';
		            submit.style.display = 'none';
		        }
		        result.classList.add('no-cursor');
		    }
		</script>
		
		<script type="text/javascript">
		
			function submitChallenge() {
		        Swal.fire({ 
		            icon: "success",
		            title: "Your work has been saved!",
		            showConfirmButton: false,
		            timer: 1500
		        });
		        
		        setTimeout(function() {
		            document.getElementById("submit-coding-challenge").submit();
		        }, 500);
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
            0
        </script>
        
        <script type="text/javascript">
        	function setLanguageMode(mode) {
        		ace.edit(editor, {
        		  theme: "ace/theme/cobalt",
        		  mode: "ace/mode/"+mode,
        		});
			}
        </script>

        <script type="text/javascript">

            ace.require("ace/ext/language_tools");
            var editor = ace.edit("editor");
            ace.require('ace/ext/settings_menu').init(editor);

            var editor_cnt = 1, editor_index = 1, active_editor = 1, editor_session = [];
            var request, init_ts, open_file_name;
            var lang = "c";

            default_content = get_script(lang);
            var prev_result = 'in';
            var site_url = "https://www.online-cpp.com/"
            var base_url = "https://www.online-cpp.com/"
            var share_url = base_url;
            var exe_cnt = 0;
            var addthis_share = {

                url: share_url,
            }

            var csrf_token_name = 'csrf_ide_token_name'
            var csrf_token = 'd6aba020c2a8e73fd0e8518586f4ac80'
            var isMobile = window.orientation > -1;

            toastr.options = {

                "closeButton": true,
                "debug": false,
                "newestOnTop": true,
                "positionClass": "toast-top-right",
                "preventDuplicates": true,
                "preventOpenDuplicates": true,
                "maxOpened": 1,
                "onclick": null,
                "showDuration": "100",
                "hideDuration": "1000",
                "timeOut": "3000",
                "extendedTimeOut": "1000",
                "showEasing": "swing",
                "hideEasing": "linear",
 
            };

            var instance = Split(['#mi', '#d'], {

                direction: 'vertical',
                sizes: [66, 28],
                gutterSize: 5,
                cursor: 'row-resize',
                minSize: [0, 180],

                onDrag: function () {
                    editor.resize();
                },
            });

            function term_expand() {

                var element = document.getElementById('term-expand').innerHTML;

                if (element === '<i class="fas fa-expand-alt fa-lg"></i>') {

                    instance.setSizes([0, 94]);
                    editor.resize();
                    document.getElementById('term-expand').innerHTML = '<i class="fas fa-compress-alt fa-lg"></i>'
                }
                else {

                    instance.setSizes([66, 28]);
                    editor.resize();
                    document.getElementById('term-expand').innerHTML = '<i class="fas fa-expand-alt fa-lg"></i>'
                }

                $('#term-expand').blur();
                $('[data-toggle="tooltip"]').tooltip('hide');
            }

            editor.setOptions({

                enableBasicAutocompletion: true, // the editor completes the statement when you hit Ctrl + Space
                enableLiveAutocompletion: true, // the editor completes the statement while you are typing
                enableSnippets: true,
                showPrintMargin: false, // hides the vertical limiting strip
                fixedWidthGutter: true,
                autoScrollEditorIntoView: true,
                copyWithEmptySelection: true,
                highlightActiveLine: false,

            });

            editor.setTheme("ace/theme/textmate");
            editor.container.style.lineHeight = 1.5;
            editor_session[0] = ace.createEditSession(default_content, "ace/mode/python");
            editor.setSession(editor_session[0]);

            var active_editor_id = $('#editor-1').children('a');
            var active_file_name = 'main.py';
            var repl_host = get_host();
            var command_list = [];
            var command_index = 0;
            var cur_cmd;
            var hint_glow;
            var y = document.getElementById('editor_footer');
            var output = document.getElementById('output');
            var exec_detail = document.getElementById('output-status');
            var progress_status = document.getElementById('progress-status');

            $(function () {

                $('[data-toggle="tooltip"]').tooltip({
                    delay: { show: 750, hide: 50 }
                })
            });

            $(function () {

                $('[data-toggle="popover"]').popover({
                    delay: { "show": 0, hide: 0 }
                })
            });

            $('.popover-dismiss').popover({
                trigger: 'hover'
            });

            editor.session.setMode("ace/mode/" + get_mode(lang));
            $('#lang-select').dropdown('set selected', lang);
            document.getElementById('editor-1').innerHTML = '<a data-toggle="tab">' + get_scriptname(lang) + '</a>';

            $('#lang-select').dropdown('setting', 'onChange', function (value) {

                lang = value;
                editor.session.setMode("ace/mode/" + get_mode(lang));
                $("#lang-select").popover('hide');
                document.getElementById('editor-1').innerHTML = '<a data-toggle="tab">' + get_scriptname(lang) + '</a>';

                if (editor_session[0].getValue() === default_content) {

                    default_content = get_script(lang);
                    editor_session[0].setValue(default_content)
                    editor.focus();
                    editor.navigateFileEnd();
                }
            });

            $(".nav-tabs").on("click", "a", function (e) {

                e.preventDefault();
                detail_chk = (e.detail === undefined) ? 1 : e.detail;

                if (!$(this).hasClass('add-editor') && !$(this).children('input').hasClass('thVal') && detail_chk == 1) {

                    active_editor = parseInt($(this).parent().attr('id').split('-')[1]);
                    active_editor_id = $(this);
                    editor.setSession(editor_session[active_editor - 1]);
                    active_file_name = $(this).html();

                    $(this).tab('show');
                    editor.focus();
                    update_editor_footer();
                }
            })

                .on("click", "span", function () {

                    close_tab = $(this).parent();
                    close_tab.children('a').click();

                    $('#close_file_title').text('Close - ' + active_file_name);

                    if (editor.getValue() === "") {
                        close_editor_tab();
                    }
                    else {
                        $("#closeEditorTab").modal('show');
                    }
                });

            $('#rename_file').click(function (e) {

                e.stopPropagation();
                e.preventDefault();
                active_editor_id.dblclick();

            });

            $('.add-editor').click(function (e) {

                e.stopPropagation();
                e.preventDefault();

                editor_cnt += 1;
                editor_index += 1;
                var id = editor_cnt;
                active_editor = id;

                editor_session[active_editor - 1] = ace.createEditSession('', "ace/mode/" + get_mode(lang));
                editor.setSession(editor_session[active_editor - 1]);


                $(this).closest('li').before('<li id="editor-' + id + '"><a data-toggle="tab">Untitled' + id + '</a> <span> <i class="fa fa-times"></i></span></li>');
 
                active_editor_id = $(".nav-tabs li").children('a').last();
                active_editor_id.tab('show');
                active_editor_id.dblclick();
                update_editor_footer();

                editor.selection.on('changeCursor', function (e) {
                    update_editor_footer();
                });

                editor.selection.on('changeSelection', function (e) {
                    update_editor_footer();
                });
            });

            $(document).on('dblclick', '.nav-tabs > li > a', function (event) {

                if ($(event.target).attr('class') != "thVal") {

                    event.stopPropagation();
                    event.preventDefault();
                    var currentEle = $(this);
                    var value = $(this).html();

                    if (value.search('<input') === -1) updateVal(currentEle, value);
                }
            });

            editor.focus();
            editor.navigateFileEnd();
            update_editor_footer();

            editor.selection.on('changeCursor', function (e) {
                update_editor_footer();
            });

            editor.selection.on('changeSelection', function (e) {
                update_editor_footer();
            });

            $('.status button').attr('disabled', 'disabled');
            $('#stop-btn').attr('disabled', 'disabled');

            socket_options = {

                transports: ["websocket"],
                'timeout': 3000,
                'connect timeout': 3000,
                'reconnection': true,
                'reconnectionDelay': 1000,
                'reconnectionDelayMax': 5000,
                'reconnectionAttempts': 5
            };

            $(document).keyup(function (e) {

                IsCtrl = false;
                IsShift = false;

            }).keydown(function (e) {

                if (e.which == 17) { IsCtrl = true; }
                if (e.which == 16) { IsShift = true; }

                switch (e.which) {
                    case 119: run_python(); e.preventDefault(); break;
                    case 120: share_code_modal(); e.preventDefault(); break;
                    case 121: save_code_modal(); e.preventDefault(); break;
                }
            });

            $('#output').on('click', function () {
                $('#term-input').focus();
            });

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
        
        <div style="width: 100%; background-color: #002233; height: 100%">
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
        </div>
       
        <footer style="margin-top: 0px; padding-top: 10px">
            <p>&copy; 2024 TechCraft Learning Hub. @ Harshal Wandhare</p>
        </footer>
        
		<% } %>
    </body>
    </html>