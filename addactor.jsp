<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int ShowID = Integer.parseInt(request.getParameter("id"));
%>

<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="addactor.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Not Decided</title>
    </head>
    <body>
        <div class="container">
            <div class="heading">
                <h1>Not Decided</h1>
            </div>
            <form class="form" action="addactorjava.jsp" method="get">
                <div class="form_header">
                    <h1 class="form-heading">Actor</h1>
                    <p class="profile_description">Add actor to the database.</p>
                </div>
                <div class="form_content">
                    <div class="fieldset"><label>Avatar</label><input name="people_avatar" class="profile_input" data-role="avatar-file-upload" type="file"></div>
                    <div class="fieldset"><label>First Name</label><input name="people_FName" class="profile_input" type="text"></div>
                    <div class="fieldset"><label>Last Name</label><input name="people_LName" class="profile_input" type="text"></div>
                    <div class="fieldset"><label>Type</label><select name="people_type" class="gender"><option value="Actor">Actor</option></select></div>
                    <div class="fieldset"><label class="showid">Show ID</label><select name="ShowID" class="gender showid"><option value="<%=ShowID%>"><%=ShowID%></option></select></div>
                    <div class="fieldset"><label>Description</label><input name="people_desc" class="profile_input about" placeholder="Max Characters: 450" maxlength="450" type="text"></div>
                </div>
                <div class="form_header">
                    <h1 class="form-heading">Character</h1>
                    <p class="profile_description">Add character the actor plays in the show.</p>
                </div>
                <div class="form_content">
                    <div class="fieldset"><label>First Name</label><input name="char_FName" class="profile_input" type="text"></div>
                    <div class="fieldset"><label>Last Name</label><input name="char_LName" class="profile_input" type="text"></div>
                    <div class="fieldset"><label>Description</label><input name="char_desc" class="profile_input about" placeholder="Max Characters: 450" maxlength="450" type="text"></div>
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