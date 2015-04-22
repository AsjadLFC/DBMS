<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
    int PeopleID = Integer.parseInt(request.getParameter("id"));
%>

<html>
    <head>
        <link rel="stylesheet" href="people.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <title>Not Decided</title>
    </head>

    <%@include file="loginchecker.jsp" %>
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/MYANIMELISTBORN"
                       user="root"  password="I'm insane"/>

    <sql:query dataSource="${snapshot}" var="people">
        select * from People where P_ID = <%=PeopleID%>
    </sql:query>

    <sql:query dataSource="${snapshot}" var="peopleinfo">
        select C.F_Name as F_Name, C.L_Name as L_Name, S.Show_ID as Show_ID,
        concat(S.Title) as Title from Played_By PB, Shows S,
        Characters C where S.Show_ID = PB.Show_ID and 
        PB.C_ID = C.C_ID and PB.P_ID = <%=PeopleID%>
    </sql:query>

    <body>
        <br><div class="formsearch">
            <form class="search_form" action="search.jsp" method="get">
                <input class="search_input" placeholder="Search" type="text">
                <input value="Go" type="submit">
            </form>
        </div>
        <div class="container">
            <p class="edit_profile"><a href="profile.jsp">Edit Profile</a> <a href="list.jsp">List</a> <a href="logout.jsp">Logout</a></p>
            <div class="information">
                <div class="profile_image">

                </div>

                <div class="profile_info">
                    <c:forEach items="${people.rows}" var="row">
                        <div class="about">
                            <h2>About:</h2>
                            <p><c:out value="${row.Description}" /></p>					
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="stats_and_favorites">
                <div class="char_info">
                    <h2>Appearances</h2>
                    <br>
                    <div class="heading">
                        <table width="100%">
                            <tbody>
                                <c:forEach items="${peopleinfo.rows}" var="row">
                                <tr>
                                    <td class="char_name"><c:out value="${row.F_Name}" /> <c:out value="${row.L_Name}" /></td>
                                    <td class="peop_name"><a href="showstemplate.jsp?id=${row.Show_ID}" ><c:out value="${row.Title}" /></a></td>								
                                </tr>
                                </c:forEach>
                            </tbody>						
                        </table>
                    </div>
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