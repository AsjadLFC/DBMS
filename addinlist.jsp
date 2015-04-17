<%-- 
    Document   : addinlist
    Created on : Apr 17, 2015, 3:58:00 PM
    Author     : programmercore
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<% 
      int ShowID = Integer.parseInt(request.getParameter("id"));
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><%@include file="loginchecker.jsp" %>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="addinlist.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Not Decided</title>
    </head>
    <body>
        <div class="container">
            <div class="heading">
                <h1>Not Decided</h1>
            </div>
            <form action="addinlistjava.jsp" class="form" method="get">
                <div class="form_header">
                    <h1 class="form-heading">Anime/TV Shows</h1>
                    <p class="profile_description">Add in your List.</p>
                </div>
                <div class="form_content">
                    <div class="fieldset"><label>Score</label><select name="score" class="gender"><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option><option value="10">10</option></select></div>
                    <div class="fieldset"><label>Progress</label><input name="progress" placeholder="Episodes Watched" class="profile_input" type="text"></div>
                    <div class="fieldset"><label>Status</label><select name="status" class="gender"><option value="Watching">Watching</option><option value="Dropped">Dropped</option><option value="Completed">Completed</option></select></div>
                    <div class="fieldset"><label class="showname">Show Name</label><select name="id" class="showname"><option value="<%= ShowID %>"><%= ShowID %></option></select></div> 
                    <div class="fieldset"><input value="Add" type="submit"></div>
                </div>
            </form>
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
