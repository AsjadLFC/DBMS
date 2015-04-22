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
            <form class="form" method="get" action="addgenre.jsp">
                <div class="form_header">
                    <h1 class="form-heading">Edit Info</h1>
                    <p class="profile_description">Add Genre to the Show.</p>
                </div>
                <div class="form_content">
                    <div class="fieldset"><label class="showid">Show ID</label><select name="id" class="gender showid"><option value="<%= ShowID %>"><%= ShowID %></option></select></div>
                    <div class="fieldset"><label>Genre</label><input name="show_genre" class="profile_input" type="text"></div>
                    <div class="fieldset"><input value="Save" type="submit"></div>
                </div>
                    <p align="center" class="error"><c:if test="${not empty param.errMsg}">
                    <c:out value="${param.errMsg}" />
                </c:if></p>
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
