<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int ShowID = Integer.parseInt(request.getParameter("id"));
    String genre = request.getParameter("show_genre");
%>

<c:if test="${ empty param.show_genre}">
    <c:redirect url="genre.jsp" >
        <c:param name="errMsg" value="Please Enter Genre" />
    </c:redirect>
</c:if>

<c:if test="${not empty param.show_genre}">
    <s:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                     url="jdbc:mysql://localhost/MYANIMELISTBORN"
                     user="root" password="I'm insane"/>

    <s:update dataSource="${ds}" var="selectQ">
        insert into Genres(Show_ID, Genre) values (<%=ShowID%>,'<%=genre%>');
    </s:update>

        <c:redirect url="profilepage.jsp"></c:redirect>
</c:if>
