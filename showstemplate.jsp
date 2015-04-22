<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int ShowID = Integer.parseInt(request.getParameter("id"));
    String User = (String) session.getAttribute("theName");
%>


<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/MYANIMELISTBORN"
                   user="root" password="I'm insane"/>

<sql:query dataSource="${snapshot}" var="genres">
    select * from Genres where Show_ID = <%=ShowID%> order by Genre
</sql:query>

<sql:query dataSource="${snapshot}" var="related">
    select concat(r.Title) as Title from Shows r, Related_Shows RS where RS.R_Show_ID = r.Show_ID and RS.Show_ID=<%=ShowID%>;
</sql:query>    

<sql:query dataSource="${snapshot}" var="result">
    SELECT * from Shows where Show_ID = <%= ShowID%>;
</sql:query>

<sql:query dataSource="${snapshot}" var="actors">
    select p.P_ID as P_ID, concat(p.F_Name," " ,p.L_Name) as Actor, concat(c.F_Name) as Role
    from Characters c, People p, Played_By pb 
    where Show_ID=<%= ShowID%> and p.P_ID=pb.P_ID and c.C_ID=pb.C_ID;
</sql:query>

<sql:query dataSource="${snapshot}" var="producer">
    select P.*,PB.* from People P,Produced_By PB where P.P_ID=PB.P_ID and Show_ID = <%= ShowID%>;
</sql:query>

<sql:query dataSource="${snapshot}" var="author">
    select P.*,PB.* from People P,Writen_By PB where P.P_ID=PB.P_ID and Show_ID = <%= ShowID%>;
</sql:query>

<sql:query dataSource="${snapshot}" var="score">
    select Round(avg(Score),2) as score from Listed where Show_ID = <%= ShowID%>;
</sql:query>

<sql:query dataSource="${snapshot}" var="rank">
    SELECT z.rank FROM (
    SELECT t.Show_ID,t.score, t.No_of_Entries, @rownum := @rownum + 1 AS rank
    FROM ranks_popularity_vw t, (SELECT @rownum := 0) r
    ORDER BY Score desc
    ) as z WHERE Show_ID=<%=ShowID%>;
</sql:query>

<sql:query dataSource="${snapshot}" var="popularity">
    SELECT z.rank FROM (
    SELECT t.Show_ID,t.score, t.No_of_Entries, @rownum := @rownum + 1 AS rank
    FROM ranks_popularity_vw t, (SELECT @rownum := 0) r
    ORDER BY No_of_Entries desc
    ) as z WHERE Show_ID=<%=ShowID%>;
</sql:query>

<sql:query dataSource="${snapshot}" var="Admin">
    select count(*) as count from User
    where Email='<%=User%>' and type='Admin';
</sql:query>
<!DOCTYPE html>
<html>    
    <head>
        <link rel="stylesheet" href="showstemplate.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <title><c:forEach var="row" items="${result.rows}"><c:out value="${row.Title}" /></c:forEach></title>
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
                    </div><p class="additional_info"><c:forEach items="${Admin.rows}" var="r"><c:if test="${r.count gt 0}"><a href="char.jsp?id=<%= ShowID%>">Add Character</a> <a href="addactor.jsp?id=<%= ShowID%>">Add Actor/Character</a> <a href="addpeople.jsp?id=<%= ShowID%>">Add Producer/Writer</a> <a href="editshow.jsp?id=<%= ShowID%>">Edit</a> <a href="genre.jsp?id=<%= ShowID%>">Add Genre</a> <a href="related.jsp?id=<%= ShowID%>">Add Related</a> </c:if></c:forEach><a href="addinlist.jsp?id=<%= ShowID%>">List</a> <a href="review.jsp?id=<%= ShowID%>">Reviews</a> <a href="recommendation.jsp?id=<%= ShowID%>">Recommendations</a></p>
                        </div>
                    </div>
                    <div class="further_description">
                        <div class="information">
                            <h3>Information</h3>
                            <ol>
                                <li>Name: <c:forEach var="row" items="${result.rows}"><c:out value="${row.Title}" /></c:forEach></li>
                        <li>Status: <c:forEach var="row" items="${result.rows}"><c:out value="${row.Status}" /></c:forEach></li>
                        <li>Episodes: <c:forEach var="row" items="${result.rows}"><c:out value="${row.Episodes}" /></c:forEach></li>
                        <li>Genres: <c:forEach var="row" items="${genres.rows}"><c:out value="${row.Genre}" />, </c:forEach></li>
                        <li>Airdate: <c:forEach var="row" items="${result.rows}"><c:out value="${row.Airdate}" /></c:forEach></li>
                        <li>Producers: <c:forEach var="prow" items="${producer.rows}"><c:out value="${prow.F_Name}" /><c:out value=" "/></c:forEach></li>
                        <li>Authors: <c:forEach var="arow" items="${author.rows}"><c:out value="${arow.F_Name}" />,<c:out value=" "/></c:forEach></li>
                        </ol><br>
                        <h3>Statistics</h3>
                        <ol>
                            <li>Score: <c:forEach var="scor" items="${score.rows}"><c:out value="${scor.score}" /></c:forEach></li>
                        <li>Rank: <c:forEach var="row" items="${rank.rows}"><c:out value="${row.rank}" /></c:forEach></li>
                        <li>Popularity: <c:forEach var="row" items="${popularity.rows}"><c:out value="${row.rank}" /></c:forEach></li>
                        </ol>
                    </div>
                    <div class="actors_voice">
                        <table cellpadding="0" cellspacing="0" border="0" width="100%">
                            <tbody>
                                <tr>
                                    <th class="table_heading" >Character</th>
                                    <th class="table_heading" >Played By</th>
                                </tr>
                            <c:forEach items="${actors.rows}" var="row">
                                <tr>
                                    <td><c:out value="${row.Role}" /></td>
                                    <td><a href="people.jsp?id=${row.P_ID}"><c:out value="${row.Actor}" /></a></td>					
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table><br><br>

                    <h2>Related Shows</h2>
                    <br>
                    <c:forEach items="${related.rows}" var="row">

                        <sql:query dataSource="${snapshot}" var="id">
                            select * from Shows where Title = '${row.Title}'
                        </sql:query>

                        <p><c:forEach items="${id.rows}" var="idrow"><a href="showstemplate.jsp?id=${idrow.Show_ID}" ><c:out value="${row.Title}" />, </a></c:forEach></p>
                    </c:forEach>
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


