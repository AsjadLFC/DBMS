<%-- 
    Document   : addpeople
    Created on : Apr 17, 2015, 2:43:25 PM
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
<html>
    <head><%@include file="loginchecker.jsp" %>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="profile.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Not Decided</title>
    </head>
    <body>
        <div class="container">
            <div class="heading">
                <h1>Not Decided</h1>
            </div>
            <form class="form" method="get" action="addpeoplejava.jsp">
                <div class="form_header">
                    <h1 class="form-heading">Anime/TV Shows</h1>
                    <p class="profile_description">Add people to the database.</p>
                </div>
                <div class="form_content">
                    <div class="fieldset"><label>Avatar</label><input name="people_image" class="profile_input" data-role="avatar-file-upload" type="file"></div>
                    <div class="fieldset"><label class="showid">Show ID</label><select name="id" class="gender showid"><option value="<%= ShowID %>"><%= ShowID %></option></select></div>
                    <div class="fieldset"><label>First Name</label><input name="people_FName" class="profile_input" type="text"></div>
                    <div class="fieldset"><label>Last Name</label><input name="people_LName" class="profile_input" type="text"></div>
                    <div class="fieldset"><label>Type</label><select name="people_type" class="gender"><option value="Author">Author</option><option value="Producer">Producer</option></select></div>
                    <div class="fieldset"><label>Description</label><input name="people_desc" class="profile_input about" placeholder="Max Characters: 450" maxlength="450" type="text"></div>
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
