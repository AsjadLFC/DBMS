<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration page</title>
    </head>
    <body>
        <c:if test="${ empty param.user_name or empty param.user_pass or empty param.user_mail}">
            <c:redirect url="index.jsp" >
                <c:param name="errMsg" value="Please Enter UserName and Password" />
            </c:redirect>

        </c:if>

        <c:if test="${not empty param.user_name and not empty param.user_pass and not empty param.user_mail}">
            <sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
                               url="jdbc:mysql://localhost/MYANIMELISTBORN"
                               user="root" password="I'm insane"/>

            <sql:query dataSource="${ds}" var="check">
                select count(*) as count from User where Email='${param.user_mail}';
            </sql:query>
            <c:forEach items="${check.rows}" var="row">
                <c:choose>
                    <c:when test="${row.count gt 0}">
                        <c:redirect url="index.jsp" >
                            <c:param name="errMsg" value="Already Exists" />
                        </c:redirect>
                    </c:when>
                    <c:otherwise>
                        <sql:update dataSource="${ds}" var="selectQ">
                            insert into User(Email,Password,F_Name)
                            Values('${param.user_mail}','${param.user_pass}','${param.user_name}')
                        </sql:update>
                        <c:redirect url="login.jsp"></c:redirect> 
                    </c:otherwise>        
                </c:choose>
            </c:forEach>
        </c:if>
    </body>
</html>