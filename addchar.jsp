<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    int ShowID = Integer.parseInt(request.getParameter("ShowID"));
    int ActID = Integer.parseInt(request.getParameter("peopleID"));
    String charfname = request.getParameter("char_FName");
    String charlname = request.getParameter("char_LName");
    String chardesc = request.getParameter("char_desc");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost/MYANIMELISTBORN",
            "root","I'm insane");
    
    String sql2 = "insert into Characters(F_Name,L_Name,Description) values (?,?,?);";
    PreparedStatement mystmt2 = con.prepareStatement(sql2);
    mystmt2.setString(1, charfname);
    mystmt2.setString(2, charlname);
    mystmt2.setString(3, chardesc);
    mystmt2.executeUpdate();
    
    String sql3 = "insert into Played_By(P_ID,C_ID,Show_ID)"
            + "values (?,(Select C_ID from Characters where "
            + "F_Name=? and L_Name=? and Description=? and C_ID > 0),?)";
    
    PreparedStatement mystmt3 = con.prepareStatement(sql3);
    mystmt3.setInt(1, ActID);
    mystmt3.setString(2, charfname);
    mystmt3.setString(3, charlname);
    mystmt3.setString(4, chardesc);
    mystmt3.setInt(5, ShowID);
    mystmt3.executeUpdate();
%><c:redirect url="profilepage.jsp"></c:redirect>