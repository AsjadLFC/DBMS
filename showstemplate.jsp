<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%-- 
    Document   : showstemplate
    Created on : Mar 15, 2015, 8:01:41 PM
    Author     : programmercore
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int ShowID = Integer.parseInt(request.getParameter("id"));
%>
<html    
    <head>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/MYANIMELISTBORN"
                           user="root" password="I'm insane"/>

        <sql:query dataSource="${snapshot}" var="result">
            SELECT * from Shows where Show_ID = <%= ShowID%>;
        </sql:query>

        <sql:query dataSource="${snapshot}" var="producer">
            select P.*,PB.* from People P,Produced_By PB where P.P_ID=PB.P_ID and Show_ID = <%= ShowID%>;
        </sql:query>

        <sql:query dataSource="${snapshot}" var="author">
            select P.*,PB.* from People P,Writen_By PB where P.P_ID=PB.P_ID and Show_ID = <%= ShowID%>;
        </sql:query>

        <sql:query dataSource="${snapshot}" var="score">
            select Round(avg(Score),2) as score from Listed where Show_ID = <%= ShowID%> and Status='Completed';
        </sql:query>


        <meta charset="utf-8"/>
        <link rel="stylesheet" href="showstemplate.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <title><c:forEach var="row" items="${result.rows}"><c:out value="${row.Title}" /></c:forEach><%--<%= st.executeQuery("select Title from Shows where Show_ID = " + ShowID) %>--%></title>
        </head>

        <body>
        <%@include file="loginchecker.jsp" %>

        <div class="container">
            <div class="top_bar">
                <h1>Not Decided</h1>
                <ul id="menu">
                    <li><a href="" >options</a>
                        <ul class="sub_menu">
                            <li><a href="profilepage.jsp" >Home</a></li>
                            <li><a href="profilepage.jsp" >Profile</a></li>
                            <li><a href="list.jsp" >Series list</a></li>
                            <li><a href="logout.jsp" >Logout</a></li>
                        </ul>
                    </li>
                </ul>

            </div>

            <div class="series_description">
                <div class="series_image"></div>
                <div class="description"><div class="container_desc">
                        <h1 id="show_name"><c:forEach var="row" items="${result.rows}"><c:out value="${row.Title}" /></c:forEach></h1>
                        <h2>Synopsis</h2><p><c:forEach var="row" items="${result.rows}"><c:out value="${row.Synopsis}" /></c:forEach></p>
                    </div><p class="additional_info"><a href="editshow.jsp?id=<%= ShowID%>">Edit</a> <a href="">List</a> <a href="review.jsp?id=<%= ShowID%>">Reviews</a></p>
                </div>
            </div>
            <<div class="further_description">
                <div class="information">
                    <h3>Information</h3>
                    <ol>
                        <li>Name: <c:forEach var="row" items="${result.rows}"><c:out value="${row.Title}" /></c:forEach></li>
                        <li>Status: <c:forEach var="row" items="${result.rows}"><c:out value="${row.Status}" /></c:forEach></li>
                        <li>Episodes: <c:forEach var="row" items="${result.rows}"><c:out value="${row.Episodes}" /></c:forEach></li>
                        <li>Airdate: <c:forEach var="row" items="${result.rows}"><c:out value="${row.Airdate}" /></c:forEach></li>
                        <li>Producers: <c:forEach var="prow" items="${producer.rows}"><c:out value="${prow.F_Name}" /><c:out value=" "/></c:forEach></li>
                        <li>Authors: <c:forEach var="arow" items="${author.rows}"><c:out value="${arow.F_Name}" />,<c:out value=" "/></c:forEach></li>
                    </ol><br>
                    <h3>Statistics</h3>
                    <ol>
                        <li>Score: <c:forEach var="scor" items="${score.rows}"><c:out value="${scor.score}" /></c:forEach></li>
                        <li>Rank: </li>
                        <li>Popularity: </li>
                    </ol>
                </div>
                <div class="actors_voice">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tbody>
                            <tr>
                                <th class="table_heading" >Actors/Voice</td>
                                <th class="table_heading" >Played By</td>
                            </tr>
                            <tr>
                                <td></td>
                                <td></td>					
                            </tr>
                        </tbody>
                    </table>
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


