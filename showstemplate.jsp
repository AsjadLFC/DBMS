<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%-- 
    Document   : showstemplate
    Created on : Mar 15, 2015, 8:01:41 PM
    Author     : programmercore
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <% String token = request.getParameter("show"); %>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="showstemplate.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <title><%= token %></title>
    </head>

    <body>
        <%@include file="loginchecker.jsp" %>
        
        <div class="container">
            <div class="top_bar">
                <h1>Not Decided</h1>
                <ul id="menu">
                    <li><a href="" >options</a>
                        <ul class="sub_menu">
                            <li><a href="" >Home</a></li>
                            <li><a href="" >Profile</a></li>
                            <li><a href="" >Series list</a></li>
                            <li><a href="logout.jsp" >Logout</a></li>
                        </ul>
                    </li>
                </ul>

            </div>

            <div class="series_description">
                <div class="series_image"></div>
                <div class="description"><h1 id="show_name"></h1><h2>Synopsis</h2><p><%= request.getParameter("show")%></p></div>
            </div>
            <div class="further_description">
                <div class="information"></div>
                <div class="actors_voice"></div>
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