<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%-- 
    Document   : index
    Created on : Jan 29, 2015, 3:26:16 PM
    Author     : programmercore
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="main.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <title>Login || Register</title>
    </head>

    <body>
        <div class="container">
            <div class="contents">
                <div id="navigation">
                    <ul id="top_navigation">
                        <li><a href="">Anime</a></li>
                        <li><a href="">TV Serials</a></li>
                        <li><a class="reg_login" href="login.jsp">Login</a></li>	
                    </ul>
                </div>
                <div class="register_field">
                    <div class="reg_form">
                        <h2>Sign Up</h2><p class="error"><c:if test="${not empty param.errMsg}">
                                <c:out value="${param.errMsg}" />
                            </c:if></p>
                        <form class="form" method="get" action="registration.jsp">
                            <input name="user_name" type="text" placeholder="First Name"></input>
                            <input name="user_mail" type="email" placeholder="Email"></input>
                            <input name="user_pass" type="password" placeholder="Password"></input>
                            <input type="submit" value="Sign up"></input>
                        </form>
                    </div>
                </div>
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