<%-- 
    Document   : editshowinfo
    Created on : Apr 16, 2015, 7:53:15 PM
    Author     : programmercore
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String image = request.getParameter("show_image");
    int episodes = Integer.parseInt(request.getParameter("show_episodes"));
    String status = request.getParameter("show_status"); 
    String synopsis = request.getParameter("show_synopsis");
    int ShowID = Integer.parseInt(request.getParameter("id"));
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/MYANIMELISTBORN",
            "root", "I'm insane");
    String sql = "update Shows set episodes=? and status=? and synopsis=? where Show_ID=?";
    PreparedStatement prepstmt = con.prepareStatement(sql);
    prepstmt.setInt(1,episodes);
    prepstmt.setString(2,status);
    prepstmt.setString(3,synopsis);
    prepstmt.setInt(4,ShowID);
    
    prepstmt.executeUpdate();
%><c:redirect url="profilepage.jsp" ></c:redirect>
