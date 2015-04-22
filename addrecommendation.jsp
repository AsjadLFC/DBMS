<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String recomname = request.getParameter("recom_name");
    int showID = Integer.parseInt(request.getParameter("show_name"));
    String User = (String) session.getAttribute("theName");
    String desc = request.getParameter("description");
%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/MYANIMELISTBORN"
                   user="root" password="I'm insane"/>

<sql:query dataSource="${snapshot}" var="UserID">
    select * from User where Email = '<%= User%>';
</sql:query>

<c:forEach var="row" items="${UserID.rows}">
    <sql:update dataSource="${snapshot}" var="selectQ">
        insert into Recommendation(User_ID, Show_ID_one, Show_ID_two, Description)
        values (${row.User_ID}, <%= showID%>,(select Show_ID from Shows where Title = '<%=recomname%>' and Show_ID > 0) ,'<%= desc %>');
    </sql:update>
</c:forEach>
<c:redirect url="profilepage.jsp" />