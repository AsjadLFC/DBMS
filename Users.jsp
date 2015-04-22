<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%-- 
    Document   : Users
    Created on : Apr 21, 2015, 7:14:55 PM
    Author     : programmercore
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="list.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <title>Users</title>
    </head>
    <%@include file="loginchecker.jsp" %>
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/MYANIMELISTBORN"
                       user="root"  password="I'm insane"/>
    
    <sql:query dataSource="${snapshot}" var="result">
        select * from User;        
    </sql:query>
    
    <body>
        <div class="container">

            <h1>Users List</h1>
            <p>Click on the User to delete from database.</p>
            <br>
            <table width="100%">
                <tr class="search_space">
                    <th class="normal_header" >ID.</td>
                    <th class="normal_header" >Name</td>
                    <th class="normal_header" >Email</td>
                    <th class="normal_header" nowrap="" >Type</td>
                </tr>
                <c:forEach items="${result.rows}" var="row">
                <tr>
                    <td class="show_info" align="center" ><c:out value="${row.User_ID}" /></td>
                    <td class="show_info" align="center" ><c:out value="${row.F_Name}" /> <c:out value="${row.L_Name}" /></a></td>
                    <td class="show_info extra" align="center" ><c:out value="${row.Email}" /></td>
                    <td class="show_info extra" align="center" ><c:out value="${row.Type}" /></td>
                </tr>
                </c:forEach>
            </table>	

        </div>
    </body>
</html>