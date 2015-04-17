<%-- 
    Document   : profileupdate
    Created on : Apr 11, 2015, 8:04:21 PM
    Author     : programmercore
--%>

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
    String Fname = request.getParameter("pr_Fname");
    String Lname = request.getParameter("pr_Lname");
    String Type = request.getParameter("pr_type");   
    String image = request.getParameter("pr_image");
    String gender = request.getParameter("pr_gender"); 
    String nationality = request.getParameter("pr_country");
    String about = request.getParameter("pr_about");
    String User = (String)session.getAttribute("theName");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/MYANIMELISTBORN",
            "root", "I'm insane");
    String sql = "update User set F_Name=?, L_Name=?, Gender=?, Country=?, Type=?, About=? where Email=? and User_ID>0;";
    PreparedStatement mystmt = con.prepareStatement(sql);
    mystmt.setString(1, Fname);
    mystmt.setString(2, Lname);
    mystmt.setString(3, gender);
    mystmt.setString(4, nationality);
    mystmt.setString(5, Type);
    mystmt.setString(6, about);
    mystmt.setString(7, User);
    mystmt.executeUpdate();
%><c:redirect url="profilepage.jsp" ></c:redirect>