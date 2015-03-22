<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : login
    Created on : Feb 1, 2015, 4:12:24 PM
    Author     : programmercore
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="login.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <div class="container">
            <div class="heading">
                <h1>Not Decided</h1>
            </div>
            <div id="login_field"></div>
            <div class="place1">
                <form class="login_form" method="get" action="loginauthenticate.jsp">
                    <input name="username" class="login_input" placeholder="Email" type="text">
                    <input name="password" class="login_input" placeholder="Password" type="password"><br>
                    <input value="Login" type="submit">
                </form>

                <p class="error"><c:if test="${not empty param.errMsg}">
                    <c:out value="${param.errMsg}" />
                </c:if></p>

            </div>
            <div id="footer"><div class="footer">
                    <a target = "_blank" href="https://www.twitter.com/asjadsohail" >Twitter</a>
                    <a target = "_blank" href="#" >Facebook</a>
                    <a target = "_blank" href="/terms" >Terms</a>
                    <a target = "_blank" href="/terms" >Privacy Policy</a>
                    <a target = "_top" href="mailto:asjadsohail@gmail.com" >Contact</a>
                </div></div>
        </div>
    </body>
</html>