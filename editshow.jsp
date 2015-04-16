<%-- 
    Document   : editshow
    Created on : Apr 16, 2015, 7:50:50 PM
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
    <head>
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
            <form class="form" method="get" action="editshowinfo.jsp">
                <div class="form_header">
                    <h1 class="form-heading">Edit Info</h1>
                    <p class="profile_description">Edit the information of the TV Show.</p>
                </div>
                <div class="form_content">
                    <div class="fieldset"><label>Show ID</label><select name="id" class="gender"><option value="<%= ShowID %>"><%= ShowID %></option></select></div>
                    <div class="fieldset"><label>Avatar</label><input name="show_image" class="profile_input" data-role="avatar-file-upload" type="file"></div>
                    <div class="fieldset"><label>Episodes</label><input name="show_episodes" class="profile_input" placeholder="No of Episodes if Finished" type="text"></div>
                    <div class="fieldset"><label>Status</label><select name="show_status" class="gender"><option value="Ongoing">Ongoing</option><option value="Finished">Finished</option></select></div>
                    <div class="fieldset"><label>Synopsis</label><input name="show_synopsis" class="profile_input about" placeholder="Max Characters: 450" maxlength="450" type="text"></div>
                    <div class="fieldset"><input value="Save" type="submit"></div>
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
