<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
    int ShowID = Integer.parseInt(request.getParameter("id"));
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="search.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <title>Recommendation</title>
    </head>

    <body>
        <%@include file="loginchecker.jsp" %>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/MYANIMELISTBORN"
                           user="root"  password="I'm insane"/>

        <sql:query dataSource="${snapshot}" var="recommendation">
            select s.Show_ID,concat(u.F_Name) as Name,r.Description as Description,s.Title as Title from Recommendation r, Shows s, User u
            where r.Show_ID_one=<%=ShowID%> and s.Show_ID = r.Show_ID_two and r.User_ID = u.User_ID;
        </sql:query>

        <div class="container">

            <div class="top_bar">
                <h1>Not Decided</h1>		
            </div>


            <div class="search_bar">
                <form class="search_form" method="get" action="search.jsp">
                    <input name="searchparameter" class="search_input" placeholder="Search" type="text">
                    <input value="Go" type="submit">
                </form>
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


            <div class="search_results">
                <div class="result_field">
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tbody>
                            <tr class="search_space">
                                <th class="normal_header" nowrap="" >Name</td>
                                <th class="normal_header" nowrap="" ></td>
                                <th class="normal_header" width="80%"><a href="">Review</a></td>
                            </tr>
                        <form action="addrecommendation.jsp" class="search_form"><tr>
                                <td class="show_info extra" align="center"><select><option value="">Name</option></select></td><div class="showname"><select class="showname" name="show_name" ><option value="<%= ShowID%>"><%= ShowID%></option></select></div>
                            <td class="show_info extra" align="center"><input class="review_input_field" placeholder="Show Name" type="text" name="recom_name" ><input name="description" class="review_input_field" placeholder="Description" type="text" ><input class="review_submit" value="save" type="submit" ></td>
                                <th class="normal_header" nowrap="" ></td>						
                            </tr></form>
                        <c:forEach var="row" items="${recommendation.rows}">
                        
                        <tr>
                            <td class="show_info" align="left"><c:out value="${row.Name}" /></td>
                            <td class="show_info extra desc" align="center"><c:out value="${row.Description}" /></td>
                            <td class="show_info extra" align="center" ><a href="showstemplate.jsp?id=${row.Show_ID}" ><c:out value="${row.Title}" /></td>
                        </tr>
                        </c:forEach>
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