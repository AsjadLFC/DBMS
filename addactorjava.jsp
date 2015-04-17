<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int ShowID = Integer.parseInt(request.getParameter("id"));
    String peopleavatar = request.getParameter("people_avatar");
    String peoplefname = request.getParameter("people_FName");
    String peoplelname = request.getParameter("people_LName");
    String peopletype = request.getParameter("people_type");
    String peopledesc = request.getParameter("people_desc");
    String charfname = request.getParameter("char_FName");
    String charlname = request.getParameter("char_LName");
    String chardesc = request.getParameter("char_desc");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/MYANIMELISTBORN");
    
    String sql = "insert into People(Type,Description,F_Name,L_Name) values (?,?,?,?);";
    PreparedStatement mystmt = con.prepareStatement(sql);
    mystmt.setString(1, peopletype);
    mystmt.setString(2, peopledesc);
    mystmt.setString(3, peoplefname);
    mystmt.setString(4, peoplelname);
    mystmt.executeUpdate();
    
    String sql2 = "insert into Characters(F_Name,L_Name,Description)"
            + " values (?,?,?);";
    PreparedStatement mystmt2 = con.prepareStatement(sql2);
    mystmt2.setString(1, charfname);
    mystmt2.setString(2, charlname);
    mystmt2.setString(3, chardesc);
    
    String sql3 = "insert into Played_By(Show_ID,C_ID,P_ID)"
            + "values(?,(select C_ID from "
            + "Characters where F_Name=? and Description=? and C_ID > 0),"
            + "(select P_ID from People where type=? and F_Name=? "
            + "and L_Name=? and Description=? and P_ID > 0));";
    PreparedStatement mystmt3 = con.prepareStatement(sql3);
    mystmt3.setInt(1, ShowID);
    mystmt3.setString(2, charfname);
    mystmt3.setString(3, charlname);
    mystmt3.setString(4, chardesc);
    mystmt3.setString(5, peopletype);
    mystmt3.setString(6, peoplefname);
    mystmt3.setString(7, peoplelname);
    mystmt3.setString(8, peopledesc);
    mystmt3.executeUpdate();
%><c:redirect url="profilepage.jsp"></c:redirect>