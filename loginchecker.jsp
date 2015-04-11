<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- 
    Document   : loginchecker
    Created on : Mar 23, 2015, 12:45:32 AM
    Author     : programmercore
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<c:if test="${empty sessionScope['loginUser']}">
    <c:redirect url="login.jsp" />
</c:if>