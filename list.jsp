<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%-- 
    Document   : list
    Created on : Mar 22, 2015, 10:04:15 PM
    Author     : programmercore
--%>
<%
    String User = (String) session.getAttribute("theName");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="list.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <title>Not Decided</title>
    </head>

  
    <body>
        <%@include file="loginchecker.jsp" %>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/MYANIMELISTBORN"
                           user="root"  password="I'm insane"/>
        
        <sql:query dataSource="${snapshot}" var="result">
            select s.Show_ID as Show_ID,s.Title as Title,l.Status as Status,l.Score as Score,l.Progress as Progress 
            from Listed l,Shows s 
            where s.Show_ID=l.Show_ID 
            and l.User_ID = (select User_ID from User where Email='<%=User%>' and User_ID >0 )
            order by Title;
        </sql:query>
        
        <div class="header">
            <div class="header_contents">
                <ul>
                    <li><a href="profilepage.jsp" >Home</li></a>
                    <li class="logout_anchor"><a href="logout.jsp" >Logout</li></a>
                </ul>
            </div>

        </div>

        <div class="container">

            <h1>Serials List</h1><br>
            <table width="100%">
                <tr class="search_space">
                    <th class="normal_header" >Title</td>
                    <th class="normal_header" width="10%">Score</td>
                    <th class="normal_header" width="10%" nowrap="">Type</td>
                    <th class="normal_header" width="10%" nowrap="">Progress</td>
                    <th class="normal_header" width="10%" nowrap="">Status</td>
                </tr>
                <c:forEach items="${result.rows}" var="row">
                <tr>
                    <td class="show_info" align="center"><a href="showstemplate.jsp?id=${row.Show_ID}"><c:out value="${row.Title}"/></a></td>
                    <td class="show_info extra" align="center"><c:out value="${row.Score}"/></td>
                    <td class="show_info extra" align="center">TV</td>
                    <td class="show_info extra" align="center"><c:out value="${row.Progress}"/></td>
                    <td class="show_info extra" align="center"><c:out value="${row.Status}"/></td>
                </tr>
                </c:forEach>
            </table>

        </div>
    </body>

</html>
