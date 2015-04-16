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
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8080/employeee",
            "root", "I'm insane");
    Statement st = con.createStatement();
    
    st.executeUpdate("insert into table(Name, Gender, DOB, Nationality, About) value('" + name + "','" + gender + "','" + DOB  + "','" + nationality + "','" + about);
    
    
%>