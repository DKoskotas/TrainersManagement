<%-- 
    Document   : listTrainer
    Created on : Dec 10, 2019, 10:00:11 AM
    Author     : jimmi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List of Trainer</title>
        <link rel="stylesheet"
              href="${pageContext.request.contextPath}/static/css/style.css">
    </head>
    <body>
        <h1>List of Trainers:</h1>
        <div cssClass="create">
            <a href="${pageContext.request.contextPath}/trainer/create">Create Trainer</a>
            <br/>
            <form:form action="${pageContext.request.contextPath}/trainer/search" method="GET">
                Search with Last Name:<input type="text" name="search">
                <input type="submit" value="Search">
            </form:form>
                <br/>
        <a href="${pageContext.request.contextPath}">Back to main page</a>
        </div>
        <table border="1">
            <c:forEach items="${listOfTrainer}" var="c">
                <c:url var="deleteLink" value="/trainer/delete">
                    <c:param name="trainerId" value="${c.trainerid}" />
                </c:url>
                <c:url var="updateLink" value="/trainer/update">
                    <c:param name="trainerId" value="${c.trainerid}" />
                </c:url>
                <tr>
                    <td class="data">${c.trainerid}</td>
                    <td class="data">${c.firstName}</td>
                    <td class="data">${c.lastName}</td>
                    <td class="data">${c.tSubject}</td>
                    <td class="data">
                        <a href="${updateLink}" class="tablelink">Update</a>
                    </td>
                    <td class="data">
                        <a href="${deleteLink}" class="tablelink"
                           onclick="if (!(confirm('Are you sure you want to delete the trainer with full name  ${c.firstName} ${c.lastName}?')))
                                       return false">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
                <div>
                <img src="https://www.linkedin.com/media-proxy/ext?w=1200&h=675&hash=AlyMjKo3rICZ%2Fa%2BXWxTdS9vSGcA%3D&ora=1%2CaFBCTXdkRmpGL2lvQUFBPQ%2CxAVta5g-0R6plxVUzgUv5K_PrkC9q0RIUJDPBy-kXCas-tafZXDqf8fcZLSiol4UeioAmQY7fOqvRDDnEI69LcLmY4Yx3A" alt="Trainers teaching">
                </div>
                <br/>
        <footer>
            “True knowledge exists in knowing that you know nothing.” – Socrates
        </footer>
    </body>
</html>
