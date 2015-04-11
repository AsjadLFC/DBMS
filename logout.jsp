<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : logout
    Created on : Mar 23, 2015, 1:50:48 AM
    Author     : programmercore
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logged out</title>
    </head>
    <body>
        <%
            session.removeAttribute("loginUser");
        %>

        <c:redirect url="index.jsp" />
    </body>
</html>
