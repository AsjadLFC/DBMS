<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%-- 
    Document   : profilepage
    Created on : Mar 25, 2015, 7:24:36 PM
    Author     : programmercore
--%>

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
                           url="jdbc:mysql://localhost/employeee"
                           user="root"  password="I'm insane"/>
        
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
                            <li>Name: Bastian Schweinsteger</li>
                            <li>Age: 30</li>
                            <li>Gender: Male</li>
                            <li>Country: Germany</li>
                            <li>DOB: 1 Aug 1984</li>
                        </ul>
                    </div>			

                    <div class="about">
                        <h2>About Me:</h2>
                        <p>a</p>					
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