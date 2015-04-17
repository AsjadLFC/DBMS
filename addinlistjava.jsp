<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
    int ShowID = Integer.parseInt(request.getParameter("id"));
    int score = Integer.parseInt(request.getParameter("score"));
    int progress = Integer.parseInt(request.getParameter("progress"));
    String status = request.getParameter("status");
    String User = (String) session.getAttribute("theName");
%>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                   url="jdbc:mysql://localhost/MYANIMELISTBORN"
                   user="root" password="I'm insane"/>

<sql:query dataSource="${snapshot}" var="UserID">
    select * from User where Email = '<%= User%>';
</sql:query>

<c:forEach var="row" items="${UserID.rows}">
    <sql:update dataSource="${snapshot}" var="selectQ">
        insert into Listed(User_ID,Show_ID,Status,Score,Progress)
        values (${row.User_ID}, <%= ShowID%>, '<%= status%>',<%= score%>,<%= progress%>);
    </sql:update>
</c:forEach>
<c:redirect url="profilepage.jsp"></c:redirect>
