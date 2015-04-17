<%-- 
    Document   : addpeoplejava
    Created on : Apr 17, 2015, 2:48:59 PM
    Author     : programmercore
--%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    String First_Name = request.getParameter("people_FName");
    String L_Name = request.getParameter("people_LName");
    String type = request.getParameter("people_type");
    String description = request.getParameter("people_desc");
    int id = Integer.parseInt(request.getParameter("id"));
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/MYANIMELISTBORN");
    
    String sql = "insert into People(Type,Description,F_Name,L_Name) values (?,?,?,?);";
    PreparedStatement mystmt = con.prepareStatement(sql);
    mystmt.setString(1, type);
    mystmt.setString(2, description);
    mystmt.setString(3, First_Name);
    mystmt.setString(4, L_Name);
    
    mystmt.executeUpdate();
        if(type == "Author"){
        String secondsql ="insert into Writen_By(Show_ID,P_ID) "
                + "values (?,(select P_ID from People "
                + "where Type=? and Description=? and F_Name=? and L_Name=?));";
    
        PreparedStatement mystmt2 = con.prepareStatement(secondsql);
        mystmt2.setInt(1, id);
        mystmt2.setString(2, type);
        mystmt2.setString(3, description);
        mystmt2.setString(4, First_Name);
        mystmt2.setString(5, L_Name);
    
        mystmt2.executeUpdate();
    }else{
                String secondsql ="insert into Produced_By(Show_ID,P_ID) "
                + "values (?,(select P_ID from People "
                + "where Type=? and Description=? and F_Name=? and L_Name=?));";
    
        PreparedStatement mystmt2 = con.prepareStatement(secondsql);
        mystmt2.setInt(1, id);
        mystmt2.setString(2, type);
        mystmt2.setString(3, description);
        mystmt2.setString(4, First_Name);
        mystmt2.setString(5, L_Name);
    
        mystmt2.executeUpdate();
    }
%><c:redirect url="profilepage.jsp" ></c:redirect>
