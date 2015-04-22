<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
    int ShowID = Integer.parseInt(request.getParameter("id"));
    String related = request.getParameter("show_related");
%>

<c:if test="${ empty param.show_related}">
    <c:redirect url="related.jsp" >
        <c:param name="errMsg" value="Please Enter Related" />
    </c:redirect>
</c:if>

<c:if test="${not empty param.show_related}">
    <s:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                     url="jdbc:mysql://localhost/MYANIMELISTBORN"
                     user="root" password="I'm insane"/>

    <s:update dataSource="${ds}" var="selectQ">
        insert into Related_Shows(Show_ID, R_Show_ID)
        values (<%=ShowID%>,(select Show_ID from Shows where Show_ID > 0 and Title = '<%=related%>'));
    </s:update>

        <c:redirect url="profilepage.jsp"></c:redirect>
</c:if>
