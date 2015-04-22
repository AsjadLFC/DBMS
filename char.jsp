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
        <link rel="stylesheet" href="search.css"/>
        <link rel="stylesheet" href="char.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <title>Not Decided</title>
    </head>

    <body>
        <%@include file="loginchecker.jsp" %>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/MYANIMELISTBORN"
                           user="root"  password="I'm insane"/>

        <div class="container">

            <div class="top_bar">
                <h1>Not Decided</h1>		
            </div>

            <sql:query dataSource="${snapshot}" var="result">
                SELECT * from People where Type = 'Actor' order by P_ID;
            </sql:query>

            <div class="search_results">
                <div class="result_field">
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tbody>
                            <tr class="search_space">
                                <th class="normal_header">Search Results</th>
                                <th class="normal_header"><a href="">First Name</a></th>
                                <th class="normal_header" nowrap=""><a href="">Last Name</a></th>
                            </tr>
                            <c:forEach var="row" items="${result.rows}">

                                <tr>
                                    <td class="show_info" align="center"><c:out value="${row.P_ID}"/></td>
                                    <td class="show_info extra" align="center"><c:out value="${row.F_Name}"/></td>
                                    <td class="show_info extra" align="center"><c:out value="${row.L_Name}"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                
                <form class="form" action="addchar.jsp" method="get">
                <div class="form_header"><h1 class="form-heading">Character</h1>
                    <p class="profile_description">Add character the actor plays in the show.</p>
                </div>
                <div class="form_content">
                    <div class="fieldset"><label class="showid">Show ID</label><select name="ShowID" class="gender showid"><option value="<%=ShowID%>"><%=ShowID%></option></select></div>
                </div>
                <div class="form_header">
                    </div>
                <div class="form_content">
                    <div class="fieldset"><label>Actor ID</label><input name="peopleID" class="profile_input" type="text"></div>
                    <div class="fieldset"><label>First Name</label><input name="char_FName" class="profile_input" type="text"></div>
                    <div class="fieldset"><label>Last Name</label><input name="char_LName" class="profile_input" type="text"></div>
                    <div class="fieldset"><label>Description</label><input name="char_desc" class="profile_input about" placeholder="Max Characters: 450" maxlength="450" type="text"></div>
                    <div class="fieldset"><input value="Save" type="submit"></div>
                </div>
            </form>
                
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
