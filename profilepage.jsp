<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%-- 
    Document   : profilepage
    Created on : Mar 25, 2015, 7:24:36 PM
    Author     : programmercore
--%>

<%
    String User = (String)session.getAttribute("theName");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="profilepage.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <title>Not Decided</title>
    </head>

    <body>
        <%@include file="loginchecker.jsp" %>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/MYANIMELISTBORN"
                           user="root"  password="I'm insane"/>
        
        <sql:query dataSource="${snapshot}" var="profile">
            select * from User where Email="<%= User %>";
        </sql:query>
        
        <br><div class="formsearch">
            <form class="search_form" method="get" action="search.jsp">
                <input name="searchparameter" class="search_input" placeholder="Search" type="text">
                <input value="Go" type="submit">
            </form>
        </div>
        <div class="container">
            <p class="edit_profile"><a href="profile.jsp">Edit Profile</a></p>
            <div class="information">
                <div class="profile_image">

                </div>

                <div class="profile_info">
                    <div class="info">
                        <ul>
                            <li>Name: <c:forEach var="row" items="${profile.rows}"><c:out value="${row.F_Name}" /></c:forEach> <c:forEach var="row" items="${profile.rows}"><c:out value="${row.L_Name}" /></c:forEach></li>
                            <li>Gender: <c:forEach var="row" items="${profile.rows}"><c:out value="${row.Gender}" /></c:forEach></li>
                            <li>Country: <c:forEach var="row" items="${profile.rows}"><c:out value="${row.Country}" /></c:forEach></li>
                        </ul>
                    </div>			

                    <div class="about">
                        <h2>About Me:</h2><br>
                        <p><c:forEach var="row" items="${profile.rows}"><c:out value="${row.About}" /></c:forEach></p>					
                    </div>

                </div>
            </div>

            <div class="stats_and_favorites">
                <div class="stats">
                    <h2>Statistics</h2>
                    <div class="heading">
                        <ul>
                            <li>Time</li>
                            <li>Watching</li>
                            <li>Completed</li>
                            <li>Dropped</li>
                            <li>Total Entries</li>						
                        </ul>
                    </div>
                    <div class="heading_entries">
                        <ul>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>
                            <li></li>						
                        </ul>
                    </div>
                </div>
                <div class="favorites">

                </div>



            </div>

            <div id="footer">
                <div class="footer">
                    <a target = "_blank" href="https://www.twitter.com/asjadsohail" >Twitter</a>
                    <a target = "_blank" href="#" >Facebook</a>
                    <a target = "_blank" href="/terms" >Terms</a>
                    <a target = "_blank" href="/terms" >Privacy Policy</a>
                    <a target = "_top" href="mailto:asjadsohail@gmail.com" >Contact</a>
                </div>
            </div>	

        </div>

    </body>

</html>