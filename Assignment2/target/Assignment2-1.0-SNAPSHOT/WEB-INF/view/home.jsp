<%-- 
    Document   : home
    Created on : Dec 9, 2019, 7:31:00 PM
    Author     : jimmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Main page</title>
        <link rel="stylesheet"
            href="${pageContext.request.contextPath}/static/css/style.css">
    </head>
    <body>
        <h1>Trainer management application.</h1>
        <div id="btn">
        <button>
            <a href="${pageContext.request.contextPath}/trainer/list">Show Trainers</a>
        </button>
        </div>
        <br/>
        <div>
        <img src="http://www.talentshub-eg.com/images/blog/trainer-purpose.jpg" alt="Trainer teaching">
        </div>
        <footer>
            “True knowledge exists in knowing that you know nothing.” – Socrates
        </footer>
    </body>
    
</html>
