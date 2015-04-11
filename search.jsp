<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%-- 
    Document   : search
    Created on : Mar 21, 2015, 10:23:43 PM
    Author     : programmercore
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8"/>
        <link rel="stylesheet" href="search.css"/>
        <link rel="stylesheet" href="reset.css"/>
        <title>Not Decided</title>
    </head>

    <body>
        <%@include file="loginchecker.jsp" %>
        <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/employeee"
                           user="root"  password="I'm insane"/>

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
                            <li><a href="" >Home</a></li>
                            <li><a href="" >Profile</a></li>
                            <li><a href="" >Series list</a></li>
                            <li><a href="logout.jsp" >Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>


            <sql:query dataSource="${snapshot}" var="result">
                SELECT * from EMP where ename like '%${param.searchparameter}%';
            </sql:query>

            <div class="search_results">
                <div class="result_field">
                    <table cellspacing="0" cellpadding="0" border="0" width="100%">
                        <tbody>
                            <tr class="search_space">
                                <th class="normal_header">Search Results</td>
                                <th class="normal_header" width="10%"><a href="">Type</a></td>
                                <th class="normal_header" width="10%" nowrap=""><a href="">Eps.</a></td>
                                <th class="normal_header" width="10%" nowrap=""><a href="">Score</a></td>
                            </tr>
                            <c:forEach var="row" items="${result.rows}">
                                <tr>
                                    <td class="show_info" align="center"><a href="showstemplate.jsp?show=${row.ename}"><span id="enameval"><c:out value="${row.ename}"/></span></a></td>
                                    <td class="show_info extra" align="center"><c:out value="${row.empno}"/></td>
                                    <td class="show_info extra" align="center"><c:out value="${row.mgr}"/></td>
                                    <td class="show_info extra" align="center"><c:out value="${row.hiredate}"/></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <script src="jquery.js"></script>
                    <script type="javascript">
                                function ClickMe_Click(){
                                    var enamevalue=document.getElementById('enameval').innerHTML;
                                    $.ajax({
                                        type:   "post",
                                        url:    "showstemplate.jsp",
                                        data:   {"dimensionName":enamevalue},
                                        success:    function(msg){
                                            alert(msg.data);
                                        },
                                        error:function(xhr,ajaxOptions,thrownError){
                                            alert(xhr.status);
                                            alert(thrownError);
                                        }
                                    });
                                    return false;
                                }
                    </script>
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
