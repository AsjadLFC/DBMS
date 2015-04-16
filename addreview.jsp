<%-- 
    Document   : addreview
    Created on : Apr 16, 2015, 9:43:45 PM
    Author     : programmercore
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String content = request.getParameter("content");
    int showID = Integer.parseInt(request.getParameter("show_name"));
    String User = (String) session.getAttribute("theName");
%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/MYANIMELISTBORN"
                   user="root" password="I'm insane"/>

<sql:query dataSource="${snapshot}" var="UserID">
    select * from User where Email = '<%= User %>';
</sql:query>

<c:forEach var="row" items="${UserID.rows}">
    <sql:update dataSource="${snapshot}" var="selectQ">
        insert into Reviewed_By(User_ID, Show_ID, Content)
        values (${row.User_ID}, <%= showID%>, '<%= content %>');
    </sql:update>
</c:forEach>
<c:redirect url="editshow.jsp?id=<%= showID%>" />