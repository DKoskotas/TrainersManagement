<%-- 
    Document   : formTrainer
    Created on : Dec 10, 2019, 10:03:33 AM
    Author     : jimmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add or Update Form</title>
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/static/css/style.css">
    </head>
    <body>
        <div>
            <c:choose>
                <c:when test="${trainer.trainerid ne 0}">
                    <h1>Update Trainer</h1>
                </c:when>
                <c:otherwise>
                    <h1>Create Trainer</h1>
                </c:otherwise>
            </c:choose>
            <form:form 
                action="${pageContext.request.contextPath}/trainer/create" 
                method="POST"
                modelAttribute="trainer">
                <form:hidden path="trainerid"/>
                First Name : <form:input path="firstName"/>
                <form:errors path="firstName" cssClass="error"/>
                <br/>
                Last Name : <form:input path="lastName"/>
                <form:errors path="lastName" cssClass="error"/>
                <br/>   
                Subject : <form:input path="tSubject"/>
                <form:errors path="tSubject" cssClass="error"/>
                <br/> 
                <input type="submit" value="Submit">
                <br/>
                <a href="${pageContext.request.contextPath}">Back to main page</a>
                <br/>
            </form:form>
            <img src="https://www.healthandcare.co.uk/user/products/large/evacuation_chair_train_the_trainer.jpg" alt="Trainer teaching">
        </div>
        <footer>
            “True knowledge exists in knowing that you know nothing.” – Socrates
        </footer>
    </body>
</html>
