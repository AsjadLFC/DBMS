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
        <title>Review</title>
    </head>

    <body>
        <%@include file="loginchecker.jsp" %>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/MYANIMELISTBORN"
                           user="root"  password="I'm insane"/>
        
        <sql:query dataSource="${snapshot}" var="result">
                select RB.*,U.* from User U, Reviewed_By RB where U.User_ID=RB.User_ID and RB.Show_ID = <%= ShowID %>;
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
                                <th class="normal_header" width="80%"><a href="">Review</a></td>
                            </tr>
                        <form action="addreview.jsp" class="search_form"><tr>
                                <td class="show_info extra" align="center"><select><option value="">Name</option></select></td><div class="showname"><select class="showname" name="show_name" ><option value="<%= ShowID %>"><%= ShowID %></option></select></div>
                                <td class="show_info extra" align="center"><input name="content" class="review_input_field" placeholder="Submit Review" type="text" ><input class="review_submit" value="Submit" type="submit" ></td>
                            </tr></form>
                        <c:forEach var="row" items="${result.rows}">
                        <tr>
                            <td class="show_info" align="center"><c:out value="${row.F_Name}" /></td>
                            <td class="show_info extra" align="center"><c:out value="${row.content}" /></td>
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