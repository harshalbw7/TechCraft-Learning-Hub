<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="sweetalert2.min.js"></script>
        <link rel="stylesheet" href="sweetalert2.min.css">
        <title>Progress Bar</title>
        <style>
            p {
                font-size: 40px;
                margin-top: 0px;
                font-weight: bold;
                letter-spacing: 2px;
                color: #002233;
            }

            .timeRemaining {
                color: red;
                animation: zoomInOut 0.5s infinite alternate;
            }

            @keyframes zoomInOut {
                0% {
                    transform: scale(1);
                }

                100% {
                    transform: scale(1.05);
                }
            }
        </style>
    </head>

    <body>
 
<h1>Upload Video Details</h1>
    <form action="UploadVideoServlet" method="POST"> 
    
        <label for="resource">Resource:</label>
        <input type="text" id="resource" name="resource" required><br><br>

        <label for="technology">Technology:</label>
        <input type="text" id="technology" name="technology"><br><br>

        <label for="topic">Topic:</label>
        <input type="text" id="topic" name="topic" required><br><br>

        <input type="submit" value="Upload">
    </form>
    
<h1>Upload Quiz Details</h1>
    <form action="UploadQuizServlet" method="POST">  
    
    <label for="technology">Technology:</label>
    <input type="text" id="technology" name="technology"><br><br>

    <label for="topic">Topic:</label>
    <input type="text" id="topic" name="topic"><br><br>

    <label for="question">Question:</label>
    <input type="text" id="question" name="question" required><br><br>
	
	<label for="option1">Option 1:</label>
    <input type="text" id="option1" name="option1" required><br><br>

    <label for="option2">Option 2:</label>
    <input type="text" id="option2" name="option2" required><br><br>

    <label for="option3">Option 3:</label>
    <input type="text" id="option3" name="option3" required><br><br>

    <label for="option4">Option 4:</label>
    <input type="text" id="option4" name="option4" required><br><br>
    
      <label for="correctOption">Correct Option:</label>
    <input type="text" id="correctOption" name="correctOption" required><br><br>

    <label for="explanation">Explanation:</label>
    <input type="text" id="explanation" name="explanation" required><br><br>

    <input type="submit" value="Upload">
</form>
 
    </body>

    </html>